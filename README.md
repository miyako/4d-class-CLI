# 4d-class-CLI
LOG EVENT wrapper class

## 8-bit and 16-bit colours

A Simple API to print [ASCII escape code](https://en.wikipedia.org/wiki/ANSI_escape_code)

```4d
var $CLI : cs.CLI

$CLI:=cs.CLI.new()

//foreground
$CLI.print("Hello World"; "red;bold;underline").LF()
//foreground and background
$CLI.print("Hello World"; "red;yellow;bold;underline").LF()

$CLI.LF()

//16-bit color
For ($i; 0; 255)
	$CLI.print(String($i; "^^0"+"   "); String($i)+";bold")
End for 

$CLI.LF()
```

<img width="634" alt="" src="https://user-images.githubusercontent.com/1725068/223434725-b708fdf0-398c-431f-ba1a-bf77d53f5146.png">


