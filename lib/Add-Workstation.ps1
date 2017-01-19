function Add-Workstation {
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
        $configurationName,

        [Parameter(Mandatory=$true)]
        [string]
        $configurationNodeName
    )

   . "$PSScriptRoot/DscMetaConfigs.ps1"
   
    $workstationName = $env:computername
    $configurationDscMetaConfig = "$PSScriptRoot\..\DscMetaConfigs"
    
    # Machine onboarding
    ## TODO PLEASE check carefully whether you can really run convert all your public networks to private
    Get-NetConnectionProfile -NetworkCategory Public | Set-NetConnectionProfile -NetworkCategory Private
    ## configure winrm to allow remote management
    winrm quickconfig

    $automationAccountInstance = Get-AzureRmAutomationAccount -Name $automationAccount -ResourceGroupName $automationRg
    $registrationInfo = $automationAccountInstance | Get-AzureRmAutomationRegistrationInfo

    # Create the metaconfigurations
    ## edit the below as needed for your use case
    $Params = @{
         RegistrationUrl = $registrationInfo.Endpoint;
         RegistrationKey = $registrationInfo.PrimaryKey;
         ComputerName = @($workstationName);
         NodeConfigurationName = "$configurationName.$configurationNodeName";
         RefreshFrequencyMins = 30;
         ConfigurationModeFrequencyMins = 15;
         RebootNodeIfNeeded = $False;
         AllowModuleOverwrite = $False;
         ConfigurationMode = 'ApplyAndMonitor';
         ActionAfterReboot = 'ContinueConfiguration';
         ReportOnly = $False;  # Set to $True to have machines only report to AA DSC but not pull from it
    }

    ## Use PowerShell splatting to pass parameters to the DSC configuration being invoked
    ## For more info about splatting, run: Get-Help -Name about_Splatting
    DscMetaConfigs @Params

    Set-DscLocalConfigurationManager -Path $configurationDscMetaConfig
}
