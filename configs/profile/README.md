## Profile Configs:

This directory should contain any images/media/configs that will be used as
profile pictures, background images or for use in screen savers, terminal
configs and such. These media/configs will all be moved into a newly created
`~/Configs/` folder and will be referenced directly in config settings.

In summary add these files to this directory route:
 * `./profile.png`
 * `./terminal.png`
 * `./iterm-profile.json`

### Profile Images:

The expected files should be named as following and be included in this folder
`before` the script is run, if a particular image is not included the
associated image from the `defaults` folder will be used:

    * `profile.png`: This image will be used in the user profile (small image)
    * `terminal.png`: Used as a background image for iTerm2 terminals
    *  more...?
    
### Background Images:

Since apple allows you to change these pictures regularly it doesn't make sense
to strictly enforce only one desktop background choice. Therefore to still keep
these images organised, but flexible, just add all images to the
`/backgrounds` folder, then select them via the usual:

`System Preferences -> Desktop & Screen Saver`

### Screen saver:

_TBC: Screen saver options to be added in later..._

### iTerm2 Profile:

The default config file `mac-setup/configs/defaults/iterm-profile.json` will
get parsed with the current user and added to the `~/Configs/` folder
with the same name. If you need to modify this file, do so before the script
runs and leave in this route directory: `mac-setup/configs/iterm-profile.json`.
If a custom file is created, this will get used and parsed instead of the
default one (much like the images). Note the text `USER_NAME` will get replaced
with the current user.

TODO: Find a way to automate moving the profile configs directly into iTerm2...

### Additional things:

_More to follow?_
