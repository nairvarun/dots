FROM debian

ARG USER_NAME
ARG SUDO_PASSWORD

RUN useradd --create-home --shell /bin/bash ${USER_NAME} && \
	usermod --append --groups sudo ${USER_NAME} && \
	echo "${USER_NAME}:${SUDO_PASSWORD}" | chpasswd

COPY ./.packages.txt home/${USER_NAME}/

WORKDIR home/${USER_NAME}/

RUN apt update && \
	apt upgrade && \
	sed -i.bak 's/\r$//' ./.packages.txt && \
	xargs apt install <./.packages.txt -y

USER ${USER_NAME} 

RUN echo "export PATH=$HOME/.local/bin:${PATH}" >> $HOME/.bashrc && \
	echo "alias jn='jupyter notebook --ip 0.0.0.0 --no-browser'" >> ~/.bashrc
