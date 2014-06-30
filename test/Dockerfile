FROM ubuntu:latest
RUN apt-get install -y wget git
RUN useradd --create-home --home-dir /home/user --shell /bin/bash user
RUN echo user:1 | chpasswd
RUN echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/user
RUN mkdir -p /work
RUN chown user:user /work
USER user
ADD test.sh /home/user/
ENV HOME /home/user
WORKDIR /home/user
