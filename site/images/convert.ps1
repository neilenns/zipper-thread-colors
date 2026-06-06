$inputFolder  = ".\jtd"
$outputFolder = ".\jtd"
$cwebp        = ".\cwebp.exe"

if (!(Test-Path $outputFolder)) {
    New-Item -ItemType Directory -Path $outputFolder | Out-Null
}

Get-ChildItem $inputFolder -Filter *.jpg | ForEach-Object {
    $out = Join-Path $outputFolder ($_.BaseName + ".webp")
    & $cwebp -q 90 $_.FullName -o $out
    Write-Host "Converted $($_.Name)"
}
