#!/bin/sh
echo =================================
echo  自动化部署脚本启动
echo =================================

echo 停止原来运行中的工程
APP_NAME1=stock_backend

tpid=`ps -ef|grep $APP_NAME1|grep -v grep|grep -v kill|awk '{print $2}'`
if [ ${tpid} ]; then
    echo 'Stop Process...'
    kill -15 $tpid
fi
sleep 2
tpid=`ps -ef|grep $APP_NAME1|grep -v grep|grep -v kill|awk '{print $2}'`
if [ ${tpid} ]; then
    echo 'Kill Process!'
    kill -9 $tpid
else
    echo 'Stop stock_backend Success!'
fi


APP_NAME2=stock_xxljob

tpid2=`ps -ef|grep $APP_NAME2|grep -v grep|grep -v kill|awk '{print $2}'`
if [ ${tpid} ]; then
    echo 'Stop Process...'
    kill -15 $tpid2
fi
sleep 2
tpid2=`ps -ef|grep $APP_NAME2|grep -v grep|grep -v kill|awk '{print $2}'`
if [ ${tpid} ]; then
    echo 'Kill Process!'
    kill -9 $tpid2
else
    echo 'Stop stock_xxljob Success!'
fi


echo 准备从Git仓库拉取最新代码
cd /usr/local/javaapp/stock_parent

echo 开始从Git仓库拉取最新代码
git pull
echo 代码拉取完成

echo 开始打包
output=`mvn clean package -Dmaven.test.skip=true`

echo 启动项目
nohup java -jar ./stock_backend/target/stock_backend.jar &> stock_backend.log &
nohup java -jar ./stock_xxljob_admin/target/stock_xxljob_admin.jar &> stock_xxljob.log &
echo 项目启动完成

