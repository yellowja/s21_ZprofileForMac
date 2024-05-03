curl https://raw.githubusercontent.com/yellowja/s21_ZprofileForMac/main/.zprofile > ~/.zprofile

DARKYELLOW="\033[33m"
BLUE=$'\033[0;34m'
GREEN=$'\033[0;32m'
END="\033[0m";
echo "\033c"
echo "$GREEN\t\t\t\t\t\tWell Come!$END"
echo "\t\t\t\t\tNow you can use next functions:"
echo "$BLUE clone (git-project-link)\t $DARKYELLOW Clone project, create branch develop, fix gitignore (default add .DS_Store), push with commit start. default comment 'backup'$END"
echo "$BLUE check (git-project-link)\t $DARKYELLOW Clone project, switch to develop branch, check clang-format and cppcheck, open vscode.$END"
echo "$BLUE code [path]             \t $DARKYELLOW Open file or directory in vscode $END"
echo "$BLUE push [commit]           \t $DARKYELLOW Check clang-format *.c *.cc *.h *.cpp, push develop (or create).  $END"
echo "$BLUE clean                   \t $DARKYELLOW Clean memory $END"
echo "\n Please, restart your terminal."