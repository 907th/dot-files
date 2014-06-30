# dot-files

My collection of dot-files.

## Installation

Be sure to have `git` and `wget` installed.
Check that `/work` directory exists and it's writable by current user.


Run `pre-setup.sh` to configure SSH and to clone the repository to `/work/dot-files`:

```bash
$ bash -i <(wget -q -O - https://raw.githubusercontent.com/907th/dot-files/master/pre_setup.sh)
```

Run `setup.pl` to finish installation:

```bash
$ /work/dot-files/setup.pl
```

## Testing

Testing is being done inside of a Docker image. First, build it, then test:

```bash
$ cd /work/dot-files/test
$ make build
$ make test
```

Use `make shell` to run `bash` inside of the image.
