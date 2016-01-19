# ConEmu sample tasks

## PowerShell
```sh
powershell.exe -noexit -command "$host.ui.RawUI.WindowTitle = 'MongoDB Server'; cd C:\db\; mongod"
powershell.exe -noexit -command "$host.ui.RawUI.WindowTitle = 'Gulp'; cd C:\Project\; gulp serve"
powershell.exe -noexit -command "$host.ui.RawUI.WindowTitle = 'Karma'; cd C:\Project\; karma start"
```

## Git bash
```sh
"%ConEmuDrive%\Program Files\Git\git-cmd.exe" --no-cd --command=usr/bin/bash.exe -l -i -new_console:d:C:\Project\
```

## Putty
```sh
putty.exe -new_console -load "IoT" 
```
