# 1) install xrdp
- ```sudo apt update && sudo apt upgrade```
- ```sudo apt install xrdp```

# 2) install the de/wm
## i) xfce
- ```sudo apt install xfce4```
  - choose lightdm as display manager
- ```sudo vi /etc/xrdp/startwm.sh```
  - on ubuntu comment out the last 2 lines and add ```startxfce4```. 
  - The last 4 lines of the file should look like this:
    ```
    # test -x /etc/X11/Xsession && exec 
    # exec /bin/sh 
    
    # xfce 
    startxfce4
    ```
## ii) dwm
- ```sudo apt-get install dwm suckless-tools xdm dmenu xorg surf```
  - choose XDM as display manager
- Create a .xsession file with ‘dwm’
  - ```echo dwm > .xsession``` 

# 3) start/stop xrdp
- to start
  - ```sudo service xrdp start```
- to stop
  - ```sudo service xrdp stop```

# 4) Connecting to xrdp (win10)
  - get the ip  
    - ```ip a```
    - copy the ip address
  - connect from win10
    - search ```Remote Desktop Connection``` in the win10 start menu
    - paste the copied ip and then connect
    - login using wsl linux username and passwd
  - exit
    - there should be an 'X' button in the top bar



# sources
- https://www.youtube.com/watch?v=AfVH54edAHU
- https://www.youtube.com/watch?v=IL7Jd9rjgrM

- https://medium.com/hacker-toolbelt/dwm-windows-manager-in-ubuntu-14958224a782
- https://hackeradam.com/post/install-dwm-ubuntu-20.10/
- https://cannibalcandy.wordpress.com/2012/04/26/installing-and-configuring-dwm-under-ubuntu/
- https://unix.stackexchange.com/questions/47359/what-is-xsession-for
