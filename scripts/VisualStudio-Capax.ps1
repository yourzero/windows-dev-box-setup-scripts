
$configPath = $PSScriptRoot + '\..\configs\visualstudio-enterprise.vsconfig'

Write-Host "VS Config Path: " + $configPath

#choco install visualstudio2022enterprise

choco install visualstudio2022enterprise --package-parameters="--config $configPath"

#choco install visualstudio2022enterprise --package-parameters="--config '../configs/visualstudio-enterprise.vsconfig'"

#Update-SessionEnvironment #refreshing env due to Git install

# #--- UWP Workload and installing Windows Template Studio ---
# choco install -y visualstudio2017-workload-azure
# choco install -y visualstudio2017-workload-manageddesktop

