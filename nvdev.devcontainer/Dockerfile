FROM debian

RUN useradd --create-home --shell /bin/bash vscode                                  && \
    usermod --append --groups sudo vscode                                           && \
    echo "vscode:vscode" | chpasswd                                                 && \
    echo "export PATH=$HOME/.local/bin:${PATH}" >> $HOME/.bashrc                    && \
    echo "alias jn='jupyter notebook --ip 0.0.0.0 --no-browser'" >> ~/.bashrc       && \
    mkdir /workspace                                                                && \
    apt update                                                                      && \
    apt upgrade                                                                     && \
    apt install -y                                                                     \
                git                                                                    \
                # nano                                                                   \
                # vi                                                                     \
                vim                                                                    \
                # neovim                                                                 \
                chezscheme                                                             \
                # chicken-bin                                                            \
                # build-essential                                                        \
                # gdb                                                                    \
                # python3                                                                \
                # python3-pip                                                            \
                # python3-venv                                                           \
                # nodejs                                                                 \
                # npm                                                                    \
                # rustc                                                                  \
                # default-jdk                                                            \
                # swi-prolog                                                             \
                # cowsay                                                                 \
                sudo

COPY ../ /workspace/

WORKDIR /workspace/

USER vscode
