FROM stackbrew/ubuntu:saucy
MAINTAINER Tomasz Tokarski tomasz@tomasztokarski.com
RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -y tmux
RUN apt-get install -y mercurial
RUN apt-get install -y mosh
RUN apt-get install -y zsh
RUN apt-get install -y curl
RUN apt-get install -y git
RUN /bin/bash -l -c 'curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh || true'
RUN chsh -s /bin/zsh
RUN hg clone https://vim.googlecode.com/hg/ vim
RUN apt-get install -y libncurses5-dev
RUN cd vim && ./configure --with-features=huge
RUN apt-get install -y make
RUN cd vim && make && make install
