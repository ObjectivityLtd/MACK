function Add-AzurePullServer {
    [CmdletBinding()]
    [OutputType([void])]
    param (
        [Parameter(Mandatory=$true)]
        [string]
        $automationRg,

        [Parameter(Mandatory=$true)]
        [string]
        $automationAccount,
        
        [Parameter(Mandatory=$true)]
        [string]
        $configurationFileName,
        
        [Parameter(Mandatory=$true)]
        [string]
        $configurationName
    )

   . "$PSScriptRoot/Add-cChoco.ps1"

    # Provisioning Azure Automation Pull Server
    $configurationFilePath = "$PSScriptRoot\..\$configurationFileName" 

    $location = 'West Europe'
    ## Create automation resource group and account
    New-AzureRmResourceGroup -Name $automationRg -Location $location
    New-AzureRmautomationAccount -Name $automationAccount -ResourceGroupName $automationRg -Location $location

    ## install cchoco module
    Add-cChoco -automationRg $automationRg -automationAccount $automationAccount

    ## import configuration definition
    Import-AzureRmAutomationDscConfiguration -ResourceGroupName $automationRg -automationAccountName $automationAccount -SourcePath $configurationFilePath -Published -Force
    $jobData = Start-AzureRmAutomationDscCompilationJob -ResourceGroupName $automationRg -automationAccountName $automationAccount -ConfigurationName $configurationName
    $compilationJobId = $jobData.Id
    Get-AzureRmAutomationDscCompilationJob -ResourceGroupName $automationRg -automationAccountName $automationAccount -Id $compilationJobId
}