# Rtorrent + Rutorrent 
 - `0.9.6`, `latest`

This is a container running Rtorrent with Rutorrent as WebUI.
Rutorrent comes with 16 of my favorite plugins.
 - Auto Tools Plugin v3.6
 - CPU Load Plugin v3.6
 - Data Plugin v3.6
 - Erase Data Plugin v3.6
 - Ratio Plugin v3.6
 - Extended Ratio v3.6
 - File Drop v3.6
 - iPad Plugin v3.6
 - Look At v3.6
 - Noty v3.6
 - Retrackers Plugin v3.6
 - Seeding Time Plugin v3.6
 - Show Peers like wTorrent Plugin v3.6
 - Theme Plugin v3.6
 - Throttle Plugin v3.6
 - Track Lables Plugin v3.6

### Usage
Simply run
```
docker run --name rtorrent -v /home/kerwood/Downloads:/downloads -p 8181:80 -p 51001:51001 -d kerwood/rtorrent-lxc
```
**Change rtorrent port**
By default rtorrent uses port 51001-51001. You can change these ports with the `RTORRENT_PORT` environmental variable. Remember to publish the port(s) to. And yes, even if you specify only one port, you will have to write it as it was a range, 52002-52002. You can specify a range of ports, but its recommended to only use one. And remember that Docker will make as many iptables entries as there are ports in the range.
```
docker run --name rtorrent -v /home/kerwood/Downloads:/downloads -e RTORRENT_PORT=52002-52002 -p 8181:80 -p 52002:52002 -d kerwood/rtorrent-lxc
```
**Authentication**
To get authentication use `HTUSER` and `HTPASS`.
```
docker run --name rtorrent -v /home/kerwood/Downloads:/downloads -e HTUSER=Admin -e HTPASS=Passw0rd -p 8181:80 -p 51001:51001 -d kerwood/rtorrent-lxc
```
**Rtorrent watch folder**
Rtorrent has a cool feature where it watches a folder for torrent files and starts them automatically. Just mount the volume `/watch`
```
docker run --name rtorrent -v /home/kerwood/Downloads:/downloads -v /home/kerwood/Watch:/watch  -p 8181:80 -p 51001:51001 -d kerwood/rtorrent-lxc
```


Patrick Kerwood @ [https://LinuxBloggen.dk](https://LinuxBloggen.dk)  
Fork it at Github [https://github.com/Kerwood/Rtorrent-LXC](https://github.com/Kerwood/Rtorrent-LXC)

