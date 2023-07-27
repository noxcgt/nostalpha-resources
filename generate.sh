#!/bin/bash
output="<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<ResourceList>\n    <Name>MinecraftResources</Name>\n"
counter=0

find . -type f \( -name "*.ogg" -o -name "*.mus" \) | while read -r file; do
    relative_path="${file:2}"
    size=$(stat -c %s "$file")

    output+="    <Contents>\n"
    output+="        <Key>${relative_path//\\/\/}</Key>\n"
    output+="        <Size>${size}</Size>\n"
    output+="    </Contents>\n"

    ((counter++))
done

output+="</ResourceList>"
printf '%b' "$output" > index.xml
echo "The XML file has been generated with ${counter} resources."