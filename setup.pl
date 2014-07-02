#!/usr/bin/env perl

use List::Util qw(first);
use Time::HiRes qw(time);
use Term::ANSIColor qw(:constants);
$Term::ANSIColor::AUTORESET = 1;

@scripts = undef;

%menus = (
  'l' => {
    'sub' => 'ListScripts',
    'desc' => 'List scripts'
  },
  'a' => {
    'sub' => 'RunAll',
    'desc' => 'Run all scripts'
  },
  'q' => {
    'sub' => 'Exit',
    'desc' => 'Exit'
  }
);

sub Prepare {
  `mkdir -p tmp`
}

sub ReadScripts {
  @scripts = ();
  opendir my $dir, './setup.d';
  while ($file = readdir($dir)) {
    push @scripts, $file unless $file =~ /^\.{1,2}$/;
  }
  closedir $dir;
  @scripts = sort { $a <=> $b } @scripts;
}

sub MainMenu {
  print YELLOW "Setup options:\n";
  print "$_) ${menus{$_}->{'desc'}}\n" foreach (sort keys %menus);
  print 'Your choice: ';
  my $choice = <STDIN>;
  chomp $choice;
  if (my $script = first { index($_, $choice) == 0 } @scripts) {
    RunScript($script);
  } elsif (defined $menus{$choice}) {
    my $sub = $menus{$choice}->{'sub'};
    &$sub();
  } else {
    print RED "Bad choice!\n";
  }
}

sub RunScript {
  my $script = shift;
  print YELLOW "Running script '$script'...\n";
  my $t = time;
  my $r = Exec($script);
  if ($r == 0) {
    print GREEN sprintf "Finished in %.4f sec.\n", time - $t
  } else {
    print RED sprintf "Returned %d in %.4f sec.\n", $r, time - $t
  }
  return $r;
}

sub ListScripts {
  open my $less, "| column -c 80 | less";
  my $old = select $less;
  print $_ . "\n" foreach @scripts;
  close $less;
  select $old;
  return 0;
}

sub RunAll {
  foreach (@scripts) {
    last if RunScript($_) != 0;
  }
}

sub Exit {
  print YELLOW "Bye, bye!\n";
  exit 0;
}

sub Exec {
  system <<CMD;
    set -x  # Echo commands
    set -e  # Stop on errors
    . setup.d/$_[0]
CMD
  return $?;
}

Prepare;
ReadScripts;
while (1) {
  MainMenu;
}

__END__
