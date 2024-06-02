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
# Space after cleanup
echo "$cyan"'----|After  cleanup|----|'
echo "$blue"'Size  '"$cyan"'|  '"$red"'Used  '"$cyan"'|  '"$green"'Avail '"$cyan"'|'"$reset"
df -h | grep Users | awk -v cyan="$cyan" -v green="$green" -v blue="$blue" -v red="$red" '{print blue $2 " "cyan"=  " red $3 cyan" +  "  green $4 " "cyan"|"}'
echo -n "$reset"
echo "$cyan"'----|Cleanup  ended|----|'
}


function roll {
roll=$((RANDOM % 6 + 1))

print_dice() {
    case $1 in
        1)
            echo "┌─────┐
│     │
│  *  │
│     │
└─────┘
"
            ;;
        2)
            echo "┌─────┐
│ *   │
│     │
│   * │
└─────┘
"
            ;;
        3)
            echo "┌─────┐
│ *   │
│  *  │
│   * │
└─────┘
"
            ;;
        4)
            echo "┌─────┐
│ * * │
│     │
│ * * │
└─────┘
"
            ;;
        5)
            echo "┌─────┐
│ * * │
│  *  │
│ * * │
└─────┘
"
            ;;
        6)
            echo "┌─────┐
│ * * │
│ * * │
│ * * │
└─────┘
"
            ;;
    esac
}
print_dice $roll
}

function wttr {
curl "https://wttr.in/Novosibirsk?lang=ru"
}

qtinstall() {
# Путь к .dmg файлу
DMG_URL="https://downloader.disk.yandex.ru/disk/0d2e94b1a41f6d370484e573e5a0236b35affd3379b63e48f59cef3ea50b6e6e/665c8fa1/6gWDfKY9Uw-ziZVbyZyBDwDln-_vXvNn9LRZaNMc3Fn24EMSrUkONwUYXEQ1ASiGPoUFQNpsY4bYsmf32pkLyQ%3D%3D?uid=0&filename=qt-creator-opensource-mac-x86_64-7.0.0.dmg&disposition=attachment&hash=U0Z2ycdXZw3rbxPoy5BwTQPYbrQ4O21l/4eykFTX3bN%2BA1mDtC2nzxS0fFHXrlZNq/J6bpmRyOJonT3VoXnDag%3D%3D&limit=0&content_type=application%2Fx-bzip2&owner_uid=123224278&fsize=383673013&hid=d5bed3ed8a734d60ccf8f5cc69fb8275&media_type=compressed&tknv=v2"

# Имя .dmg файла
DMG_FILE="qt-creator-opensource-mac-x86_64-7.0.0.dmg"

# Папка для установки
INSTALL_DIR="/opt/goinfre/$(whoami)"

# Скачиваем .dmg файл
curl "$DMG_URL" -L -o "$DMG_FILE"

# Проверка успешности загрузки
if [ $? -ne 0 ]; then
    echo "Ошибка при скачивании файла."
    exit 1
fi

# Создаем папку для установки, если её нет
mkdir -p "$INSTALL_DIR"

# Монтируем .dmg файл
hdiutil attach "$DMG_FILE" -nobrowse -mountpoint /Volumes/qt-creator

# Проверка успешности монтирования
if [ $? -ne 0 ]; then
    echo "Ошибка при монтировании .dmg файла."
    exit 1
fi

# Копируем содержимое из смонтированного образа в папку установки
cp -R /Volumes/qt-creator/Qt\ Creator.app "$INSTALL_DIR"

# Демонтируем .dmg файл
hdiutil detach /Volumes/qt-creator

# Проверка успешности демонтажа
if [ $? -ne 0 ]; then
    echo "Ошибка при демонтаже .dmg файла."
    exit 1
fi

# Создаем символическую ссылку в /Applications
ln -s "$INSTALL_DIR/Qt Creator.app" "$LINK_PATH"

# Проверка успешности создания символической ссылки
if [ $? -ne 0 ]; then
    echo "Ошибка при создании символической ссылки."
    exit 1
fi

# Удаляем .dmg файл
rm "$DMG_FILE"

echo "Установка завершена. Qt Creator установлен в $INSTALL_DIR и добавлен в Launchpad."
}