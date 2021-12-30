FROM python
ARG USER_NAME
ARG SUDO_PASSWORD
RUN apt update && apt upgrade -y
RUN apt install -y \
    sudo
RUN useradd --create-home --shell /bin/bash ${USER_NAME} 
RUN usermod --append --groups sudo ${USER_NAME}
RUN echo "${USER_NAME}:${SUDO_PASSWORD}" | chpasswd
USER ${USER_NAME} 
RUN echo "export PATH=$HOME/.local/bin:${PATH}" >> $HOME/.bashrc
RUN echo "alias jn='jupyter notebook --ip 0.0.0.0 --no-browser'" >> ~/.bashrc
WORKDIR /home/${USER_NAME}/
RUN pip install --no-cache-dir jupyter
