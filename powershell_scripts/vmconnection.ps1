############################## Automation for connectinv to vm ##############################

# Replace <resource_group_name> with the name of your resource group
$resourceGroupName = "<resource_group_name>"

# Replace <vm_name> with the name of your virtual machine
$vmName = "<vm_name>"

# Get the virtual machine
$vm = Get-AzVM -ResourceGroupName $resourceGroupName -Name $vmName

# Get the virtual machine's IP address
$ipAddress = $vm.NetworkProfile.PublicIpAddresses[0].IpAddress

# Connect to the virtual machine using RDP
mstsc /v:$ipAddress
