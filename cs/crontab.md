# Crontab

**Сервис**

```
sudo /etc/init.d/cron {start|stop|restart|status}
sudo systemctl {start|stop|restart|enable|disable|status cron.service}
```

**Измена актуелне cron табеле**

`crontab -e`

**Приказ актуелне cron табеле**

`crontab -l`

**Уклањање актуелне cron табеле**

`crontab -r`

**Примери**

```
# Редослед: m-h-dom-mon-dow
...
# Сваки минут
* * * * * echo "!" >> /tmp/f.txt
...
# Нулти минут сваког сата
0 * * * * echo "!" >> /tmp/f.txt
...
# Сваки дан у 12:00
0 12 * * * echo "!" >> /tmp/f.txt
...
# Сваки понедељак у 12:00
0 12 * * 1 echo "!" >> /tmp/f.txt
...
# Сваке године 13. јула у 12:00
0 12 13 7 * echo "!" >> /tmp/f.txt
```

## Додатак: корисни Cron послови

```
# tar архива - паковање
tar --create --verbose --preserve-permissions --gzip --file html.tar.gz /var/www/html
tar -cvpzf html.tar.gz /var/www/html/
...
# tar архива - распакивање
mkdir unpacked
tar --extract --verbose --preserve-permissions --gunzip --file html.tar.gz --directory unpacked
tar -xvpzf html.tar.gz -C unpacked
...
# Бекап базе података
mysqldump --user=root --password="" --databases mvc --result-file dump.sql
mysqldump -u root -p -B mvc -r dump.sql
...
# Учитавање базе података
mysql -u root -p < dump.sql
```
