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
curl -OL https://download.gnome.org/sources/gitg/44/gitg-44.tar.xz
shasum -256 gitg-44.tar.xz
curl -OL https://gitlab.gnome.org/GNOME/libgit2-glib/-/archive/master/libgit2-glib-master.zip
shasum -a 256 libgit2-glib-master.zip
```
