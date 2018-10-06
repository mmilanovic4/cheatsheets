# cURL 101

**GET захтев**

`curl https://api.ipify.org`

**GET захтев са аргументима (први начин)**

`curl "https://httpbin.org/get?fn=Milos&ln=Milanovic"`

**GET захтев са аргументима (други начин)**

`curl https://httpbin.org/get --data "fn=Milos&ln=Milanovic" --get`

**POST захтев - `x-www-form-urlencoded`**

`curl https://httpbin.org/post --data "fn=Milos&ln=Milanovic"`

**POST захтев - `multipart/form-data`**

`curl https://httpbin.org/post --form "fn=Milos&ln=Milanovic"`

**POST захтев - шаљемо параметре из фајла**

```
echo "fn=Milos&ln=Milanovic" > data.txt
curl https://httpbin.org/post --data-binary @data.txt
```

**POST захтев - шаљемо фајл као параметар**

`curl https://httpbin.org/post --form "profile_pic=@S.png"`

**HEAD захтев - само заглавља**

`curl https://httpbin.org --head`

**PUT захтев**

`curl https://httpbin.org/put --request PUT --data "fn=Milos&ln=Milanovic"`

**DELETE захтев**

`curl https://httpbin.org/delete --request DELETE --data "id=1"`

**Слање заглавља**

`curl https://httpbin.org/headers --header "X-My-Name-Is: Milos"`

**Измена `User-Agent` заглавља**

`curl https://httpbin.org/headers --user-agent "Agent Smith v2.0"`

**Измена `Referer` заглавља**

`curl https://httpbin.org/headers --referer "pornhub.com"`

**HTTP Basic аутентификација**

`curl https://httpbin.org/basic-auth/mmilanovic/admin --basic --user "mmilanovic:admin"`

**HTTP Digest аутентификација**

`curl https://httpbin.org/digest-auth/auth-int/mmilanovic/admin --digest --user "mmilanovic:admin"`

**Праћење редирекције**

`curl xkcd.com --location`

**Слање колачића**

`curl https://httpbin.org/cookies --cookie "user=mmilanovic"`

**Тегла за колачиће**

```
curl https://httpbin.org/cookies/set/user/mmilanovic --cookie-jar cookies.raw
cat cookies.raw
curl https://httpbin.org/cookies --cookie cookies.raw
```

**Коришћење тајмаута**

`curl https://www.google.com:81 --connect-timeout 3`

**Коришћење прокси-сервера**

`curl http://httpbin.org/headers --proxy 192.168.0.20:3128`

**Коришћење прокси-сервера (аутентификација)**

`curl http://httpbin.org/headers --proxy 192.168.0.20:3128 --proxy-user "mmilanovic:admin"`

**Коришћење SOCKS прокси-сервера**

`curl http://httpbin.org/headers --socks5 192.168.0.20:1080`

**Складиштење заглавља одговора у фајл**

```
curl https://www.reddit.com --dump-header reddit.txt
cat reddit.txt
```

**Покушај успостављања SSL везе користећи старију (несигурну) верзију протокола**

```
curl https://www.google.com --head --sslv3
curl https://www.google.com --head --tlsv1
```

**Преузимање фајлова (први начин)**

```
curl --output S.png https://imgs.xkcd.com/comics/dear_diary.png
curl --remote-name https://imgs.xkcd.com/comics/dear_diary.png
```

**Преузимање фајлова (други начин)**

`curl https://imgs.xkcd.com/comics/dear_diary.png > dear_diary.png`

**Преузимање више фајлова**

```
URL1="https://imgs.xkcd.com/comics/query.png"
URL2="https://imgs.xkcd.com/comics/real_programmers.png"
curl --remote-name $URL1 --remote-name $URL2
```

**Лимитирање брзине преузимања фајла**

`curl https://imgs.xkcd.com/comics/dear_diary.png --limit-rate 1K`

**Избор локалног порта**

`curl https://xkcd.com --local-port 1234`

**Лимитирање времена извршавања наредбе (различито од `--connect-timeout`!)**

`curl https://xkcd.com --limit-rate 1K --max-time 2`

**Лимитирање величине захтеваног ресурса**

```
curl https://imgs.xkcd.com/comics/dear_diary.png --max-filesize 1024
curl https://imgs.xkcd.com/comics/dear_diary.png --max-filesize $((50 * 1024))
```

**Детаљи...**

```
curl https://www.amazon.com --verbose
curl https://www.amazon.com --trace -
```
