Import-Module UniversalDashboard
Import-Module UniversalDashboard.UD-Hotkeys

$cache:lives = 9
$endpointinit = New-UDEndpointInitialization -Module @("UD-HotKeys")

Get-UDDashboard | Stop-UDDashboard

$dashboard = New-UDDashboard -title "Lifecounter" -Content {
    New-UDHotkeys -hotKeys {
        New-UDHotkeyMap -name "FancyHotkey" -hotkey "konami" -action {
            #Triggered whenever the user presses backspace or delete whilst the child elements are in focus.
            New-UDHotkeyAction -endpoint {
                $cache:lives = $cache:lives + 30
                Sync-UDElement -Id "Lifecounter"
                Show-UDToast "Lives + 30!"
            }
        }
    } 

    New-UDCounter -Title "Lifecounter" -Id "Lifecounter" -Endpoint {
        $cache:lives
    }

} -theme $theme -EndpointInitialization $endpointinit

Start-UDDashboard -Dashboard $dashboard -Port 8083