FROM lsiodev/kasmvnc-base:ubuntujammy
RUN apt update
RUN apt -y install fonts-noto-cjk-extra unzip openssh-server git xz-utils python3-pip konsole nano vim psmisc procps net-tools python3-pip

# config ssh and set root pwd root
RUN mkdir -p /var/run/sshd
RUN chmod -R 700 /var/run/sshd
RUN chown -R root /var/run/sshd
RUN sed -i 's/.*PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN echo "root:root" | chpasswd

RUN apt -y install software-properties-common
RUN add-apt-repository -y ppa:team-xbmc/ppa
RUN apt -y install kodi

# kasmvnc autostart and menu
COPY ./root /root
