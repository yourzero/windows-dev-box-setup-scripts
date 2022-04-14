param(
    [alias("x")]
    [string] 
    $x
    
    )

Write-Host "VS: xx param = $x"

[Console]::ReadKey()

#$configPath = $PSScriptRoot + '\..\configs\visualstudio-enterprise.vsconfig'
#$configPath = $PSScriptRoot + '\visualstudio-enterprise.vsconfig'
$configPath = 'visualstudio-enterprise.vsconfig'

Write-Host "VS: PS current directory: " + $pwd

$dir = Get-ChildItem
Write-Host $dir

Write-Host "VS Config Path: " + $configPath

#choco install visualstudio2022enterprise

choco install visualstudio2022enterprise --package-parameters="--config $configPath"

Write-Host "Visual Studio Installed"

[Console]::ReadKey()

#choco install visualstudio2022enterprise --package-parameters="--config '../configs/visualstudio-enterprise.vsconfig'"

#Update-SessionEnvironment #refreshing env due to Git install

# #--- UWP Workload and installing Windows Template Studio ---
# choco install -y visualstudio2017-workload-azure
# choco install -y visualstudio2017-workload-manageddesktop

