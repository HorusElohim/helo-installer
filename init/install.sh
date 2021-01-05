#! /bin/bash

# Install git if needed
sudo apt install -y git

alias in=pushd
alias out=popd

# Create Mark WS
sudo mkdir /mark
sudo chown -R mark: /mark
pushd /mark 

	# Create git folder structure
	mkdir -p /mark/git/{horuselohim,mark,akka}

	# Install Libs
	in horuselohim
		git clone https://github.com/HorusElohim/zsh-helo-installer.git
		in zsh-helo-installer
			in shell
				# Install Zsh
				sudo ./zsh.sh
				./oh_zsh.sh
			out 
		out
	out

	# Install MarkPy
	in mark
		git clone https://github.com/MarkNo1/MarkPy.git
	out
	
	
out

