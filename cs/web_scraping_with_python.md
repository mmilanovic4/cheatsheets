# Python - BeautifulSoup библиотека

**Инстанцирање BeautifulSoup објекта**

```
from bs4 import BeautifulSoup
import requests

r = requests.get('https://example.com')

bs_obj = BeautifulSoup(r.text, 'lxml')
```

**Приступ елементу преко DOM стабла**

`bs_obj.html.body.h1.text`

**Листа свих линкова**

```
anchors = bs_obj.find_all('a')
anchors[0].attrs['href']
```

**Листа свих heading елемената (`h1`-`h6`)**

`bs_obj.find_all({'h1', 'h2', 'h3', 'h4', 'h5', 'h6'})`

**Листа свих `span` елемената код којих `class` атрибут има одређену вредност**

`bs_obj.find_all('span', { 'class' : 'red' })`

**Листа свих елемената код којих `class` атрибут има одређену вредност**

`bs_obj.find_all(attrs = { 'class' : 'red' })`

**Претрага `td` елемената унутар `table` елемента са одређеним `id` атрибутом**

`bs_obj.find('table', { 'id' : 'data' }).find_all('td')`

**Листа елемената који имају `ul` елемент са одређеним `id` атрибутом као родитељски у DOM стаблу**

`bs_obj.find('ul', { 'id' : 'list' }).children`

**Елемент који је родитељ у DOM стаблу `ul` елементу са одређеним `id` атрибутом**

`bs_obj.find('ul', { 'id' : 'list' }).parent`

**Број свих елемената који садрже одређени текст - скоро па бескорисно**

`bs_obj.find_all(text = 'Lorem ipsum.')`

**Број свих елеманта чији текст одговара одређеном регуларном изразу - може бити корисно**

```
import re

bs_obj.find_all(text = re.compile('Lorem ipsum.'))
```

**Листа свих PNG слика које се налазе унутар `img` тага**

`bs_obj.find_all('img', attrs = { 'src' : re.compile('\.PNG$', re.IGNORECASE) })`

**Листа свих елемената који садрже више од три атрибута**

`bs_obj.find_all(lambda tag : len(tag.attrs) > 3)`

**Листа свих елемената који садрже `src` атрибут**

`bs_obj.find_all(lambda tag : 'src' in tag.attrs)`

## Додатак: Tesseract OCR

**Инсталација главног програма и српских речника**

```
sudo apt update
sudo apt install tesseract-ocr tesseract-ocr-srp tesseract-ocr-srp-latn
```

**Листа доступних речника**

`tesseract --list-langs`

**Припрема слике (OCR ради боље на сликама већих димензија) - користимо ImageMagick алат**

```
convert S_en.png -resize 400% S_en.tiff
identify S_en.tiff
display S_en.tiff
```

**Пример: енглески (подразумевани речник)**

```
tesseract S_en.tiff eng
cat eng.txt
```

**Пример: српски речник - ћирилица**

```
tesseract S_srp.tiff srp -l srp
cat srp.txt
```

**Пример: српски речник - латиница**

```
tesseract S_srp_latn.tiff srp_latn -l srp_latn
cat srp_latn.txt
```

---

**Извор:** *Ryan Mitchell, Web Scraping with Python - O'Reilly Media, 2015.*
