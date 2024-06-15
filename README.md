# zprofile для Школы 21

## Установка

Воспользуйтесь следующей командой:
```bash
cp -n ~/.zprofile ~/.zprofile.backup && curl https://raw.githubusercontent.com/macygabr/ZprofileForMac/main/.zprofile > ~/.zprofile
```
Эта команда создаст резервную копию текущего файла .zprofile под именем .zprofile.backup, после чего обновит оригинальный файл.

## Новые функции

1. **help**
   - Выводит подсказку.

2. **init (-flag)**
   -  ***-brew***
      - При любом запуске терминала и отсутствии `homebrew` скачивает его в `goinfre` и устанавливает `lcov`.
      - При присутствии `homebrew` загружает его переменные среды.
      - Пример использования: `init -brew`.
   -  ***-java***
      - Устанавливает комплект разработчика для языка программирования `Openjdk@22`.
      - Устанавливает инструмент управления и анализа программных проектов `Maven`
      - Пример использования: `init -java`.
   -  ***-qt***
      - Скачивает и устанавливает Qt Creator.
      - Устанавливает программу в папку `/opt/goinfre/$(whoami)`.
      - Создает символическую ссылку в `/Users/$(whoami)/Applications`.
      - Пример использования: `init -qt`.

3. **check (git-project-link)**
   - Клонирует проект из указанного репозитория Git.
   - Переключается на ветку `develop`.
   - Проверяет форматирование с помощью `clang-format` и `cppcheck`.
   - Открывает проект в Visual Studio Code для дальнейшего редактирования и проверки.
   - Пример использования: `check https://github.com/username/project.git`.


4. **push [commit]**
   - Проверяет форматирование с помощью `clang-format` в файлах `*.c`, `*.cc`, `*.h`, `*.cpp`.
   - Если был использован флаг `-b`, то будет использоваться текущая ветка git, иначе cоздает/использует ветку `develop`.
   - Коммитит изменения с указанным сообщением, либо с сообщением "backup" по умолчанию.
   - Пушит изменения в удаленный репозиторий.
   - Пример использования: `push "Commit message"`, `push`, `push -b "Commit message"`, `push -b`.

5. **code [path]**
   - Открывает файл или каталог в Visual Studio Code.
   - Пример использования: `code .`, `code path/to/file`.

6. **clean**
   - Очищает различные временные файлы и кэши для освобождения памяти.
   - Удаляет временные файлы, кэши Slack, 42_cache, VS Code, Firefox и другие.
   - Пример использования: `clean`.

7. **roll**
   - Игральная кость.
   - Пример использования: `roll`.

8. **wttr**
   - Отображает погоду в Новосибирске через сервис wttr.in.
   - Пример использования: `wttr`.
