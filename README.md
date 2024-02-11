# Compressor/Extractor script
I don't have a graphic tool like unzip or unrar on my computer, so when I want to decompress a file I've to use unzip/unrar tool from terminal, and I'm cool with that, I like it, but both has different argument and parameters so I never remember which is for, and don't mention arguments needed to decompress tar.gz files. So I decide to create a script that combine the three terminal tools to have a single interface to be used.

## Requirements :mag_right:
Is necessary mention that you must have installed the tools on your computer (unzip,unrar and xz); tar actually comes instaled on Mac and Linux. First two tools can be downloaded easily using requirments.sh file executing it as follow:

```Bash
./requirments.sh -<os> #mac, debian, ubuntu, arch
```

>	Remember to give permitions to `requirements.sh` before to try to execute.

## How to use :ringed_planet:
Execute `dpress` file. The script will detect file extension and use the tool with their arguments to work with in the current directory. To change default behavior, use one of these commands:

```Bash
./dpress <command> <flag> <file.zip> <...>
```

| Command | Description                                                                                 |
|----------|---------------------------------------------------------------------------------------------|
| `l`       | List files in compressed file. It doesn't extract the files just list it|
| `e`       | Extract files from compressed file |
| `c`       | Create a compressed file, can be `zip`, `rar`,`tar.gz` or `tar.xz` file. It requires a second argument which is the source file|

| Flag | Description                                                                                 |
|----------|---------------------------------------------------------------------------------------------|
| `-d` / `-del`       | Remove source file after extraction or compression|
| `-r` / `-re`       | Extract files recursively|


> Check `wiki` to see some examples to learn how to use it.

## Limitations :construction:
- For files with names separated with spaces, you must rename that file to `trim` or `strip` its name , otherwise you will get an [error](https://stackoverflow.com/questions/30999227/how-to-solve-unzip-cannot-find-or-open-error-in-linux-os).
- For files with `xz` extension you only must compress and decompress a dir with many files, doesn't work if you try to do with a single file.

---
:bamboo: ~
