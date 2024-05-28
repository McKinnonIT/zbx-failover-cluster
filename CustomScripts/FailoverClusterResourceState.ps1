Param (
    [String] $Id,
    [String] $Type
)

(Get-ClusterResource | Where { $_.Id -eq $Id }).State