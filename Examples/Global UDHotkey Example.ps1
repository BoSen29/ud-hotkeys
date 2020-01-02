Import-Module UniversalDashboard
Import-Module UniversalDashboard.UD-Hotkeys

$endpointinit = New-UDEndpointInitialization -Module @("UD-HotKeys")

Get-UDDashboard | Stop-UDDashboard

$dashboard = New-UDDashboard -title "Non Global Hotkeys" -Content {
    New-UDHotkeys -hotKeys {
        New-UDHotkeyMap -name "FancyHotkey" -hotkey @("backspace", "del") -action {
            #Triggered whenever the user presses backspace or delete whilst the child elements are in focus.
            New-UDHotkeyAction -endpoint {
                Show-UDToast -Message "You've deleted something"
            }
        }
        New-UDHotkeyMap -name "FancyClientSide" -hotkey "alt+k" -action {
            #triggered whenever the client presses alt+k 
            New-UDHotkeyAction -javascript "console.log('this is amazing')"
        }
    } 
    #generic content
    New-UDInput -Endpoint {
        param($stuff)
        Show-UDToast -Message "maybe $stuff"
    }

    New-UDCard -Title "This card is not a child of ud-hotkeys"

} -theme $theme -EndpointInitialization $endpointinit

Start-UDDashboard -Dashboard $dashboard -Port 8083