## git commands cheatsheet

- Git remove local changes to repo:

```
git checkout .
```

- Git remove untracked files from the local copy of repo:

```
git clean -f
```

- Or untracked directories (e.g., new or automatically generated directories):
```
git clean -fd
```



- If you want to revert changes made to the index (i.e., that you have added), do this. Warning this will reset all of your unpushed commits to master!:
```
git reset
```

- If you want to revert a change that you have committed, do this:
```
git revert <commit 1> <commit 2>
```

- check what changes you made on the local before commiting or adding [ staging ].

```
git diff HEAD
```


- Throw away all local commits:

```
git reset --hard origin/<branch_name>
```

git reset --hard origin/master   <- For master branch

- Revert previous commit

```
git revert <commit ID>
```

- check all config [ .git/config ]
```
git config --list [ --global ]
```



## behind proxy git

- Configured proxy:
```
git config --global http.proxy http://proxyuser:proxypwd@proxy.server.com:8080
```

- unset ( remove ) proxy configuration:
```
git config --global --unset http.proxy
```

- check proxy settings:
```
git config --global --get http.proxy
```

- annnnnnd it didn't work, still the proxy settings are gettings cached somewhere in the system.

now you explecitly add this on your ".git/config" file:

```
[http]
    proxy =
```
