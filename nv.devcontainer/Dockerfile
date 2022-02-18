FROM debian:bullseye-slim
# FROM debian:sid-slim

RUN useradd --create-home --shell /bin/bash nv                                              && \
    usermod --append --groups sudo nv                                                       && \
    echo "nv:1234" | chpasswd                                                               && \
    echo "export PATH=/home/nv/.local/bin:${PATH}" >> /home/nv/.bashrc                      && \
    # echo "alias jn='jupyter notebook --ip 0.0.0.0 --no-browser'" >> /home/nv/.bashrc        && \
    # mkdir /workspace                                                                        && \
    apt update                                                                              && \
    apt upgrade                                                                             && \
    apt install -y                                                                             \
                git                                                                            \
                # curl                                                                           \
                # nano                                                                           \
                # vi                                                                             \
                # vim                                                                            \
                # neovim                                                                         \
                # chezscheme                                                                     \
                # chicken-bin                                                                    \
                # build-essential                                                                \
                # gdb                                                                            \
                # python3                                                                        \
                # python3-pip                                                                    \
                # python3-venv                                                                   \
                # nodejs                                                                         \
                # npm                                                                            \
                # checkinstall                                                                   \
                # libssl-dev                                                                     \
                # rustc                                                                          \
                # default-jdk                                                                    \
                # gnu-smalltalk                                                                  \
                # ghc                                                                            \
                # swi-prolog                                                                     \
                # cowsay                                                                         \
                # neofetch                                                                       \
                sudo

# COPY ../ /workspace/

# WORKDIR /workspace/

USER nv

# RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.1/install.sh | bash
