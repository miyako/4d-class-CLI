Class constructor
	
	This:C1470.ASCII:=New object:C1471
	This:C1470.ASCII.ESC:=Char:C90(ESC ASCII code:K15:28)
	This:C1470.ASCII.CR:=Char:C90(Carriage return:K15:38)
	This:C1470.ASCII.LF:=Char:C90(Line feed:K15:40)
	
	This:C1470.RESET:=This:C1470.ASCII.ESC+"[0m"
	
	This:C1470.COLOR:=New object:C1471
	This:C1470.COLOR.BLACK:=30
	This:C1470.COLOR.RED:=31
	This:C1470.COLOR.GREEN:=32
	This:C1470.COLOR.YELLOW:=33
	This:C1470.COLOR.BLUE:=34
	This:C1470.COLOR.MAGENTA:=35
	This:C1470.COLOR.CYAN:=36
	This:C1470.COLOR.WHITE:=37
	This:C1470.COLOR.RGB:=38
	
	This:C1470.BACKGROUND:=10
	
	This:C1470.STYLE:=New object:C1471
	This:C1470.STYLE.BOLD:=1
	This:C1470.STYLE.UNDERLINE:=4
	This:C1470.STYLE.REVERSED:=7
	
	This:C1470.CURSOR:=New object:C1471
	This:C1470.CURSOR.UP:="A"
	This:C1470.CURSOR.DOWN:="B"
	This:C1470.CURSOR.RIGHT:="C"
	This:C1470.CURSOR.LEFT:="D"
	
Function _cursor($units : Integer; $code : Text)->$this : cs:C1710.CLI
	
	If ($units>0)
		$ANSI:=This:C1470.ASCII.ESC+"["+String:C10($units)+$code
		$this:=This:C1470.print($ANSI)
	Else 
		$this:=This:C1470
	End if 
	
Function CR()->$this : cs:C1710.CLI
	
	$this:=This:C1470.print(This:C1470.ASCII.CR)
	
Function LF()->$this : cs:C1710.CLI
	
	$this:=This:C1470.print(This:C1470.ASCII.LF)
	
Function _color($color : Text)->$ANSI : Collection
	
	$ANSI:=New collection:C1472
	
	var $attributes : Collection
	var $attribute : Text
	
	$attributes:=Split string:C1554($color; ";"; sk ignore empty strings:K86:1 | sk trim spaces:K86:2)
	
	ARRAY LONGINT:C221($pos; 0)
	ARRAY LONGINT:C221($len; 0)
	
	var $set : Boolean
	
	For each ($attribute; $attributes)
		Case of 
			: ($attribute="black")
				If ($set)
					$ANSI.push(This:C1470.COLOR.BLACK+This:C1470.BACKGROUND)
				Else 
					$ANSI.push(This:C1470.COLOR.BLACK)
					$set:=True:C214
				End if 
			: ($attribute="red")
				If ($set)
					$ANSI.push(This:C1470.COLOR.RED+This:C1470.BACKGROUND)
				Else 
					$ANSI.push(This:C1470.COLOR.RED)
					$set:=True:C214
				End if 
			: ($attribute="green")
				If ($set)
					$ANSI.push(This:C1470.COLOR.GREEN+This:C1470.BACKGROUND)
				Else 
					$ANSI.push(This:C1470.COLOR.GREEN)
					$set:=True:C214
				End if 
			: ($attribute="yellow")
				If ($set)
					$ANSI.push(This:C1470.COLOR.YELLOW+This:C1470.BACKGROUND)
				Else 
					$ANSI.push(This:C1470.COLOR.YELLOW)
					$set:=True:C214
				End if 
			: ($attribute="blue")
				If ($set)
					$ANSI.push(This:C1470.COLOR.BLUE+This:C1470.BACKGROUND)
				Else 
					$ANSI.push(This:C1470.COLOR.BLUE)
					$set:=True:C214
				End if 
			: ($attribute="magenta")
				If ($set)
					$ANSI.push(This:C1470.COLOR.MAGENTA+This:C1470.BACKGROUND)
				Else 
					$ANSI.push(This:C1470.COLOR.MAGENTA)
					$set:=True:C214
				End if 
			: ($attribute="cyan")
				If ($set)
					$ANSI.push(This:C1470.COLOR.CYAN+This:C1470.BACKGROUND)
				Else 
					$ANSI.push(This:C1470.COLOR.CYAN)
					$set:=True:C214
				End if 
			: ($attribute="white")
				If ($set)
					$ANSI.push(This:C1470.COLOR.WHITE+This:C1470.BACKGROUND)
				Else 
					$ANSI.push(This:C1470.COLOR.WHITE)
					$set:=True:C214
				End if 
			: (Match regex:C1019("\\d+"; $attribute))
				$rgb:=Num:C11($attribute)
				If ($rgb<256)
					If ($set)
						$ANSI.push(This:C1470.COLOR.RGB+This:C1470.BACKGROUND)
						$ANSI.push(5)
						$ANSI.push($rgb)
					Else 
						$ANSI.push(This:C1470.COLOR.RGB)
						$ANSI.push(5)
						$ANSI.push($rgb)
						$set:=True:C214
					End if 
				End if 
		End case 
	End for each 
	
Function _style($style : Text)->$ANSI : Collection
	
	$ANSI:=New collection:C1472
	
	var $attributes : Collection
	var $attribute : Text
	
	$attributes:=Split string:C1554($style; ";"; sk ignore empty strings:K86:1 | sk trim spaces:K86:2)
	
	For each ($attribute; $attributes)
		Case of 
			: ($attribute="bold")
				$ANSI.push(This:C1470.STYLE.BOLD)
			: ($attribute="underline")
				$ANSI.push(This:C1470.STYLE.UNDERLINE)
			: ($attribute="reversed")
				$ANSI.push(This:C1470.STYLE.REVERSED)
		End case 
	End for each 
	
Function escape($message : Text; $style : Text)->$ANSI : Text
	
	$ANSI:=This:C1470._style($style).combine(This:C1470._color($style)).join(";")
	
	If ($ANSI#"")
		$ANSI:=This:C1470.ASCII.ESC+"["+$ANSI+"m"+$message+This:C1470.RESET
	Else 
		$ANSI:=$message
	End if 
	
Function print($message : Text; $style : Text)->$this : cs:C1710.CLI
	
	$ANSI:=This:C1470.escape($message; $style)
	
	LOG EVENT:C667(Into system standard outputs:K38:9; $ANSI; Information message:K38:1)
	
	$this:=This:C1470