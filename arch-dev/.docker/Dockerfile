FROM archlinux

ARG USER_NAME
ARG USER_PASSWORD

RUN useradd --create-home --groups wheel --shell /bin/bash ${USER_NAME} && \
	echo "${USER_NAME}:${USER_PASSWORD}" | chpasswd

COPY ./.barrel/* home/${USER_NAME}/.barrel/

RUN	pacman -Syyuu --noconfirm && \
	pacman -S vi sudo --noconfirm && \
	sed -i.bak 's/\r$//' home/${USER_NAME}/.barrel/.packages.txt && \
	echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

WORKDIR home/${USER_NAME}/

USER ${USER_NAME} 

RUN echo "export PATH=$HOME/.local/bin:${PATH}" >> $HOME/.bashrc && \
	echo "alias jn='jupyter notebook --ip 0.0.0.0 --no-browser'" >> ~/.bashrc

# run ```bash ./barrel/.setup``` from ~ to install all the packages listed in ~/.barrel/.packages.txt
# if step 3 throws any errors during build its probably because of pacman. try commenting all pacman commnads and run tose as root after build.
	# to login as root run ```docker exec -itu0 arch-dev-1 bash``` from .docker on the host machine.
