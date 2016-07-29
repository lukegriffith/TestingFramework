# Collects manifest private data.
function getPrivateData {
    return $MyInvocation.MyCommand.Module.PrivateData
}