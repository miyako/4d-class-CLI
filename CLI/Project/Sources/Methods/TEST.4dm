//%attributes = {}
var $CLI : cs:C1710.CLI

$CLI:=cs:C1710.CLI.new()

//foreground
$CLI.print("Hello World"; "red;bold;underline").LF()
//foreground and background
$CLI.print("Hello World"; "red;yellow;bold;underline").LF()

$CLI.LF()

//16-bit color
For ($i; 0; 255)
	$CLI.print(String:C10($i; "^^0"+"   "); String:C10($i)+";bold")
End for 

$CLI.LF()