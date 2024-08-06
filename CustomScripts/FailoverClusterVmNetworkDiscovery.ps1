function Get-ZbxVMNetworkAdapters {
    # Define the prefix to remove
    $Prefix = "Virtual Machine "

    # Retrieve all virtual machine cluster groups
    $HostVms = Get-VM 

    $Result = @()

    $HostVms | ForEach-Object {
        # Remove the prefix from the VM name
        $global:VmName = $_.Name

        # Retrieve the virtual machine object using the VM name and get all network adapters
        $Vm = $_ | Get-VM
 
        $NetworkAdapters = Get-VMNetworkAdapter -VM $Vm

        # Iterate through each network adapter and gather information
        $NetworkAdapters | ForEach-Object {
            $MacAddressType = if ($_.DynamicMacAddressEnabled) { "Dynamic" } else { "Static" }
            $Result += @{
                '{#VMNAME}'        = $VmName
                '{#NAME}'          = $_.Name
                '{#ID}'            = $_.AdapterId
                '{#TYPE}'          = $MacAddressType
            }
        }
    }

    return $Result
}

$JsonResult = Get-ZbxVMNetworkAdapters | ConvertTo-Json -Compress
$JsonResult
