using Namespace System.Management.Automation.Runspaces
using Namespace System.Management.Automation
using Module .\Logger

<#
    TestingFramework.psm1
    Writing a testing framework that can run unit tests on remote boxes using PSremoting.

#>

class TestingFramework {



    static [Hashtable]$PrivateData
    
    static [Bool]$IsRunning

    static [RunspacePool] $rs

    # Initializes the module.
    static [void] Main() {

        # Function loader.
        Get-ChildItem $PSScriptRoot\Functions -filter "*.ps1" | ForEach-Object {
            . $_.FullName
        }

        # Setting static properties.
        [TestingFramework]::PrivateData = getPrivateData
        [TestingFramework]::IsRunning = $False
        [TestingFramework]::rs = [runspacefactory]::CreateRunspacePool()
        [TestingFramework]::rs.SetMaxRunspaces([TestingFramework]::PrivateData.MaxRunspace)

        # Starting log.
        [Logger]::log("-------------------------")
        [Logger]::log("TestingFramework started.")
        

    }

    static [PowerShell] CreateShell(){

        $shell = [PowerShell]::Create()
        $shell.RunspacePool = [TestingFramework]::rs

        return $shell
    }


}

class TestRun {

    [string]$ComputerName
    [string[]]$ModuleToImport
    [string]$Tests



    TestRun() {



    }


}

# Executing Main() to initialize module.
[TestingFramework]::Main()