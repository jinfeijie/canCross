
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

📧其他问题[me@jinfeijie.cn](mailto:me@jinfeijie.cn)

✨欢迎 Star && Fork
