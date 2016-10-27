FROM ubuntu:14.04
MAINTAINER mrjin<me@jinfeijie.cn>

# 全局环境变量
ENV SSH_PASSWORD    jin123
ENV SS_PASSWORD     jin123
ENV PORT            8888
ENV version         1.0.2

WORKDIR /
# 更新升级Ubuntu安装包列表
RUN apt-get update
RUN apt-get -y upgrade

# 安装、配置openssh
RUN set -x && \
  apt-get install -y openssh-server && \
  mkdir /var/run/sshd && \
  echo 'root:'$SSH_PASSWORD |chpasswd && \
  echo 'PermitRootLogin yes' > /etc/ssh/sshd_config

# 安装 SS 服务
RUN set -x && \
  apt-get update && \
  apt-get install -y python-pip && \
  pip install --upgrade pip && \
  pip install shadowsocks && \
  apt-get clean

# 开机启动项配置
RUN set -x && \   
  wget https://github.com/jinfeijie/Docker/archive/$version.tar.gz && \
  tar -zxvf $version.tar.gz && \
  mv /Docker-*/CMD /usr/local/bin/CMD && \
  chmod 777 /usr/local/bin/CMD && \
  echo "sudo /usr/local/bin/ssserver -k $SS_PASSWORD -p $PORT -m aes-256-cfb --user nobody -d start">>/usr/local/bin/CMD && \
  echo "/usr/sbin/sshd -D">>/usr/local/bin/CMD && \
  rm -rf /$version.tar.gz /Docker-*
  
EXPOSE 22
EXPOSE $PORT

# 运行 openssh && SS 服务
CMD ["/usr/local/bin/CMD"]