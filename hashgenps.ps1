
$filePath = Read-Host "Enter the path of the file"

if (Test-Path $filePath -PathType Leaf) {

    $hashAlgorithm = Read-Host "Choose hash algorithm (SHA256 or MD5)"


    if ($hashAlgorithm -eq "SHA256" -or $hashAlgorithm -eq "MD5") {
       
        $hashResult = Get-FileHash -Path $filePath -Algorithm $hashAlgorithm

        Write-Host "File: $($hashResult.Path)"
        Write-Host "Algorithm: $($hashResult.Algorithm)"
        Write-Host "Hash: $($hashResult.Hash)"
    }
    else {
        Write-Host "Invalid hash algorithm. Please choose either SHA256 or MD5."
    }
}
else {
    Write-Host "File not found at path: $filePath"
}
