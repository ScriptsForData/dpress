# Compressor/Extractor hub
I don't have any graphic tool like unzip or unrar on my computer, so when I want to decompress a file I've to use unzip or unrar tool from terminal, and I'm good with that I like it, but both has different argument and parameters so I never remember which is for which, and don't mention arguments needed to decompress tar.gz files, so I decide to create a script that combine the three commands to be easy to use.

## Requirements :mag_right:
Is necessary that you have mentioned tools instaled on your computer, unzip,unrar and xz tools; tar actually comes instaled on Mac and Linux. First two tools can be downloaded easily using requirments.sh file executing it as follow:

```Bash
./requirments.sh -<os>
```
Where `<os>` can be mac , debian or arch. 

>	Remember to give permitions to `requirements.sh` before to try to execute.

## How to use :ringed_planet:

Just execute:

```Bash
./dpress <command> -<flag> <file.zip> <...>
```

The script will detect file extension and use the tool with their arguments to work with in the current directory. To change default behavior, use one of these commands:
| Command | Description                                                                                 |
|----------|---------------------------------------------------------------------------------------------|
| `l`       | List files in compressed file. It doesn't extract the files just list it|
| `e`       | Extract files from compressed file |
| `c`       | Create a compressed file, can be `zip`, `rar`,`tar.gz` or `tar.xz` file. It requires a second argument which is the source file|

Flags requires start with `-` character, and can be used with any command (except with `l`).
| Flag | Description                                                                                 |
|----------|---------------------------------------------------------------------------------------------|
| `d` / `-del`       | Remove source file after extraction or compression|
| `r` / `-re`       | Extract files recursively|


> Check `wiki` to see some examples to learn how to use it.

## Limitations :construction:
1) For files with names separated with spaces, you must rename that file to `trim` or `strip` its name , otherwise you will get an [error](https://stackoverflow.com/questions/30999227/how-to-solve-unzip-cannot-find-or-open-error-in-linux-os).
2) For files with `xz` extension you only must compress and decompress a dir with many files, doesn't work if you try to do with a single file.

---
Enjoy :bamboo:
