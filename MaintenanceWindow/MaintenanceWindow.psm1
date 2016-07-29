<#

#>

class MaintenanceWindow {

    [String]$ScriptPath
    




}


function Get-MaintenanceWindow {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [String]$ScriptPath
    )


    return [Runner]::MaintenanceWindow()

}

function getPrivateData {
    return $MyInvocation.MyCommand.Module.PrivateData
}