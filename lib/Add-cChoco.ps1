function Add-cChoco {
    [CmdletBinding()]
    [OutputType([void])]
    param (
        [Parameter(Mandatory=$true)]
        [string]
        $automationRg,

        [Parameter(Mandatory=$true)]
        [string]
        $automationAccount
    )
    
    $module = New-AzureRmAutomationModule -Name "cChoco" -ResourceGroupName $automationRg -AutomationAccountName $automationAccount -ContentLink "https://www.powershellgallery.com/api/v2/package/cChoco"

    while ( ($module | Get-AzureRmAutomationModule).ProvisioningState -ne "Succeeded" ) {
        "Waiting for {0} to be provisioned ..." -f $module.Name
        Start-Sleep -Seconds 5
    }
}
