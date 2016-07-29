

class Logger {

    


    static [void] log([String]$message) {

        $log = "{0} - {1}" -f (Get-Date), $message

        Write-Information -MessageData $log -Tags Low
        $log | Out-File $PSScriptRoot\Log.txt -Append 


    }


}