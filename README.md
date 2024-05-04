# zprofile for School 21

## Installation
Download and execute the script [update.sh](https://github.com/macygabr/ZprofileForMac/blob/main/update.sh).

Alternatively, use the following command.
```bash
curl https://raw.githubusercontent.com/macygabr/ZprofileForMac/main/.zprofile > ~/.zprofile
```

## New Features

1. **brsw**
   - Activates upon launching the terminal.
   - Downloads and installs `homebrew` into `goinfre`, along with `lcov`, if `homebrew` is not installed.
   - Loads environment variables for `homebrew` if it's not installed.
   
2. **clone (git-project-link)**:
   - Clones a project from the specified Git repository.
   - Creates a `develop` branch.
   - Adds `.DS_Store` to the `.gitignore` file.
   - Opens the project in Visual Studio Code.
   - Usage example: `clone https://github.com/username/project.git`.

3. **check (git-project-link)**:
   - Clones a project from the specified Git repository.
   - Switches to the `develop` branch.
   - Checks formatting using `clang-format` and `cppcheck`.
   - Opens the project in Visual Studio Code for further editing and checking.
   - Usage example: `check https://github.com/username/project.git`.

4. **code [path]**:
   - Opens a file or directory in Visual Studio Code.
   - Usage example: `code .`, `code path/to/file`.

5. **push [commit]**:
   - Checks formatting using `clang-format` in `.c`, `.cc`, `.h`, `.cpp` files.
   - Creates a `develop` branch if it doesn't exist.
   - Commits changes with the specified message, or with the default message "backup".
   - Pushes changes to the remote repository.
   - Usage example: `push "Commit message"`, `push`.

6. **clean**:
   - Cleans various temporary files and caches to free up memory.
   - Removes temporary files, Slack caches, `42_cache`, VS Code, Firefox, and others.
   - Usage example: `clean`.