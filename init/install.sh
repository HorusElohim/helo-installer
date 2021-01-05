#! /bin/bash

# Install git if needed
sudo apt install -y git curl


# Create Mark WS
sudo mkdir -p /mark
sudo chown -R mark: /mark
pushd /mark 

	pushd git
		# Create git folder structure
		mkdir -p /mark/git/{horuselohim,mark,akka}

		# Install Libs
		pushd horuselohim
			git clone https://github.com/HorusElohim/zsh-helo-installer.git
			pushd zsh-helo-installer
				pushd shell
					# Install Zsh
					sudo ./zsh.sh
					./oh_zsh.sh &
					pid_oh=$!
					wait $pid_oh
					zsh
				popd  
			popd 
		popd 

		# Install MarkPy
		pushd mark
			git clone https://github.com/MarkNo1/MarkPy.git
		popd 
	popd
popd 

