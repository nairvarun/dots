# steps
- ```cd /usr/local/```
- ```sudo git clone https://github.com/9fans/plan9port plan9```
- on ubuntu
  - ```sudo apt-get install build-essential xorg-dev git```
- ```cd plan9```
- ```sudo chmod +x ./INSTALL```
- ```sudo ./INSTALL```
- ```echo 'PLAN9=/usr/local/plan9 export PLAN9' >> ~/.bashrc```
- ```echo 'PATH=$PATH:$PLAN9/bin export PATH' >> ~/.bashrc```
- open a new terminal and type in ```acme``` and it should open


## sources:

i) https://www.reddit.com/r/linux4noobs/comments/nkdvdg/acme_text_editor/

ii) https://www.donationcoder.com/forum/index.php?topic=45547.0
