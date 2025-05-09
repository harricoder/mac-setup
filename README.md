# mac-setup

My OSX setup and dotfiles for >= Sequoia (only for zsh). It may work on OS
versions before this, but it has not been tested on them.

These are a collection of my personal dotfiles and configurations. There are
plenty of other more 'shareable' repos out there for dotfile usage (meaning
I probably won't accept pull requests unless I really want the changes myself,
nothing personal). There may be things/ideas worth copying here (I was
heavily inspired by existing repos on github) - so knock yourself out.

The basic usage is quite simple, there are currently 2 entrypoint scripts
depending on required context:

* `./osx_dev_install`  - Installing a general development environment
* `./osx_desktop_install` - Setup for music production and desktop dev
 (i.e. DAW, Soft Synths, dev tools)
  
Each entrypoint works in the same way, you will be presented with a series of
questions for scripts that you may want to execute from each 'module'.
However this is really structured in a way which assumes that you say 'yes' to
each (option is there to account for re-running in case of initial failure).


## License
Licensed under the MIT license.


## Installation:

**WARNING: This script does not backup any existing dotfiles or config.**

**Before running any commands, you must edit files according to your needs.**

So update packages in `scripts/*/brew.zsh` and `scripts/*/mas.zsh`
etc. Just have a general nosy around before running - so you know what is
going to happen.

```
cd ~
git clone https://github.com/harricoder/mac-setup.git
cd mac-setup

# Read through the install scripts before running (although you will be asked
# for each step before it actually does anything.
./osx_dev_install
or
./osx_desktop_install
```


## Usage:

At the very least you will have to restart your shell session, but for some of
the Mac options to take effect, you will probably just have to restart anyways.

### What's included ?

+ Homebrew: `brew.zsh`
  + Installs Homebrew AND brew installs all my currently used packages
  + Uses homebrew-cask to install all my applications
+ MAS `mas.zsh`
  + Uses the excellent mas to install apps from the apple app store
+ Node `node.zsh`
  + Install nvm
  + Latest version of node via nvm
+ Programming Languages
  + Python 3 (via pyenv) `python.zsh`
  + Configure Go (already installed via brew) `go.zsh`
  + more...
+ Git `git.zsh`
  + Git config
  + Global gitignore
+ Dotfiles `dotfiles.zsh`
  + Various dotfiles (cp these - it does not symlink)
  + Creates iTerm2 preferences (need to manually import profile)
  + Copies profile pic and background images
+ ZSH `zsh.zsh`
  + Installs zsh
  + Sets up zprezto
+ MacOS `mac.zsh`
  + Installs applications via the Mac App Store
+ Manual reminders `manual.zsh`
  + Anything that can't be automated (will get a reminder to do)
  + Things that can be automated (but prefer to re-do, like ssh key creation)
    will also get a reminder for.


## Credits:

This was heavily inspired by a number of other well known `dotfile` projects as
well as a number I found throughout github. The core (i.e. what makes something
like this even possible) is probably down to mainly these two projects:

*Homebrew*
https://brew.sh/

*mas*
https://github.com/mas-cli/mas

There are many other alternative to the above, so also check them out too.

## Works with:

:x: <= Sonoma

✅  >= Sequoia

## Warranty:

User beware, there is no warranty or guarantee that using these scripts
(so please read them before use).
