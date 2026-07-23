# goto
`goto` is a directory jumping tool built for macOS.
 
## Installation
1. Download and unpack the [latest release](../../releases/latest)
2. Run the installer:

```bash
$ chmod u+x installer.sh
$ sudo ./installer.sh
$ source ~/.zshrc
```

## Uninstallation
1. Download and unpack the [latest release](../../releases/latest)
2. Run the uninstaller

```bash
$ chmod u+x uninstaller.sh
$ sudo ./uninstaller.sh
$ source ~/.zshrc
```


## Usage

### `goto`
Jumps to the directory bound to `<key>`.

```bash
goto <key>
```

### `goto bind`
Creates a binding between a keyword and a system path.

```bash
goto bind <key> <path>
```

### `goto unbind`
Removes the binding between a keyword and a system path.

```bash
goto unbind <key>
```

### `goto list`
Lists all keyword-path bindings.

```bash
goto list
```