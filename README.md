![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)
[![license](https://img.shields.io/github/license/miyako/4d-class-CLI)](LICENSE)
![downloads](https://img.shields.io/github/downloads/miyako/4d-class-CLI/total)

`LOG EVENT` wrapper class.

**Note**: On older versions of Windows you may need to set the `HKEY_CURRENT_USER\Console\VirtualTerminalLevel` registry key to `1` to activate [Console Virtual Terminal Sequences](https://learn.microsoft.com/en-us/windows/console/console-virtual-terminal-sequences?redirectedfrom=MSDN).

c.f. https://superuser.com/questions/413073/windows-console-with-ansi-colors-handling  
see also https://github.com/ytdl-org/youtube-dl/issues/15758

To print unicode to the command prompt on the Windows command prompt you may need to `chcp 65001`.

# 8-bit and 16-bit colours

A Simple API to print [ASCII escape codes](https://en.wikipedia.org/wiki/ANSI_escape_code).

```4d
var $CLI : cs.CLI

$CLI:=cs.CLI.new()

//foreground
$CLI.print("Hello World"; "red;bold;underline").LF()
//foreground and background
$CLI.print("Hello World"; "red;yellow;bold;underline").LF()
```

<img src="https://user-images.githubusercontent.com/1725068/223435308-4fb3bf62-80cc-4d34-b928-e44c81237a0c.png" style="height:180px;width:auto;" />

```4d
$CLI.LF()

//16-bit color
For ($i; 0; 255)
	$CLI.print(String($i; "^^0"+"   "); String($i)+";bold")
End for 

$CLI.LF()
```

<img src="https://user-images.githubusercontent.com/1725068/223434725-b708fdf0-398c-431f-ba1a-bf77d53f5146.png" style="height:360px;width:auto;" />

# Progress indicator

```4d
var $CLI : cs.CLI

$CLI:=cs.CLI.new()

$CLI.ES().XY(0; 0)

$CLI.hideCursor()

For ($i; 1; 100)
	$CLI.CR().print(String($i; "^^0")+"%%").EL()
	DELAY PROCESS(Current process; 1)
End for 

$CLI.showCursor()

$CLI.LF()
```

# Notes

By default, diagnostic warnings (level 5) are printed to the console in headless mode. To filter these messages from the CLI, you might want to activate the diagnostic log file or else limit the information to errors (level 6).

* Settings/logConfig.json

```json
{
 "diagnosticLogs":{
		"state" : 1,
		"level" : 6
 }
}
```

c.f. https://developer.4d.com/docs/Debugging/debugLogFiles

# References

[Headless 4D applications](https://blog.4d.com/headless-4d-applications/)

[Command Line Interface](https://developer.4d.com/docs/Admin/cli/)

[A Tool for 4D Code Execution in CLI](https://blog.4d.com/a-tool-for-4d-code-execution-in-cli/)
