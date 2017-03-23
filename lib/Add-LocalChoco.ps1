function Add-LocalChoco {
    [CmdletBinding()]
    [OutputType([void])]
    param (
        [Parameter(Mandatory=$true)]
        [string]
        $LocalConfigurationFilePath
    )
    
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
    choco install chocolateygui -y
    choco install $LocalConfigurationFilePath -y -pre
}
