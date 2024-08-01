# homebrew

```
brew tap janmarvin/janmarvin
```

To install the current (2023-04-12) git head from gitg:
```
brew install gitg-git
```


## update

```
cd /tmp
curl -OL https://gitlab.gnome.org/GNOME/gitg/-/archive/master/gitg-master.zip
shasum -a 256 gitg-master.zip
curl -OL https://gitlab.gnome.org/GNOME/libgit2-glib/-/archive/master/libgit2-glib-master.zip
shasum -a 256 libgit2-glib-master.zip
```
