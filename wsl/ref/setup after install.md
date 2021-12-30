# update && upgrade
- ```sudo apt update && sudo apt upgrade```

# software
## debian (apt)
- important:
  - git, c/c++ stuff, gnu debugger and a way to read man pages - ```sudo apt install git build-essential gdb man-db``` 

- optional
  - terminal file explorer - ```sudo apt install ranger```
  - terminal calculator - ```sudo apt install wcalc```

- build neovim from source (https://github.com/neovim/neovim)
	- [02/09/20201]
	- ```sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl```
	- ```git clone https://github.com/neovim/neovim```
	- ```cd neovim```
	- ```make CMAKE_BUILD_TYPE=Release```
	- ```sudo make install```
	- load dot files

- install a sys info tool
	- neofetch
		- ```sudo apt install neofetch```

	- macchina (https://github.com/Macchina-CLI/macchina)
		- [02/09/20201]
		- ```sudo apt install cargo```
		- ```cargo install macchina```
		- add ```PATH=$HOME/.cargo/bin:$PATH; export PATH``` to .bashrc
	
	- pfetch (https://github.com/dylanaraps/pfetch.git)
		- [02/09/20201]
		- ```git clone https://github.com/dylanaraps/pfetch.git```
		- ```sudo install pfetch/pfetch /usr/local/bin/```

## alpine (apk)
- login as superuser
- git, c/c++ stuff, gnu debugger and a way to read man pages - ```apk add git build-base gdb mandoc man-pages```

# last touches
- load dot files
- add `"bellStyle": "none"` to settings.json of windows terminal
