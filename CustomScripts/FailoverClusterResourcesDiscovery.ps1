function Get-ZbxClusterResources {
    $resources = Get-ClusterResource | Select-Object Name, Id, ResourceType

    $result = @()

    $resources | ForEach-Object {
        $result += @{
            '{#NAME}' = $_.Name
            '{#ID}' = $_.Id
            '{#TYPE}' = $_.ResourceType.toString()
        }
    }

    return $result
}


$jsonResult = Get-ZbxClusterResources | ConvertTo-Json -Compress
$jsonResult
