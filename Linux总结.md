# 1.为什么需要使用Linux?

```java
Linux是一款基于Unix开源免费的操作系统,安全和稳定性极高,所有成为了软件程序运行的最佳环境.
    安全: 在Linux系统中默认情况下只有22端口对外开放
    稳定: 7*24小时可用(全天候)
作用: 部署java项目
```

# 2.操作系统分类?

```java
站在使用者角度:
	桌面版:
        windows
        Linux
    服务器版:
        Linux ★
    移动版:
        Android: 底层依赖Linux
    嵌入式版:
        路由器: Linux
根据原生程度:
	内核版
    发行版: 我们使用的都是发行版
		centos6.5 : iptables
        centos7★ : firewalld
```

# 3.虚拟机是什么?

```java
虚拟机是window平台上的一款软件,安装此软件后.此软件可以向真机索要固定的硬盘和内存空间,虚拟出一台小型计算机.
VMware 16.1
```

# 4.Linux目录结构?

```java
/ : 系统根目录
    root : 超级管理员的家目录
    home : 普通用户的家目录
        zhangsan
        liuyan
        tiansuo
    etc : 系统配置文件目录
    usr : 多用户共享目录
    tmp : 临时目录
    ....
```

# 5.Linux客户端软件

```java
作用: 通过客户端软件可以远程访问Linux系统.
finalshell:
MX:
```

# 6.Linux相关命令

## 6.1 目录切换

```sh
cd /    
cd ..
cd ../
cd home
cd /home
cd -
cd ~
```

## 6.2 创建目录

```sh
mkdir aa
mkdir -p bb/bbb
mkdir /cc
```

## 6.3 复制和剪切

```java
cp hello.txt /aa
cp /tmp/hello.txt /bb
cp /tmp/hello.txt /bb/hello.txt

cp -r aa /cc
cp -r /tmp/aa /tmp/cc
cp -r /tmp/aa /tmp/cc/abc
    
mv hello.txt /aa
mv /tmp/hello.txt /bb
mv /tmp/hello.txt /bb/hello.txt
    
mv -r aa /cc
mv -r /tmp/aa /tmp/cc
mv -r /tmp/aa /tmp/cc/abc
```

## 6.4 创建文件

```java
touch hello.txt
touch /tmp/hello.txt
```

## 6.5 删除

```sh
rm -rf hello.txt
rm -rf aa
rm -rf ./*
```

## 6.6 压缩包

```java
打包扩展名: *.tar
压缩扩展名: *.gz
注: 在Linux中打包和压缩一般是一起的 *.tar.gz
打包并压缩:
	tar -zcvf ziliao.tar.gz a.txt b.txt ....
解压缩:
	tar -zxvf ziliao.tar.gz
    tar -zxvf ziliao.tar.gz -C /tmp/bb
```

## 6.7 编辑文件(★)

```sh
vim/vi 文件名(打开文件) --->
按 i/a/o (进入编辑模式) ---> 
对文件进行编辑 ---> 
按 esc(一个键)  ---> 
按 : (进入低行模式)  ---> 
按 wq(写入并退出) 或 wq!(强制写入并退出) 或 q!(强制退出不保存)

便捷操作: 便捷操作在打开文件后进行
	G
	gg
	dd
	ndd
	u
	shift + zz
	:set nu
	:set nonu
	:n
	/要查找的关键字
```

## 6.8 查看

```java
find / -name "a*"
find ./ -name "a*"

grep [-inv] 关键字 文件名
```

# 7.写入3到5个Linux常用命令















































