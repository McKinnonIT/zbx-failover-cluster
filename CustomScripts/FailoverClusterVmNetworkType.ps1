Param (
    [String] $VMName,
    [String] $Id
)

$VmNetworkAdapater = Get-ClusterResource `
    | Where-Object { $_.ResourceType -eq "Virtual Machine" } `
    | Where-Object { $_.Name -like "*$VMName" } `
    | Get-VM `
    | Get-VMNetworkAdapter `
    | Where-Object { $_.AdapterId -eq $Id }

if ($VmNetworkAdapater.DynamicMacAddressEnabled) { "Dynamic" } else { "Static" }