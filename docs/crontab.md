# *Crontab*

**Сервис**

```
sudo /etc/init.d/cron {start|stop|restart|status}
sudo systemctl {start|stop|restart|enable|disable|status} cron.service
```

**Измена актуелне крон табеле**

```
crontab -e
```

**Приказ актуелне крон табеле**

```
crontab -l
```

**Чишћење актуелне крон табеле**

```
crontab -r
```

**Примери**

```
# Редослед: m-h-dom-mon-dow

# Сваког минута
* * * * * echo "!" >> /tmp/f.txt

# Сваког сата (*:00)
0 * * * * echo "!" >> /tmp/f.txt

# Сваког дана (12:00)
0 12 * * * echo "!" >> /tmp/f.txt

# Сваког понедељка (првог дана у недељи) (12:00)
0 12 * * 1 echo "!" >> /tmp/f.txt

# Сваког 13. јула (12:00)
0 12 13 7 * echo "!" >> /tmp/f.txt
```

## Додатак: корисни крон послови

```
# tar архива - паковање
tar --create --verbose --preserve-permissions --gzip --file html.tar.gz /var/www/html
tar -cvpzf html.tar.gz /var/www/html/

# tar архива - распакивање
mkdir unpacked
tar --extract --verbose --preserve-permissions --gunzip --file html.tar.gz --directory unpacked
tar -xvpzf html.tar.gz -C unpacked
```
