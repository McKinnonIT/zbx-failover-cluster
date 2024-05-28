Param (
    [String] $NodeId
)

(Get-ClusterNode | Where-Object { $_.NodeInstanceID -eq $NodeId }).State
