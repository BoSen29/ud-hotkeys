---
external help file: UniversalDashboard.UD-Hotkeys-help.xml
Module Name: UniversalDashboard.UD-Hotkeys
online version:
schema: 2.0.0
---

# New-UDHotkeyAction

## SYNOPSIS
Define a javascript string or a scriptblock for an endpoint to execute whenever the relevant hotkeys are pressed.

## SYNTAX

### Endpoint
```
New-UDHotkeyAction -endpoint <Object> [-Id <String>] [<CommonParameters>]
```

### Clientside
```
New-UDHotkeyAction -javascript <String> [-Id <String>] [<CommonParameters>]
```

## DESCRIPTION
Define a javascript string or a scriptblock for an endpoint to execute whenever the relevant hotkeys are pressed.

## EXAMPLES

### Example 1
```powershell
PS C:\> New-UDHotkeyAction -javascript "console.log('hello world')"
```

Adds an action to the parent hotkeymap to write "hello world" in the browser console.

## PARAMETERS

### -Id
id for endpoint

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -endpoint
Endpoint to be invoked whenever the hotkey is pressed

```yaml
Type: Object
Parameter Sets: Endpoint
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -javascript
Javascript in stringformat to execute whenever the hotkey is pressed.

```yaml
Type: String
Parameter Sets: Clientside
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
