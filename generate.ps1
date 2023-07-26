# Partially created by BlueStaggo

$output = @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<ResourceList>
    <Name>MinecraftResources</Name>`n
"@
$counter = 0

Get-ChildItem -Recurse -Include *.ogg, *.mus -File | ForEach-Object {
    $output += "    <Contents>`n"
    $output += "        <Key>$((Resolve-Path $_ -Relative).Substring(2).Replace("\", "/"))</Key>`n"
    $output += "        <Size>$($_.Length)</Size>`n"
    $output += "    </Contents>`n"
    $counter += 1
}

$output += "</ResourceList>"
$output | Out-File index.xml
Write-Output "The XML file has been generated with $($counter) resources."