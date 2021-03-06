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

        $Out = [Hashtable]@{
            name = $name
            action = ""
            keyMap = $hotkey
            isEndpoint = $false
        }
        
    }

    Process {
        $actionInvoked = $action.Invoke()
        
        if ($actionInvoked.type -eq "Endpoint") {
            $Out.isEndpoint = $true
            $Out.action = $actionInvoked.id
        }
        else {
            $Out.action = $actionInvoked.javascript
        }

        #$out.action.$name = ('() => ' + $out.action.$name)
    }
    
    End {
        return $Out
    }
}