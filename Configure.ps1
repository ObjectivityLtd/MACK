 param (
    [string]$automationRg = 'rg-automation',
    [string]$automationAccount = 'automation',
    [string]$configurationFileName = './config/devdsc.ps1',
    [string]$configurationName = 'devdsc',
    [string]$configurationNodeName = 'workstation',
    [string]$LocalConfigurationFilePath = './config/dev.config',

    [ValidateSet('full','onboard','provision','local')]
    [string]$mode = 'local'
 )

. "$PSScriptRoot/lib/Add-AzurePullServer.ps1"
. "$PSScriptRoot/lib/Add-Workstation.ps1"
. "$PSScriptRoot/lib/Add-LocalChoco.ps1"

# Local mode
if ($mode -eq 'local') {
    Add-LocalChoco $LocalConfigurationFilePath
    return
}

# Install AzureRM
if (!(Get-Module -ListAvailable -Name AzureRM)) {
    Install-Module AzureRM -AllowClobber
}

# Login to azure subscription; please use just Login-AzureRmAccount if you don't have service principal account on your subscription
Login-AzureRmAccount

if (('full','provision') -contains $mode) {
    Add-AzurePullServer -automationRg $automationRg -automationAccount $automationAccount -configurationFileName $configurationFileName -configurationName $configurationName  
}

if (('full','onboard') -contains $mode) {
    Add-Workstation -automationRg $automationRg -automationAccount $automationAccount -configurationName $configurationName -configurationNodeName $configurationNodeName
}

