$date = Get-Date
$day = $date.Day
$vmName = "your-vm-name"

if ($day -eq 29) {
  $password = [System.Web.Security.Membership]::GeneratePassword(20, 3)
  $securePassword = ConvertTo-SecureString -String $password -AsPlainText -Force

  Write-Output "Updating password for virtual machine $vmName to $password"

  Set-AzVMExtension -ResourceGroupName "your-resource-group-name" `
                    -VMName $vmName `
                    -Name "CustomScriptForLinux" `
                    -Publisher "Microsoft.Azure.Extensions" `
                    -ExtensionType "CustomScript" `
                    -TypeHandlerVersion 2.0 `
                    -SettingString '{"commandToExecute": "echo $newPassword | passwd --stdin azureuser"}' `
                    -ProtectedSettingString '{"newPassword": "' + $password + '"}'
}
else {
  Write-Output "Today is not the 29th day of the month. Skipping password rotation."
}


