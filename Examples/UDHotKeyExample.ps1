Import-Module UniversalDashboard
Import-Module C:\dev\ud-hotkeys\src\output\UniversalDashboard.UD-Hotkeys\UniversalDashboard.UD-Hotkeys.psm1

$endpointinit = New-UDEndpointInitialization -Module @("C:\dev\ud-hotkeys\src\output\UniversalDashboard.UD-Hotkeys\UniversalDashboard.UD-Hotkeys.psm1")

Get-UDDashboard | Stop-UDDashboard

$dashboard = New-UDDashboard -title "Calendar" -Content {

    New-UDHotkeys -scope Global -hotKeys {
        New-UDHotkeyMap -name "AllUP" -hotkey @("backspace", "del") -action {
            New-UDHotkeyAction -endpoint {
                Show-UDToast -Message "Pressed: UP"
            }
        }
        
    }

    <#New-UDHotkeyMapItem -name "kay" -hotkey "k" -action {
            New-UDHotkeyAction -endpoint {
                Show-UDToast -Message "Pressed: right"
            }
        }
        New-UDHotkeyMapItem -name "AllRight" -hotkey "alt+right" -action {
            New-UDHotkeyAction -javascript ("console.log('hei');")
        }
        New-UDHotkeyMapItem -name "AllDown" -hotkey "p a l" -action {
            New-UDHotkeyAction -endpoint {
                Show-UDToast -Message "Pressed: delete"
            }
        }
        New-UDHotkeyMapItem -name "AllLeft" -hotkey "left" -action {
            New-UDHotkeyAction -endpoint {
                Show-UDToast -Message "Pressed: left"
            }
        }#>
        
        <#
        New-UDHotkeyMapItem -name "AllDown" -hotkey "down" -action {
            New-UDHotkeyAction -javascript "console.log('thou shalt not')"
        }#>
    New-UDCard -Id "ButtonCard" -Title "Buttons" -titlealignment "center" -Content {
        New-UDParagraph -Text "Hello bruv"
    }
} -EndpointInitialization $endpointinit

Start-UDDashboard -Dashboard $dashboard -Port 8083