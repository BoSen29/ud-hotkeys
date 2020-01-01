function New-UDHotkeyAction {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory = $true,
            ParameterSetName = "Endpoint")]
        [object]$endpoint,
        [Parameter(
            ParameterSetName = "Clientside",
            Mandatory = $true)]
        [string]$javascript,
        [Parameter()]
        [string]$Id = ([Guid]::NewGuid())
    )

    Begin {
        if ($PSCmdlet.ParameterSetName -eq "Endpoint") {
            if ($endpoint -is [scriptblock]) {
                $endpoint = New-UDEndpoint -Endpoint $endpoint -Id $Id
            }
            elseif ($endpoint -isnot [UniversalDashboard.Models.Endpoint]) {
                throw "Action must be a script block or UDEndpoint."
            }
        }
    }

    Process {
        $out = @{
            id = $Id
            type = $PSCmdlet.ParameterSetName
            javascript = $javascript
        }
    }
    
    End {
        return $out
    }
}