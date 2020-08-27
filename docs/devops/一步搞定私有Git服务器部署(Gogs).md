# 一步搞定私有Git服务器部署(Gogs)



------

# 零、安装 Docker 和 Compsoe

1. 首先安装 Docker：



```ruby
$ curl -sSL https://get.docker.com/ | sh
$ sudo usermod -aG docker YOURUSERNAME
```

`YOURUSERNAME` 为你的用户名。

1. 然后安装 Compsoe：



```ruby
$ sudo curl -L https://github.com/docker/compose/releases/download/1.9.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose
```

# 一、HTTP 运行 Gogs

> 使用 HTTPS 直接看第二部分。

## 准备、Nginx 配置

虽然每个人的配置不一样，但是还是贴一个简单的模板：



```bash
server {
    listen 80 default_server;
    listen [::]:80 default_server ipv6only=on;

    root /app;
    index index.html index.htm;

    server_name localhost;

    location / {
        try_files $uri $uri/ =404;
    }
}
# 上面是默认的不用管也可以。
server
{
    listen 80;
    server_name git.example.com; # 这里填自定义域名
    location / {
        proxy_redirect off;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass http://172.17.0.3:8181; # 这里填容器地址，如果不知道填写公网IP也是可以的。
    }
}
```

保存这个文件为 Nginx 配置文件，目录你自己喜欢，哪都可以。

------

## 版本一、Gogs + Sqlite + Nginx

Gogs 支持 Sqlite，对于个人用户，Sqlite 足以应付，所以硬件资源有限的情况下不妨选择 Sqlite。
Gogs 默认端口是 3000，打算把 `git.example.com` 解析到 3000 端口。

新建一个文件命名为 `docker-compose.yml` ，然后复制粘贴下面的代码并保存。



```jsx
version: '2'
services:
  nginx:
    container_name: [nginx]
    image: nginx:alpine
    volumes:
      - "[~/nginx/]:/etc/nginx/conf.d/"
    ports:
      - "80:80"
    restart: always
  gogs:
    container_name: [gogs]
    image: gogs/gogs
    volumes:
      - [~/gogs]:/data
    ports:
      - "[3000]:3000"
      - "[3022]:22"
    restart: always
```

如你所见 “`[]`” 里面的内容你自己决定，可以自由修改。保存上面代码为 `docker-compose.yml` 文件之后，使用命令：



```ruby
$ docker-compose up -d
```

即可运行。
默认容器叫做 `gogs` ，数据保存在 `~/gogs`，端口是 `3000` 和 `3022`。

- `- 3022:22` 会将 3022 暴露给外网，用于 Git 的 SSH 协议, 不用 SSH 可以去掉。
- `- [~/gogs]:/data` 将映射本地的 `~/gogs` 目录作为 volume 给容器使用, 根据自己创建的目录修改此项。

然后检查一下容器有没有正常在运行：



```ruby
$ docker ps
```

访问网站进行初次的配置, 配置中需要注意的是这两项不用修改：

> - `Repository Root Path`(仓库根目录)

- `Run User`(运行用户)
- `HTTP Port`(HTTP端口)设置为3000
- `SSH Port`(SSH端口)设置为你-p参数设定的值(比如3002)
- `Application URL`(应用网址)设置为你的`http://你的域名`

nginx 已经帮我们把容器内的3000端口在服务器上代理给80端口了。

选择 sqlite3 作为数据库，那么一切都搞定了（Linux 大部分都装了 sqlite3），不需要去考虑更多的事情，剩下的便是登录你的管理员账号然后在后台设置好你 SSH 登录用的公钥(如果用 SSH 的话)。

> 哦，对了，域名要设置好解析到你的 IP～～（这个提醒会不会有点多余，笑）

------

## 版本二、Gogs + Mysql + Nginx

如果你不希望使用 Sqlite，而是使用 Mysql，可以使用下面这份 `docker-compose.yml`。

> 你不需要在本地安装 Nginx 和 Mysql，全文都通过 Docker 来完成。



```jsx
version: '2'
services:
  nginx:
    container_name: [nginx]
    image: nginx:alpine
    volumes:
      - "[~/nginx/]:/etc/nginx/conf.d/"
    ports:
      - "80:80"
    restart: always
  db:
    container_name: [db]
    image: mysql:5.7
    volumes:
      - "[~/mysql]:/var/lib/mysql"
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: [PASSWORD]
      MYSQL_DATABASE: [GOGS]
      MYSQL_USER: [USER]
      MYSQL_PASSWORD: [PASSWORD]
  gogs:
    container_name: [gogs]
    depends_on:
      - db
    image: gogs/gogs
    volumes:
      - [~/gogs]:/data
    links:
      - db
    ports:
      - "[3000]:3000"
      - "[3022]:3022"
    restart: always
```

“`[]`”里面的内容你自己决定，可以自由修改，（不改请去掉`[]`符号，保持括号内的默认值）。保存上面代码为 `docker-compose.yml` ，使用 `docker-compose up -d` 即可运行。

> 安装时注意，数据库地址不是 `localhost` 而是 `db` ，其他按提示操作即可。

------

# 二、使用 HTTPS 运行 Gogs

## 版本一、Caddy + Gogs + Sqlite

新建文件 `Caddyfile` ，注意大小写，然后修改 `tls i@example.com` 的邮箱为你自己的常用邮箱，IP 改成你的服务器 IP ，然后保存。



```bash
git.example.com {
    proxy / 123.456.789.0:3000 { # 改成你 IP:port
        proxy_header Host {host}
        proxy_header X-Real-IP {remote}
        proxy_header X-Forwarded-Proto {scheme}
    }
    log /var/log/caddy.log
    gzip
    tls i@example.com # 你的邮箱
}
```

新建文件 `docker-compose.yml` ，基本不用修改参数，直接使用 `docker-compose up -d` 即可运行。



```jsx
version: '2'
services:
  caddy:
    container_name: caddy
    image: abiosoft/caddy
    volumes:
      - "~/caddy/Caddyfile:/etc/Caddyfile"
    restart: always
  gogs:
    container_name: gogs
    image: gogs/gogs
    volumes:
      - ~/gogs:/data
    ports:
      - "3000:3000"
      - "3022:22"
    restart: always
```

## 版本二、Nginx + Letsencrypt + Gogs + Sqlite

克隆 Letsencrypt 仓库：



```bash
$ git clone https://github.com/letsencrypt/letsencrypt
$ cd letsencrypt
$ ./letsencrypt-auto certonly -d git.example.com
```

选择第二个，自动生成证书：

![img](https://upload-images.jianshu.io/upload_images/137499-22e5ba0854a313de.png?imageMogr2/auto-orient/strip|imageView2/2/w/643/format/webp)

自动生成证书

生成下面文字即为成功：



```rust
IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at
.........
.........
 - If you like Let's Encrypt, please consider supporting our work by:
   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le
```

Nginx 配置：



```bash
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    server_name git.example.com; # 修改域名
    server_tokens off;
    location /generate_204 { return 204; }
    # Discourage deep links by using a permanent redirect to home page of HTTPS site
    return 301 https://$host;
    # Alternatively, redirect all HTTP links to the matching HTTPS page
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl http2 default_server;
    listen [::]:443 ssl http2 default_server;
    server_name git.example.com; # 修改域名
    server_tokens off;
    location /generate_204 { return 204; }

    # ssl on;
    ################
    # SSL 配置
    ################
    ssl_certificate /etc/nginx/certs/fullchain.pem;
    ssl_certificate_key /etc/nginx/certs/privkey.pem;
    ################
    # from https://cipherli.st/
    # and https://raymii.org/s/tutorials/Strong_SSL_Security_On_nginx.html
    ################
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    ssl_prefer_server_ciphers on;
    # ssl_ciphers "EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH";
    ssl_ciphers "EECDH+CHACHA20:EECDH+CHACHA20-draft:EECDH+AES128:RSA+AES128:EECDH+AES256:RSA+AES256:EECDH+3DES:RSA+3DES:!MD5:!MEDIUM:!LOW";
    ssl_ecdh_curve secp384r1;
    ssl_session_cache shared:SSL:10m;
    ssl_session_tickets off;
    ssl_stapling on;
    ssl_stapling_verify on;
    resolver 8.8.8.8 8.8.4.4 valid=300s;
    resolver_timeout 5s;
    # Disable preloading HSTS for now.  You can use the commented out header line that includes
    # the "preload" directive if you understand the implications.
    add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload";
    # add_header Strict-Transport-Security "max-age=63072000; includeSubdomains";
    add_header X-Frame-Options DENY;
    add_header X-Content-Type-Options nosniff;

    # ssl_dhparam /etc/nginx/certs/dhparam.pem;
    ################
    # SSL END
    ################
    add_header 'Access-Control-Allow-Origin' *;
    add_header 'Access-Control-Allow-Methods' 'GET,POST,OPTIONS';
    location / {
        proxy_pass http://123.456.789.0:3000; # 修改为你的 IP:port
        proxy_redirect off;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```

然后新建一个文件 `docker-compose.yml`，使用 `docker-compose up -d` 运行即可。



```jsx
version: '2'
services:
  nginx:
    container_name: [nginx]
    image: nginx:alpine
    volumes:
      - "~/nginx/:/etc/nginx/conf.d/"
      - "~/nginx/certs/dhparam.pem:/etc/nginx/certs/dhparam.pem:ro"
      - "/etc/letsencrypt/live/zuolan.me/cert.pem:/etc/nginx/certs/cert.pem:ro"
      - "/etc/letsencrypt/live/zuolan.me/chain.pem:/etc/nginx/certs/chain.pem:ro"
      - "/etc/letsencrypt/live/zuolan.me/fullchain.pem:/etc/nginx/certs/fullchain.pem:ro"
      - "/etc/letsencrypt/live/zuolan.me/privkey.pem:/etc/nginx/certs/privkey.pem:ro"
    ports:
      - "80:80"
      - "443:443"
    restart: always
  gogs:
    container_name: [gogs]
    image: gogs/gogs
    volumes:
      - [~/gogs]:/data
    ports:
      - "[3000]:3000"
      - "[3022]:22"
    restart: always
```

------

> 以上一共四个版本，根据需要选择一种即可。