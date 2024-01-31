# Hash-Generator-PS

## Description
Project consists of a simple script written in PowerShell to generate hash values(SHA256,MD5) for any given file.

## Script Breakdown

First, we must get the file path from the user
``` powershell
$filePath = Read-Host "Enter the path of the file"
```

Then, we have to check if the file exists
``` powershell
if (Test-Path $filePath -PathType Leaf) {
```

In this script, the user has the option to choose between SHA256 or MD5 hash values
``` powershell
$hashAlgorithm = Read-Host "Choose hash algorithm (SHA256 or MD5)"
```

The script then checks if the selected algorothim is valid and then generates the hash value for the file
``` powershell
 if ($hashAlgorithm -eq "SHA256" -or $hashAlgorithm -eq "MD5") {
$hashResult = Get-FileHash -Path $filePath -Algorithm $hashAlgorithm
```

The script then displays the hash value
``` powershell
Write-Host "File: $($hashResult.Path)"
Write-Host "Algorithm: $($hashResult.Algorithm)"
Write-Host "Hash: $($hashResult.Hash)"
```

If the user selects the wrong hash algorithim
``` powershell
else {
        Write-Host "Invalid hash algorithm. Please choose either SHA256 or MD5."
    }
```

If the file path is not found
``` powershell
else {
    Write-Host "File not found at path: $filePath"
}
```
