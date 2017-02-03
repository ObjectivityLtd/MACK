Configuration devdsc {
    
    Import-DscResource -Module cChoco

    Node "workstation"  {
        cChocoInstaller installChoco {
          InstallDir = "C:\ProgramData\chocolatey"
        }

      cChocoPackageInstaller install7zip
      {
        Name        = "7zip"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller install7zipinstall
      {
        Name        = "7zip.install"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installadobereader
      {
        Name        = "adobereader"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installadobereaderupdate
      {
        Name        = "adobereader-update"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installautohotkeyportable
      {
        Name        = "autohotkey.portable"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installazcopy
      {
        Name        = "azcopy"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installcalibre
      {
        Name        = "calibre"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installchocolatey
      {
        Name        = "chocolatey"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installchocolateycoreextension
      {
        Name        = "chocolatey-core.extension"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installchocolateyuninstallextension
      {
        Name        = "chocolatey-uninstall.extension"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installChocolateyGUI
      {
        Name        = "ChocolateyGUI"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installcmder
      {
        Name        = "cmder"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installdocker
      {
        Name        = "docker"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installDotNet452
      {
        Name        = "DotNet4.5.2"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installdotnet462
      {
        Name        = "dotnet4.6.2"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installdotnetcore
      {
        Name        = "dotnetcore"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installdotnetcoreruntime
      {
        Name        = "dotnetcore-runtime"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installdotnetcoreruntimeinstall
      {
        Name        = "dotnetcore-runtime.install"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installdotPeek
      {
        Name        = "dotPeek"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installdropbox
      {
        Name        = "dropbox"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installfiddler4
      {
        Name        = "fiddler4"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installFirefox
      {
        Name        = "Firefox"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installgimp
      {
        Name        = "gimp"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installGoogleChrome
      {
        Name        = "GoogleChrome"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installjavadecompilergui
      {
        Name        = "javadecompiler-gui"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installKB2919355
      {
        Name        = "KB2919355"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installKB2919442
      {
        Name        = "KB2919442"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installkeepass
      {
        Name        = "keepass"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installkeepassinstall
      {
        Name        = "keepass.install"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installlinqpad
      {
        Name        = "linqpad"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installlinqpad5
      {
        Name        = "linqpad5"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installlinqpad5install
      {
        Name        = "linqpad5.install"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installmmchocoextension
      {
        Name        = "mm-choco.extension"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installmysqlworkbench
      {
        Name        = "mysql.workbench"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installnetfx462devpack
      {
        Name        = "netfx-4.6.2-devpack"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installnodejsinstall
      {
        Name        = "nodejs.install"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installnotepadplusplus
      {
        Name        = "notepadplusplus"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installnotepadplusplusinstall
      {
        Name        = "notepadplusplus.install"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installPowerBI
      {
        Name        = "PowerBI"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installPowerShell
      {
        Name        = "PowerShell"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installprocexp
      {
        Name        = "procexp"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installputty
      {
        Name        = "putty"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installputtyportable
      {
        Name        = "putty.portable"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installresharperplatform
      {
        Name        = "resharper-platform"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installskype
      {
        Name        = "skype"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installsourcetree
      {
        Name        = "sourcetree"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installsqlservermanagementstudio
      {
        Name        = "sql-server-management-studio"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installssdt15
      {
        Name        = "ssdt15"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installvcredist2010
      {
        Name        = "vcredist2010"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installvcredist2013
      {
        Name        = "vcredist2013"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installvcredist2015
      {
        Name        = "vcredist2015"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installvisualstudiocode
      {
        Name        = "visualstudiocode"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installvlc
      {
        Name        = "vlc"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installXMind
      {
        Name        = "XMind"
        DependsOn   = "[cChocoInstaller]installChoco"
        AutoUpgrade = $True
      }
      cChocoPackageInstaller installPython
      {
        Name = "python3"
        Params = "/InstallDir:'C:\Programs Files\Python'" 
        DependsOn = "[cChocoInstaller]installChoco"
		AutoUpgrade = $true
	  }
    }

    Node "workstation-light"  {
        cChocoInstaller installChoco {
          InstallDir = "C:\ProgramData\chocolatey"
        }

        cChocoPackageInstallerSet installGrestConfiguration
        {
            Ensure = 'Present'
            Name = @(
                "7zip",
                "7zip.install",
                "chocolatey",
                "chocolatey-core.extension",
                "ChocolateyGUI",
                "Firefox",
                "GoogleChrome",
                "notepadplusplus",
                "notepadplusplus.install",
                "PowerShell",
                "skype",
                "SourceTree",
                "visualstudiocode"
		    )
            DependsOn = "[cChocoInstaller]installChoco"
      }
    }
}