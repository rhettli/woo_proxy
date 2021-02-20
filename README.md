 _写在前面：本来是一个程序两个端口，一个端口监听sockets4/5 代理，一个监听http/s代理，但是win10的设置有点麻烦，防止兼容问题，现已改为一个端口监听，默认10000_ 

# ？woo_proxy是个啥
为了兼容windows，
**woo_proxy 目前测试阶段，启动后就可以访问github开源网站，网络1MB，人多也可能很卡，公司需要使用请自行购买服务器**
>woo_proxy 使用woo语言开发，完全开源；
>目前大公司还好都有代理，可以直接访问github网页；
>个人，小公司当遇到紧急情况不能访问github,或者clone一个项目几kb每秒的速度，那真的时热锅上的蚂蚁了
>woo_proxy实现socket4/5 http/s代理的代码逻辑，给需要的人使用，请勿用于非法用途

## 1.注意事项：
>1.woo proxy代理目前实现了socket5代理(一般的网络都没问题了)
socket4和http/s代理还没有实现，后面会更新的，更新速度可能比较慢（三天打鱼两天晒网）
windows系统默认是sockets4，请不要直接使用系统级别代理，软件代理优先

>2.直接启动：`woo client.woo`即可访问github，测试服务器1MB网络，仅仅能用于用户测试

## 2.路由规则
>woo_proxy路由规则，默认本地不能访问，才会走proxy，能访问的直接本地访问，提高访问速度

## 3.安装
>安装前请先安装 [woo语言](https://www.kancloud.cn/oshine/passerbyab/2121071)
```woo|lua
# 克隆
git clone https://gitee.com/oshine/woo_proxy.git --depth 1
cd woo_proxy

# 启动，启动后的sockts4/5 和http/s代理端地址默认 127.0.0.1:10000
woo client.woo
```

### 3.9 写在前面，下方设置，在win10的时候，可能只适用于浏览器 和一般app，当需要cmd也生效请把http_proxy=127.0.0.1:10000 和 https_proxy=127.0.0.1:10000 加入系统环境变量

## 4.设置proxy到系统
1.deepin系统例子(注意下方的端口填写10000，默认，或者自己修改conf.woo文件内的端口)

![输入图片说明](https://gitee.com/oshine/woo_proxy/raw/master/deepin-set-proxy.png "在这里输入图片标题")

2.win10系统例子

![输入图片说明](https://gitee.com/oshine/woo_proxy/raw/master/win10-set-proxy.png "在这里输入图片标题")

## 5.具体用例介绍
>比如把 woo_proxy放到树梅派上面做一个固定服务，使用开机自启动服务：`woo woo_proxy/client.woo`,把这启动命令加入 /etc/rc.local 文件中
>并且把树梅派的ip地址使用路由器固定住，这样就可以提供良好的服务了