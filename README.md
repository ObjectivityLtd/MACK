# Chocolatey #

[Chocolatey][9] is a great tool that reduces time required to configure new development machine or a machine of 
a new team member. For simple scenarios just edit chocomachine.config, refine it by removing or adding new 
packages from the gallery and run in PowerShell console:

    Configure.ps1 -mode 'local' 

Chocolatey UI package makes the process more user friendly, however command line acolytes may disagree :) 
Please visit Chocolatey [home page][9] for more information.

![Choco GUI](https://github.com/ObjectivityLtd/MACK/blob/master/images/ChocoGUI.PNG)

# Chocolatey with Azure Automation Server #

This manual will help you to setup Azure Automation Pull Server and onboard your local development machine. 
Process is automated in one PowerShell script, however include manual verification step in [Azure Portal][8].

## Prerequisites ##
Following prerequisites are required:
* Azure subscription; please use your MSDN subscription if there is no subscription provided to you; 
it is safe to connect all machines within the team to Pull Server deployed on your MSDN subscription.
* Windows with WFM 5; Windows 10 contains it out of the box;

## Azure Automation Pull Server Setup and Onboarding machine ##
Please run script, which automates steps described in [Continuous deployment to Virtual Machines using Automation DSC and Chocolatey][1] and [Onboarding machines for management by Azure Automation DSC][2].
There is a risk that this manual and scripts are not longer up to date, so in case of any problems please go to these web sites and update scripts if necessary.
### Setup ###
1. Edit default configuration stored in file devdsc.ps1, or create your own file using following samples:
    * [example 1][1]
    * [example 2][5] 
2. Please run [Configure][7] and override $automationRg, $automationAccount and other parameters if necessary
    * set -mode parameter to 'full' if you would like to provision Azure Automation Account:

            Configure.ps1 -mode 'full'

    * set -mode parameter to 'onboard' or leave empty if you would like only to on board your local machine:
    
            Configure.ps1 -mode 'onboard'

3. Go to [Azure Portal][8] and check whether your machine appeared in node list

![Azure Automation Pull Server Node](https://github.com/ObjectivityLtd/MACK/blob/master/images/AzureAutomationPullServerNode.PNG)

In case of problems in most cases helps:
* disabling IP v6
* changing all your networks to private or domain (of course if it is safe)


[1]: https://azure.microsoft.com/en-us/documentation/articles/automation-dsc-cd-chocolatey/
[2]: https://azure.microsoft.com/en-us/documentation/articles/automation-dsc-onboarding/#physicalvirtual-windows-machines-on-premises-or-in-a-cloud-other-than-azureaws
[3]: https://www.powershellgallery.com/packages/cChoco/2.2.0.79
[4]: https://www.powershellgallery.com/packages/cChoco/2.2.0.79/DeployItemToAzureAutomation?itemType=PSModule
[5]: https://github.com/PowerShellOrg/cChoco/blob/master/ExampleConfig.ps1
[6]: devdsc.ps1
[7]: Configure.ps1
[8]: https://portal.azure.com
[9]: https://chocolatey.org/

