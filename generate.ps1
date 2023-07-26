# Partially created by BlueStaggo

$output = @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<ResourceList>
    <Name>MinecraftResources</Name>`n
"@

Get-ChildItem -Recurse -Include *.ogg, *.mus -File | ForEach-Object {
    $output += "    <Contents>`n"
    $output += "        <Key>$((Resolve-Path $_ -Relative).Substring(2).Replace("\", "/"))</Key>`n"
    $output += "        <Size>$($_.Length)</Size>`n"
    $output += "    </Contents>`n"
}

$output += "</ResourceList>"

$output | Out-File index.xml