[![Docker Stars](https://img.shields.io/docker/stars/mrjin/shadowsocks.svg?style=flat-square)](https://hub.docker.com/r/mrjin/shadowsocks/)    [![Docker Pulls](https://img.shields.io/docker/pulls/mrjin/shadowsocks.svg?style=flat-square)](https://hub.docker.com/r/mrjin/shadowsocks/)    [![license](https://img.shields.io/github/license/jinfeijie/Docker.svg?style=flat-square)](https://github.com/jinfeijie/Docker)    [![Docker Automated buil](https://img.shields.io/docker/automated/mrjin/shadowsocks.svg?style=flat-square)](https://hub.docker.com/r/mrjin/shadowsocks/)    [![Libraries.io for GitHub](https://img.shields.io/librariesio/github/jinfeijie/Docker.svg?style=flat-square)](https://github.com/jinfeijie/Docker)

 [![GitHub forks](https://img.shields.io/github/forks/jinfeijie/Docker.svg?style=social&label=Fork&style=plastic)](https://github.com/jinfeijie/Docker)    [![GitHub stars](https://img.shields.io/github/stars/jinfeijie/Docker.svg?style=social&label=Star&style=plastic)](https://github.com/jinfeijie/Docker)    [![Github Releases (by Release)](https://img.shields.io/github/downloads/jinfeijie/Docker/1.0.1/total.svg?style=plastic)](https://github.com/jinfeijie/Docker/releases)

| 环境变量       | 默认值           | 
| ------------- |:-------------:| 
| ERVER_ADDR      | 0.0.0.0 | 
| SERVER_PORT    | 8888    |  
| PASSWORD         | jin123      |  
| METHOD              | aes-256-cfb      |  
| TIMEOUT             | 300      |  
| DNS_ADDR          | 8.8.8.8      |  
| DNS_ADDR_2      | 8.8.4.4      |  

---

🔘修改默认值：

    只需要在云平台的后台添加对应的环境变量就可以进行修改

---
举个栗子🌰
 🏀默认端口`8888` 你想修改成 `7777`
 后台添加 `SERVER_PORT` 、`7777`就可以搞定

---

国外的服务器获取：

🚘获取本镜像：`docker pull mrjin/shadowsocks:alpine`

🚗部署本镜像：`docker run -d -e METHOD=aes-256-cfb -e PASSWORD=jin123 -e SERVER_PORT=8888 -p 8888:8888 --restart=always --name=ss-demo mrjin/shadowsocks:alpine`

---
🇨🇳国内的服务器

🇨🇳🚘获取本镜像：`docker pull registry.cn-hangzhou.aliyuncs.com/mrjin/shadowsocks`

🇨🇳🚗部署本镜像：`docker run -d -e METHOD=aes-256-cfb -e PASSWORD=jin123 -e SERVER_PORT=8888 -p 8888:8888 --restart=always --name=ss-demo registry.cn-hangzhou.aliyuncs.com/mrjin/shadowsocks`

📧其他问题[@jinfeijie](https://t.me/jinfeijie)

✨欢迎 Star && Fork
