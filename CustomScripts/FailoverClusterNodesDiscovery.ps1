function Get-ZbxClusterNodes {
    $nodes = Get-ClusterNode | Select-Object Name, NodeInstanceID
    
    $result = @()

    $nodes | ForEach-Object {
        $result += @{
            '{#NAME}' = $_.Name
            '{#ID}' = $_.NodeInstanceId
        }
    }
    return $result
}


$jsonResult = Get-ZbxClusterNodes | ConvertTo-Json -Compress
$jsonResult
