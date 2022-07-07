# Files decompressor 

## Motivation :bulb:
I don't have any graphic tool like unzip or unrar on my computer, so when I want to decompress a file I've to use `unzip` or `unrar` tool from terminal, and I'm good with that I like it, but both has different argument and parameters so I never remember which is for which, so I decide to create a script that combine both and be easy to use.

## Requirements :mag_right:
Is necessary that you have mentioned tools instaled on your computer, `unzip` and `unrar` tools; It can be downloaded in easily way using `requirments.sh` file executing it as follow:

```Bash
./requirments.sh 
```
For distros like Arch or Debian the script will detect automatically the os to use the correct package manager. Only for Mac you've to use `-mac` argument in script call.

**Note**
:		Remember to give permitions to `requirements.sh` before to try to execute.

## How to use :ringed_planet:
You can run the script on your terminal each time do you need or option that I recomend is save the script as alias on your bash/zsh rc file as follow:

```Bash
alias dpress=/~/path/where/script/are/dpress.sh
```

then, you can use it only writting the alias and giving the file on your terminal:
```Bash
dpress <file> 
```
The script will detect if is rar or zip extension and use the tool with their arguments. The output will go to a new directory with compressed file name.

### Arguments:
You can give to script some arguments to get different behavior that decompress only.

| Argument | Description                                                                                 |
|----------|---------------------------------------------------------------------------------------------|
| `-l`       | List files in compressed file before to decompress                                          |
| `-d`       | Giving a third argument you can select the directory where files goes when are decompressed |
| none     | Default behavior, just decompress files on current directory                                |

## Limitations :construction:
For files with names separated with spaces, rename that file to `trim` its name , otherwise you will get an [error](https://stackoverflow.com/questions/30999227/how-to-solve-unzip-cannot-find-or-open-error-in-linux-os).
