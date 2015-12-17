$ http localhost:8080/ping
HTTP/1.1 200 OK
content-length: 60
content-type: application/json
date: Thu, 17 Dec 2015 04:46:51 GMT
server: Cowboy

{
        "pong": "1073290264914881830555831049026020342559825461248"
}

毎回pongの属性は変わります。リクエストを送る時間によるものです。
