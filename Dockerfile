FROM ubuntu:24.04

# Install dependencies

RUN apt-get update && apt-get install -y \
	software-properties-common \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg-agent \
	git \
	wget \
	unzip \
	vim \
	neovim \
	nano \
	tmux \
	tree \
	htop \
	mc \
	stow

## Install python3 environment
RUN apt-get install -y python3 python3-pip python3-dev python3-venv python3-setuptools python3-wheel

### Install python3 packages

RUN pip3 install --upgrade pip
RUN pip3 install numpy pandas matplotlib seaborn scikit-learn

## Install C/C++ environment
RUN apt-get install -y gcc g++ make cmake gdb valgrind clang clang-format doxygen swig

## Install Java environment
RUN apt-get install -y openjdk-11-jdk

## Install Node.js environment
RUN apt-get install -y nodejs npm yarn

## Install Dotnet environment
RUN apt-get install -y dotnet-sdk-8.0

# Set the working directory
WORKDIR /app

# Create a new user
RUN useradd -ms /bin/bash user
USER user

# Customize
RUN curl -s https://ohmyposh.dev/install.sh | bash -s
RUN mv ~/themes ~/.poshthemes

RUN git clone https://github.com/e-altunel/.dotfiles.git
RUN cd .dotfiles && stow -t ~ *

# Start the shell
CMD ["/bash"]
