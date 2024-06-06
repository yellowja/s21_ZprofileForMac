# zprofile для Школы 21

## Установка
Скачайте и выполните скрипт [update.sh](https://github.com/macygabr/ZprofileForMac/blob/main/update.sh).

Или воспользуйтесь следующей командой:
```bash
curl https://raw.githubusercontent.com/macygabr/ZprofileForMac/main/.zprofile > ~/.zprofile
```

## Новые функции

1. **help**
   - Выводит подсказку.

2. **brsw**
   - Активируется при любом запуске терминала.
   - При отсутствии `homebrew` скачивает его в `goinfre` и устанавливает `lcov`.
   - При присутствии `homebrew` загружает его переменные среды.

3. **clone (git-project-link)**
   - Клонирует проект из указанного репозитория Git.
   - Создает ветку `develop`.
   - Добавляет `.DS_Store` в файл `.gitignore`.
   - Открывает проект в Visual Studio Code.
   - Пример использования: `clone https://github.com/username/project.git`.

4. **check (git-project-link)**
   - Клонирует проект из указанного репозитория Git.
   - Переключается на ветку `develop`.
   - Проверяет форматирование с помощью `clang-format` и `cppcheck`.
   - Открывает проект в Visual Studio Code для дальнейшего редактирования и проверки.
   - Пример использования: `check https://github.com/username/project.git`.

5. **code [path]**
   - Открывает файл или каталог в Visual Studio Code.
   - Пример использования: `code .`, `code path/to/file`.

6. **push [commit]**
   - Проверяет форматирование с помощью `clang-format` в файлах `*.c`, `*.cc`, `*.h`, `*.cpp`.
   - Если был использован флаг `-b`, то будет использоваться текущая ветка git, иначе cоздает/использует ветку `develop`.
   - Коммитит изменения с указанным сообщением, либо с сообщением "backup" по умолчанию.
   - Пушит изменения в удаленный репозиторий.
   - Пример использования: `push "Commit message"`, `push`, `push -b "Commit message"`, `push -b`.

7. **clean**
   - Очищает различные временные файлы и кэши для освобождения памяти.
   - Удаляет временные файлы, кэши Slack, 42_cache, VS Code, Firefox и другие.
   - Пример использования: `clean`.

8. **roll**
   - Игральная кость.
   - Пример использования: `roll`.

9. **wttr**
   - Отображает погоду в Новосибирске через сервис wttr.in.
   - Пример использования: `wttr`.

10. **qtinstall**
   - Скачивает и устанавливает Qt Creator.
   - Устанавливает программу в папку `/opt/goinfre/$(whoami)`.
   - Создает символическую ссылку в `/Users/$(whoami)/Applications`.
   - Пример использования: `qtinstall`.