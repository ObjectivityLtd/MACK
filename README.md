# Cooking local development machine with Chocolatey #

[Chocolatey][9] is a great tool that reduces time required to configure new development machine or a machine of 
a new team member. For simple scenarios just edit dev.config in config folder, refine it by removing or adding new 
packages from the gallery and run in PowerShell console **run as Administrator**:

        Configure.ps1 

Alternatively you can clone dev.config, customise it, commit into your team repository and use as parameter, e.g.

        Configure.ps1 -LocalConfigurationFilePath <drive:>\<teamrepository>\dev.config

However in that case please remember to copy visual studio administration installation file (vs2015.xml) and change the parameter path in your .config file as well
        
        <package id="visualstudio2015enterprise" version="2015.03.02" packageParameters="--AdminFile ./config/vs2015.xml" />

Before running a Configure.ps1 it may be required to set policy execution first:

        Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted 

**Chocolatey UI** package makes the process more user friendly, although command line acolytes may disagree :) 
Please visit Chocolatey [home page][9] for more information.

![Choco GUI](https://github.com/ObjectivityLtd/MACK/blob/master/images/ChocoGUI.PNG)

# Using Chocolatey with Azure Automation Server for centralised management in big teams #

For bigger teams it's worth considering a centralise management of their machines. 
This manual will help you to setup Azure Automation Pull Server and onboard development machine onto it.
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

    * set -mode parameter to 'onboard' or leave empty if you would like only to on board machine:
    
            Configure.ps1 -mode 'onboard'

3. Go to [Azure Portal][8] and check whether onboarded machine appeared in node list

![Azure Automation Pull Server Node](https://github.com/ObjectivityLtd/MACK/blob/master/images/AzureAutomationPullServerNode.PNG)

4. To onboard all team members, run Configure.ps1 -mode 'onboard' on their desktops with the same credentials 
and parameters used to create AAP. More elegant is to create a service principal account, instead of providing credentials on each installation.
This version supports only such simplified approach, however feel free to modify script accordingly.

### Important notes ###
In case of problems in most cases helps:
* disabling IP v6
* changing all your networks to private or domain; In fact script **Add-Workstation.ps1** already contains such operation:

        Get-NetConnectionProfile -NetworkCategory Public | Set-NetConnectionProfile -NetworkCategory Private

Please onboard your machine if you know all of your active networks are really trusted... and no, airport or restaurant networks don't qualify to be a such thing.

[1]: https://azure.microsoft.com/en-us/documentation/articles/automation-dsc-cd-chocolatey/
[2]: https://azure.microsoft.com/en-us/documentation/articles/automation-dsc-onboarding/#physicalvirtual-windows-machines-on-premises-or-in-a-cloud-other-than-azureaws
[3]: https://www.powershellgallery.com/packages/cChoco/2.2.0.79
[4]: https://www.powershellgallery.com/packages/cChoco/2.2.0.79/DeployItemToAzureAutomation?itemType=PSModule
[5]: https://github.com/PowerShellOrg/cChoco/blob/master/ExampleConfig.ps1
[6]: devdsc.ps1
[7]: Configure.ps1
[8]: https://portal.azure.com
[9]: https://chocolatey.org/

