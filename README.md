# zprofile для Школы 21

## Установка

Воспользуйтесь следующей командой:
```bash
cp ~/.zprofile ~/.zprofile.backup; curl https://raw.githubusercontent.com/macygabr/ZprofileForMac/main/.zprofile > ~/.zprofile && source ~/.zprofile
```
Эта команда создаст резервную копию текущего файла .zprofile под именем .zprofile.backup, после чего обновит оригинальный файл.

## Новые функции
0. **Действия при открытии терминала**
   - Автоматически обновляет `.zprofile` до актуальной версии.
   - Очищает различные временные файлы и кэши для освобождения памяти.
   - При отсутствии Homebrew в `goinfre` скачивает и устанавливает Homebrew и LCOV в `goinfre`.
   - При наличии Homebrew в `goinfre` активирует среду Homebrew.

1. **help**
   - Выводит подсказку.

2. **init (-flag)**
   -  ***-java***
      - Устанавливает комплект разработчика для языка программирования `Openjdk@22`.
      - Устанавливает инструмент управления и анализа программных проектов `Maven`
      - Пример использования: `init -java`.
   -  ***-qt***
      - Скачивает и устанавливает Qt Creator.
      - Устанавливает программу в папку `/opt/goinfre/$(whoami)`.
      - Создает символическую ссылку в `/Users/$(whoami)/Applications`.
      - Пример использования: `init -qt`.
   -  ***-tor***
      - Автоматически находит последнюю стабильную версию Tor Browser на зеркале `tor.zilog.es`.
      - Формирует правильную ссылку для скачивания `.dmg` файла.
      - Устанавливает программу в папку `/opt/goinfre/$(whoami)`.
      - Создает символическую ссылку в `/Users/$(whoami)/Applications`.
      - Пример использования: `init -tor`.
   -  ***-install***
      - Скачивает и устанавливает программу по прямой ссылке на dmg файл.
      - Устанавливает программу в папку `/opt/goinfre/$(whoami)`.
      - Создает символическую ссылку в `/Users/$(whoami)/Applications`.
      - Пример использования: `init -install "https://downloads.sourceforge.net/qbittorrent/qbittorrent-mac/qbittorrent-4.6.5/qbittorrent-4.6.5.dmg"`.

3. **check (git-project-link)**
   - Клонирует проект из указанного репозитория Git.
   - Переключается на ветку `develop`.
   - Проверяет форматирование с помощью `clang-format` и `cppcheck`.
   - Открывает проект в Visual Studio Code для дальнейшего редактирования и проверки.
   - Пример использования: `check https://github.com/username/project.git`.


4. **push [commit]**
   - Проверяет форматирование с помощью `clang-format` в файлах `*.c`, `*.cc`, `*.h`, `*.cpp`.
   - Если был использован флаг `-d`, cоздает/использует ветку `develop`, иначе будет использоваться текущая ветка git.
   - Коммитит изменения с указанным сообщением, либо с сообщением "backup" по умолчанию.
   - Пушит изменения в удаленный репозиторий.
   - Пример использования: `push "Commit message"`, `push`, `push -d "Commit message"`, `push -d`.

5. **code [path]**
   - Открывает файл или каталог в Visual Studio Code.
   - Пример использования: `code .`, `code path/to/file`.

6. **clean**
   - Очищает различные временные файлы и кэши для освобождения памяти.
   - Удаляет временные файлы, кэши Slack, 42_cache, VS Code, Firefox и другие.
   - Пример использования: `clean`.

7. **sql (-flag)**

   #### 7.1
   - При вводе флага `-c`:
   - Ожидается на ввод сначала количества папок, затем номер дня.
   - Создает указанное количество папок с заданиями, внутри каждой папки - SQL-файл с указанным днем.
   - После ввода команды и числа создаваемых папок ожидается ввод дня-SQL.
   - Пример использования: `sql -c`, `10`, `5`, `y`.

   #### 7.2
   - При вводе флага `-d`:
   - Удаляет все папки с заданиями SQL по шаблону [ex**] в текущей директории и соответственно все их содержимое.
   - При отсутствии папок с заданиями выводит сообщение о том, что удалять нечего.
   - При нахождении папок с заданиями выводится вопрос с ожиданием подтверждения об удалении (y - да, удалить / n - нет, отменить / любой другой ввод - сообщение об ошибке, отмена операции).
   - Пример использования: `sql -d`, `y`.

8. **dockerln**
   - Удаляет папку с контейнерами докера в домашней директории и линканет ее в goinfre.
   - Пример использования: `dockerln`.

9. **freln (source_path) [goinfre_subfolder]**
   - Перемещает папку в `goinfre` и линкует ее в исходной директории.
   - Если `goinfre_subfolder` не указан, то по умолчанию используется папка `links`.
   - Пример использования: 
     - `freln /path/to/source` — переместит папку в `~/goinfre/links/source` и создаст символическую ссылку.
     - `freln /path/to/source custom_folder` — переместит папку в `~/goinfre/custom_folder/source` и создаст символическую ссылку.

10. **wttr**
   - Отображает погоду в Новосибирске через сервис wttr.in.
   - Пример использования: `wttr`.
