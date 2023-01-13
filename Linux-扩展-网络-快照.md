# 一 网络管理(了解)

## 1.主机名配置

```java
查看当前主机名称:
	命令格式: hostname
修改主机名称:  
	临时更改
		命令格式: hostname 新主机名称 
		例子: hostname itcast
	永久更改:
		修改配置文件: /etc/hostname文件 需要重启Linux
		vim /etc/hostname : 编辑文件,修改主机名称
```

## 2.windows通信Linux

### 相关命令

```java
查看Linux的ip地址:
  ifconfig 或 ip addr(centos7的命令)
  ip addr show ens33(查看ens33这个网卡的ip信息)
测试某个ip是否可以被连通
	ping ip地址
```

### VM虚拟网卡介绍

```java
windows主机与虚拟机linux系统为什么可以直接连通？为什么？
	因为windows主机与虚拟机linux系统使用同一个网卡VMNet8,所以windows主机与linux系统是在同一个局域网内，所以可以直接通信。
```

只要成功安装了Vmware虚拟机就会默认生成的2个网卡（VMnet1和VMnet8）

| **命令**   | **功能说明**                                 |
| -------- | ---------------------------------------- |
| VMNet1网卡 | 连接模式：host-only仅主机模式介绍：即虚拟机只能与主机windows内部通信，无法对外网进行访问 |
| VMNet8网卡 | 连接模式：NAT网络模式介绍：提供了网络地址转换功能，可以使虚拟机使用真实机的物理网卡的ip与真实网络通信。即虚拟机中的linux系统可以共享windows主机的ip连接外网。使用这种网络模式下windows主机与linux系统组成小局域网，不仅可以互相通信，虚拟机也可访问外网。虚拟电脑中的linux使用的 ens33网卡就是使用这个VMNet8网卡。 |

## 3.域名映射

```java
windows中的域名映射:
	我们在访问我们自己的电脑时，有如下访问方式：
		127.0.0.1 localhost 
        Linux服务器的ip 域名
	配置文件所在位置 hosts
		C:\Windows\System32\drivers\etc （windows)
```

![image-20210608094922444](assets\image-20210608094922444.png)

![image-20210608094940273](assets\image-20210608094940273.png)

```java
下面我们给我们的linux添加域名映射.
	修改linux的配置文件/etc/hosts
	编辑该文件在文件的最后添加 : 
		192.168.13.144 itbaima
添加完毕后,在Linux中执行:
	ping itbaima
```

![1585195428063](assets\1585195428063.png)

# 二 系统克隆与快照(掌握)

## Linux快照

将Linux系统分节点备份保存.  在Linux启动状态下就可以进行.

![1585203844355](assets\1585203844355.png)

## Linux系统克隆:

克隆: 将一个Linux系统复制一份, 操作之前需要将Linux关机

![1585147751820](assets\1585147751820.png)

![1585147793843](assets\1585147793843.png)

![1585147849244](assets\1585147849244.png)

![1585147894422](assets\1585147894422.png)

![1585148010161](assets\1585148010161.png)

![1585148037100](assets\1585148037100.png)

![1585148049155](assets\1585148049155.png)

![](assets\1585148065918.png)



```java
# 修改 /etc/my.cnf 文件
[mysqld]
init_connect = 'SET NAMES utf8'
character-set-server = utf8
collation-server =utf8_general_ci
```

