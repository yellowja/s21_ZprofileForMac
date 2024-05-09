function push {
#Default commit 'backup'
  cd $(pwd)
  find . -type f  -name *.cc -o -name *.h -o -name *.cpp | xargs clang-format -style='{BasedOnStyle: Google}' -i
  if [ -n $1 ]
  then
    commit=$1
  else
  commit=backup
  fi
  git checkout -b develop
  git checkout develop
  git add .
  git commit -m $commit
  git push --set-upstream origin develop
}

function code {
  open -a 'Visual Studio Code' $1
}

function brsw {
 if [ -d /opt/goinfre/$(whoami)/homebrew ];
 then
  eval "$(/opt/goinfre/$(whoami)/homebrew/bin/brew shellenv)"
  chmod -R go-w "$(brew --prefix)/share/zsh"
 else
  cd /opt/goinfre/$(whoami)
  git clone https://github.com/Homebrew/brew homebrew
  eval "$(/opt/goinfre/$(whoami)/homebrew/bin/brew shellenv)"
  brew update --force --quiet
  chmod -R go-w "$(brew --prefix)/share/zsh"
  brew install lcov
 fi
}
brsw

function check {
echo '[32mClone[0m'
git clone $1
cd $(echo $1 | awk -F / '{print $NF}' | sed -r 's/.git+//')
git checkout develop
code .

echo '[32mCheck clang-format[0m'
cd src
cp ../materials/linters/.clang-format .
clang-format -n $(find . -type f -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.cc")
rm -rf .clang-format

echo '[32mCpp check[0m'
cppcheck --enable=all --suppress=missingIncludeSystem *.c *.h *.cpp *.cc
return 0
}

function clone {
  echo '[32mClone[0m'
  git clone $1
  cd $(echo $1 | awk -F / '{print $NF}' | sed -r 's/.git+//')
  git checkout -b develop
  echo '[32mChange gitignore[0m'
  sleep 1
  echo '
# My ignore list' >> .gitignore
  echo '.DS_Store' >> .gitignore
  code .
  push start
}

function clean {
#!/bin/bash]
# Colors
blue=$'[0;34m'
cyan=$'[1;96m'
reset=$'[0;39m'
green=$'[0;32m'
red=$'[0;31m'
# Initial total space, used and available
echo "$cyan"'----|Before cleanup|----|'
echo "$blue"'Size  '"$cyan"'|  '"$red"'Used  '"$cyan"'|  '"$green"'Avail '"$cyan"'|'"$reset"
df -h | grep Users | awk -v cyan="$cyan" -v green="$green" -v blue="$blue" -v red="$red" '{print blue $2 " "cyan"=  " red $3 cyan" +  "  green $4 " "cyan"|"}'
echo -n "$reset"

# Cleanup...
rm -rf ~/Library/Application\ Support/Slack/Code\ Cache/ 2>/dev/zero
rm -rf ~/Library/Application\ Support/Slack/Cache/ 2>/dev/zero
rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/ 2>/dev/zero

rm -rf ~/Library/42_cache/ 2>/dev/zero
rm -rf ~/Library/Caches/CloudKit 2>/dev/zero
rm -rf ~/Library/Caches/com.apple.akd 2>/dev/zero
rm -rf ~/Library/Caches/com.apple.ap.adprivacyd 2>/dev/zero
rm -rf ~/Library/Caches/com.apple.appstore 2>/dev/zero
rm -rf ~/Library/Caches/com.apple.appstoreagent 2>/dev/zero
rm -rf ~/Library/Caches/com.apple.cache_delete 2>/dev/zero
rm -rf ~/Library/Caches/com.apple.commerce 2>/dev/zero
rm -rf ~/Library/Caches/com.apple.iCloudHelper 2>/dev/zero
rm -rf ~/Library/Caches/com.apple.imfoundation.IMRemoteURLConnectionAgent 2>/dev/zero
rm -rf ~/Library/Caches/com.apple.keyboardservicesd 2>/dev/zero
rm -rf ~/Library/Caches/com.apple.nbagent 2>/dev/zero
rm -rf ~/Library/Caches/com.apple.nsservicescache.plist 2>/dev/zero
rm -rf ~/Library/Caches/com.apple.nsurlsessiond 2>/dev/zero
rm -rf ~/Library/Caches/storeassetd 2>/dev/zero
rm -rf ~/Library/Caches/com.microsoft.VSCode.ShipIt 2>/dev/zero
rm -rf ~/Library/Caches/com.microsoft.VSCode 2>/dev/zero
rm -rf ~/Library/Caches/com.google.SoftwareUpdate 2>/dev/zero
rm -rf ~/Library/Caches/com.google.Keystone 2>/dev/zero
rm -rf ~/Library/Caches/com.apple.touristd 2>/dev/zero
rm -rf ~/Library/Caches/com.apple.tiswitcher.cache 2>/dev/zero
rm -rf ~/Library/Caches/com.apple.preferencepanes.usercache 2>/dev/zero
rm -rf ~/Library/Caches/com.apple.preferencepanes.searchindexcache 2>/dev/zero
rm -rf ~/Library/Caches/com.apple.parsecd 2>/dev/zero
rm -rf ~/Library/Caches/ 2>/dev/zero
rm -rf ~/.Trash/\* 2>/dev/zero
rm -rf ~/.kube/cache/\* 2>/dev/zero
rm -rf ~/Library/Containers/com.docker.docker/Data/vms/\* 2>/dev/zero
rm -rf ~/Library/Application\ Support/Firefox/Profiles/hdsrd79k.default-release/storage 2>/dev/zero
rm -rf ~/Library/42_cache 2>/dev/zero
rm -rf ~/Library/Application\ Support/Code/User/workspaceStorage 2>/dev/zero
rm -rf ~/Library/Application\ Support/Spotify/PersistentCache 2>/dev/zero
rm -rf ~/Library/Application\ Support/Telegram\ Desktop/tdata/user_data 2>/dev/zero
rm -rf ~/Library/Application\ Support/Telegram\ Desktop/tdata/emoji 2>/dev/zero
rm -rf ~/Library/Application\ Support/Code/Cache/Library/Application\ Support/Code/Cachei 2>/dev/zero
rm -rf ~/Library/Application\ Support/Code/CacheData 2>/dev/zero
rm -rf ~/Library/Application\ Support/Code/Cache 2>/dev/zero
rm -rf ~/Library/Application\ Support/Code/Crashpad/completed 2>/dev/zero
rm -rf ~/Library/Caches/\* 2>/dev/zero
rm -rf ~/Library/Application\ Support/Slack/Cache/\* 2>/dev/zero
rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/\* 2>/dev/zero
rm -rf ~/Library/Group\ Containers/6N38VWS5BX.ru.keepcoder.Telegram/account-570841890615083515/postbox/\* 2>/dev/zero
rm -rf ~/Library/Caches 2>/dev/zero
rm -rf ~/Library/Application\ Support/Code/CachedData 2>/dev/zero
rm -rf ~/Library/Application\ Support/Code/CachedExtension 2>/dev/zero
rm -rf ~/Library/Application\ Support/Code/CachedExtensions 2>/dev/zero
}


function roll {
roll=$((RANDOM % 6 + 1))

print_dice() {
    case $1 in
        1)
            echo " -----
|     |
|  *  |
|     |
 -----
"
            ;;
        2)
            echo " -----
| *   |
|     |
|   * |
 -----
"
            ;;
        3)
            echo " -----
| *   |
|  *  |
|   * |
 -----
"
            ;;
        4)
            echo " -----
| * * |
|     |
| * * |
 -----
"
            ;;
        5)
            echo " -----
| * * |
|  *  |
| * * |
 -----
"
            ;;
        6)
            echo " -----
| * * |
| * * |
| * * |
 -----
"
            ;;
    esac
}
print_dice $roll
}

function wttr {
curl "https://wttr.in/?lang=ru"
}
