function Add-LocalChoco {
    [CmdletBinding()]
    [OutputType([void])]
    param ()
    
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
    choco install chocolateygui
    choco install chocomachine.config
}
