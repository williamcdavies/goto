# goto
`goto` is a zsh directory jumping tool. Map keywords to directories and jump to them from anywhere.

## Installation
1. Download and unpack the [latest release](../../releases/latest)
2. Run the installer:

```bash
$ chmod u+x install.sh
$ ./install.sh
```

3. Reload zsh configuration:

```bash
$ source ~/.zshrc
```

## Uninstallation

```bash
$ rm ~/.local/bin/goto.sh
$ rm ~/.goto
$ sed -i '' '/goto()/d' ~/.zshrc
$ source ~/.zshrc
```

## Usage

### `goto`

```bash
goto <key>
```

### `goto map`

```bash
goto map <key> <pathspec>
```

## Example

```bash
# Create a mapping between `projects` and `~/Documents/Projects`:
$ goto map projects ~/Documents/Projects

# Jump to `~/Documents/Projects` from anywhere
$ goto projects
```
