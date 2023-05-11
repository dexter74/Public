```bash
#######################################################
#!/bin/bash
VALEUR=$(cat /etc/passwd | grep root | cut -c 12-15)

if [[ "$VALEUR" == root ]]; then
  clear;
  echo "VALEUR = $VALEUR"
fi
#######################################################
```


```bash
#######################################################
#!/bin/bash
STR='GNU/Linux is an operating system'
SUB='Linux'

if [[ "$STR" == *"$SUB"* ]]; then
  echo "It's there."
fi
#######################################################
```
