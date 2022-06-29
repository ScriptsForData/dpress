# Files decompressor 

## Motivation
I don't have any graphic tool like unzip or unrar on my computer, so when I want do decompress a file I've to use or `unzip` or `unrar` tool from terminal, and I'm good with that I like it, but both has different argument and parameters so I never remember which is for which, so I decide to create a script that combine both and be easily to use.

## Requirements
Is necessary that you have mentioned tools instaled on your computer, `unzip` and `unrar` tools can be downloaded in easily way using `requirments.sh` file executing it as follow:

```Bash
./requirments.sh
```
Note
:		Remember to give permitions to `requirements.sh` before to try to execute. And this file only works with `Debian` distribution and derivates.

## How to use
You can run the script on your terminal each time do you need or option that I recomended you is save the script as alias on your bash or zsh rc file as follow:

```Bash
alias dpress=/~/path/where/script/are/main.sh
```

## Limitations
For files with names separated with spaces, before to use the script rename that file to `trim` its name and it doesn't have spaces, otherwise you will get a error.
