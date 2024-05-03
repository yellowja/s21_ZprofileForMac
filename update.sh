curl https://raw.githubusercontent.com/yellowja/s21_ZprofileForMac/main/.zprofile > ~/.zprofile

DARKYELLOW="\033[33m"
BLUE=$'\033[0;34m'
GREEN=$'\033[0;32m'
END="\033[0m"

printf "\n\t\t${GREEN}Welcome!${END}\n"
printf "\tNow you can use the following functions:\n"
printf "${BLUE}clone (git-project-link)${DARKYELLOW}\t\t Clones a project from the specified Git repository,\n\t\t\t\t\t creates a 'develop' branch, adjusts the .gitignore file (default: adds .DS_Store),\n\t\t\t\t\t and pushes with a commit message 'backup' (default).${END}\n"
printf "\n${BLUE}check (git-project-link)${DARKYELLOW}\t\t Clones a project from the specified Git repository,\n\t\t\t\t\t switches to the 'develop' branch, checks formatting using clang-format and cppcheck,\n\t\t\t\t\t and opens the project in Visual Studio Code.${END}\n"
printf "\n${BLUE}code [path]${DARKYELLOW}\t\t\t\t Opens a file or directory in Visual Studio Code.${END}\n"
printf "\n${BLUE}push [commit]${DARKYELLOW}\t\t\t\t Checks formatting using clang-format in *.c, *.cc, *.h, *.cpp files,\n\t\t\t\t\t pushes changes to the 'develop' branch (or creates it), with the specified commit\n\t\t\t\t\t message (or default 'backup').${END}\n"
printf "\n${BLUE}clean${DARKYELLOW}\t\t\t\t\t Cleans memory.${END}\n"
printf "\n Please, restart your terminal.\n"

