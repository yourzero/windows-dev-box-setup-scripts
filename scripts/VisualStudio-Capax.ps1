param(
    [string] 
    $scriptBaseUrl
    )

Write-Host "VS: scriptBaseUrl = $scriptBaseUrl"


#$configFileName = $PSScriptRoot + '\..\configs\visualstudio-enterprise.vsconfig'
#$configFileName = $PSScriptRoot + '\visualstudio-enterprise.vsconfig'
$configFileName = 'visualstudio-enterprise.vsconfig'



$configFileUrl = "$scriptBaseUrl/$configFileName"
$configFileDestination = "$Env:TEMP\$configFileName"
(New-Object System.Net.WebClient).DownloadFile($configFileUrl,$configFileDestination)
Write-Host "VS: Downloaded VS config file to: $configFileDestination"


#(New-Object System.Net.WebClient).DownloadFile("https://typora.io/windows/typora-setup-x64.exe","$Env:TEMP\typora-setup-x64.exe");cmd /c '%TEMP%\typora-setup-x64.exe /SILENT'
# Include this if you want Xamarin installed  --add Microsoft.VisualStudio.Workload.NetCrossPlat;includeOptional
#(New-Object System.Net.WebClient).DownloadFile("https://aka.ms/vs/15/release/vs_enterprise.exe","$Env:TEMP\vs_enterprise.exe");cmd /c  'start /wait %TEMP%\vs_enterprise.exe --wait --passive --add Microsoft.VisualStudio.Workload.Azure --add Microsoft.VisualStudio.Workload.Data;includeOptional --add Microsoft.VisualStudio.Workload.NetCoreTools --add Microsoft.VisualStudio.Workload.NetWeb;includeOptional --add Microsoft.VisualStudio.Workload.Node --includeRecommended'
 

choco install visualstudio2022enterprise --package-parameters="--config $configFileDestination"

Write-Host "Visual Studio Installed"

Update-SessionEnvironment #refreshing env due to Git install

# #--- UWP Workload and installing Windows Template Studio ---
# choco install -y visualstudio2017-workload-azure
# choco install -y visualstudio2017-workload-manageddesktop

