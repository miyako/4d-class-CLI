![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)
[![license](https://img.shields.io/github/license/miyako/4d-class-CLI)](LICENSE)
![downloads](https://img.shields.io/github/downloads/miyako/4d-class-CLI/total)

`LOG EVENT` wrapper class.

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

# References

https://blog.4d.com/headless-4d-applications/

https://developer.4d.com/docs/Admin/cli/

https://doc.4d.com/4Dv19/4D/19/Command-Line-Interface.300-5416693.en.html
