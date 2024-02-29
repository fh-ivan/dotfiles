dotfiles
--------

Bootstrap a google workstation. Keep my dotfiles inside version control, to allow me to rebuild the system easily.

Usage
=====

Clone this to your home folder

```sh
git init
git remote add origin git@github.com:fh-ivan/dotfiles.git
git fetch origin
git checkout -b main --track origin/main
```


You'll need to add a file called `.github_user` to your home directory.

```sh
vim .github_user
```

And add this to its content

```
[user]
    name = MY NAME
    email = MY EMAIL
```

After you're done, initiate it by calling

```sh
./workstation.sh
```

Docs
====

You can read the config files themesleves that I've tried to explain the changes

Credits
=======
This is inspired by mathiasbynens/dotfiles but greatly simplified and streamlined. I am much more happy with the defaults of OSX that's why I don't do much modification there, rathar I strive for simplisity and using the least amount of configurations to achieve an acceptable result.
