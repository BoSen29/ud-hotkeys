---
external help file: UniversalDashboard.UD-Hotkeys-help.xml
Module Name: UniversalDashboard.UD-Hotkeys
online version:
schema: 2.0.0
---

# New-UDHotkeyMap

## SYNOPSIS
Map an hotkey and a action, with a given name to the parent UDHotkeys

## SYNTAX

```
New-UDHotkeyMap [-name] <String> [-hotkey] <String[]> [-action] <ScriptBlock> [<CommonParameters>]
```

## DESCRIPTION
Map an hotkey and a action, with a given name to the parent UDHotkeys

## EXAMPLES

### Example 1
```powershell
PS C:\> New-UDHotkeyMap -name "anyName" -hotkey @("ctrl+k", "ctrl+i") -action {New-UDHotkeyAction -endpoint {Show-UDToast (Get-Random)}}
```

Adds a hotkey with the name "anyName", to trigger the endpoint of New-UDHotkeyAction whenever either ctrl+k or ctrl+i is pressed.

## PARAMETERS

### -action
Scriptblock to be populated with an New-UDHotkeyAction

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -hotkey
Hotkey definition to listen

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -name
Unique name for the binding

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
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
