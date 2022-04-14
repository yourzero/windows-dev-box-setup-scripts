# Description: Boxstarter Script
# Author: Microsoft
# Common dev settings for desktop app development


# Run: http://boxstarter.org/package/url?https://raw.githubusercontent.com/yourzero/windows-dev-box-setup-scripts/master/dev_capax_base-azure.ps1

Disable-UAC

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
write-host "helper script base URI is $helperUri"

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
    [Console]::ReadKey()

	iex ((new-object net.webclient).DownloadString("$helperUri/$script")) -x $helperUri
}


## TODO - temporarily removing the other scripts so we can test VS


#--- Setting up Windows ---
# executeScript "SystemConfiguration.ps1";
# executeScript "FileExplorerSettings.ps1";
# executeScript "RemoveDefaultApps.ps1";
# executeScript "CommonDevTools.ps1";
# executeScript "Browsers.ps1";

# executeScript "Capax.ps1";


Write-Host "Main: PS current directory: " + $pwd


executeScript "VisualStudio-Capax.ps1";


#--- Tools ---
#--- Installing VS and VS Code with Git
# See this for install args: https://chocolatey.org/packages/VisualStudio2017Community
# https://docs.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-community
# https://docs.microsoft.com/en-us/visualstudio/install/use-command-line-parameters-to-install-visual-studio#list-of-workload-ids-and-component-ids
# visualstudio2017community
# visualstudio2017professional
# visualstudio2017enterprise

# choco install visualstudio2022enterprise

# choco install -y visualstudio2017community --package-parameters="'--add Microsoft.VisualStudio.Component.Git'"
# Update-SessionEnvironment #refreshing env due to Git install

# #--- UWP Workload and installing Windows Template Studio ---
# choco install -y visualstudio2017-workload-azure
# choco install -y visualstudio2017-workload-manageddesktop

#--- reenabling critial items ---
#Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula


# Disable Windows Update
$WindowsUpdatePath = "HKLM:SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\"
$AutoUpdatePath = "HKLM:SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"

If(Test-Path -Path $WindowsUpdatePath) {
    Remove-Item -Path $WindowsUpdatePath -Recurse
}

New-Item -Path $WindowsUpdatePath
New-Item -Path $AutoUpdatePath
Set-ItemProperty -Path $AutoUpdatePath -Name NoAutoUpdate -Value 1
