# script to setup the git versioning
# nooit gebruikt, wel copy per line naar cmdline

/bin/sh gitsetup.sh
git config --global user.name "rzondervan"
git config --global user.email "rzondervan@gmail.com"
git config --global push.default matching
git config --global alias.co checkout
git init

#De url moest in de configfile worden aangepast (van https naar ssh):
#(virt) rzondervan@penguin:~/flasker$ cat .git/config 
[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
[remote "origin"]
        url = ssh://git@github.com/rzondervan/flasker.git
        fetch = +refs/heads/*:refs/remotes/origin/*
[branch "main"]
        remote = origin
        merge = refs/heads/main
git config --global init.defaultBranch main

# git clone op tweede PC - map mag er nog niet zijn:
git clone git@github.com:rzondervan/flasker.git
# daarna weer de virt directory vullen.

#Start:
    1  python
    2  pip install
    3  python --version
    4  py --version
    5  pwd
    6  mkdir /c/flasker
    7  cd /c/flasker/
    8  python -m venv virt
    9  source virt/Scripts/activate
   10  clear
   11  pip install flask # deze installeert een nwe virt-map
   12  pip freeze
   13  ls

   #deactivate om virt uit te zetten. Daarna weer starten:
   #source virt/Scripts/activate (of bin ipv Scripts)
   #flask run  #server start

#server starten: eerste keer
export FLASK_ENV=development
export FLASK_APP=hello.py

#Geen virt-map kopiëren:
#Maak: .gitignore in de repo-map. Inhoud:
.gitignore

virt/

#Modify on computer 2 en push:
git add .
git commit -m 'second commit from Computer 2'
git push -u origin main

# Eerste keer moeten doen:
git config --global user.email "rzondervan@gmail.com"


#vanaf andere computer verder werken:
git pull
# en verder:
git push

