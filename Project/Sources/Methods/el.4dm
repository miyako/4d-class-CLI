//%attributes = {}
var $CLI : cs:C1710.CLI

$CLI:=cs:C1710.CLI.new()

$CLI.ES().XY(0; 0)

$CLI.hideCursor()

For ($i; 1; 100)
	$CLI.CR().print(String:C10($i; "^^0")+"%%").EL()
	DELAY PROCESS:C323(Current process:C322; 1)
End for 

$CLI.showCursor()

$CLI.LF()