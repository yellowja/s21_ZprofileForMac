# zprofile для Школы 21
- `clone (git-project-link)` - Клонирует проект, создает ветку develop, изменяет gitignore (по умолчанию добавляет .DS_Store), пушит с комментарием (по умолчанию 'backup').
- `check (git-project-link)` - Клонирует проект, переключается на ветку develop, проверяет clang-format и cppcheck, открывает vscode.
- `code [path]` - открыть файл или каталог в vscode.
- `push [commit]` - проверяет clang-format в файлах *.c *.cc *.h *.cpp, пушит в ветку develop (или создает ее).
- `clean` - очистить память.