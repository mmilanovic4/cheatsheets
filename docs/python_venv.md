# Python `venv`

# CLI

```
python3 -V
python3 -m pip -V
python3 -m pip install --user virtualenv
```

# Virtual env

```
# Initiate venv (create env directory)
python3 -m venv env

# Enter venv
source env/bin/activate

# Package installation
pip install bs4

# requirements.txt
pip freeze > requirements.txt
pip install -r requirements.txt

# Leave venv
deactivate
```
