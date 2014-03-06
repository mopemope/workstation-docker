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
RUN apt-get install -y php5-cli
RUN /bin/bash -l -c 'curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh || true'
RUN chsh -s /bin/zsh
RUN hg clone https://vim.googlecode.com/hg/ vim
RUN apt-get install -y libncurses5-dev
RUN cd vim && ./configure --with-features=huge
RUN apt-get install -y make
RUN cd vim && make && make install
RUN git clone https://github.com/tiokksar/dotfiles.git
RUN cd dotfiles && ./update.sh
RUN mkdir -p ~/.vim/bundle
RUN git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
RUN cd ~/.vim/bundle/neobundle.vim/bin && ./neoinstall
ENV TERM screen-256color
RUN apt-get install -y wget language-pack-en
RUN locale-gen en_US
RUN cd && git clone git://github.com/ggreer/the_silver_searcher.git
RUN apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
RUN cd the_silver_searcher && sh build.sh && make install
