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