function New-UDHotkeyMap {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory = $true)]
        [string]$name,
        [Parameter(
            Mandatory = $true)]
        [string[]]$hotkey,
        [Parameter(
            Mandatory = $true)]
        [scriptblock]$action
    )
    Begin {
        if ( $hotkey -eq "konami") {
            $hotkey = "up up down down left right left right b a s t a r t"
        }
        if ($hotkey.count -gt 1) {
            $hotkey = [array]$hotkey
        }

        $Out = @{
            name = $name
            action = ""
            keyMap = $hotkey
        }
        
    }

    Process {
        $actionInvoked = $action.Invoke()
        
        if ($actionInvoked.type -eq "Endpoint") {
            $Out.isEndpoint = $true
            $Out.action = $actionInvoked.id
        }
        else {
            $Out.isEndpoint = $false
            $Out.action = $actionInvoked.javascript
        }

        #$out.action.$name = ('() => ' + $out.action.$name)
    }
    
    End {
        return $Out
    }
}