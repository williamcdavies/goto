# goto
`goto` is a `zsh` directory jumping tool.

## Installation
1. Download and unpack the [latest release](../../releases/latest)
2. Run the installer:

```bash
$ chmod u+x installer.sh
$ ./installer.sh
$ source ~/.zshrc
```

## Uninstallation
1. Download and unpack the [latest release](../../releases/latest)
2. Run the uninstaller

```bash
$ chmod u+x uninstaller.sh
$ ./uninstaller.sh
$ source ~/.zshrc
```


## Usage

### `goto`

```bash
goto <key>
```

### `goto bind`

```bash
goto bind <key> <path>
```

## Examples

```bash
# Create a binding between `projects` and `~/Documents/Projects`:
$ goto map projects ~/Documents/Projects

# Jump to `~/Documents/Projects`
$ goto projects
```