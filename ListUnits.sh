#!/bin/bash

created_units_here='./*/Data/World/Units/*/*.xml'
each_mod_units_path='./*/Data/World/Units/'
unit_path_middle='Data/World/Units/'
wildcard_xml_suffix='/*.xml$'
all_factions="$(find ./*/Data/World/Units/* -type d -exec basename {}  \; | sort | uniq)"
templates_folder='./Backup Units + Inventory for All Units - Templates/'
destination_1='./Backup Units + Inventory for All Units (1)/'

#echo $all_factions

# */ checks only for folders
for mod in */ ; do
  # Excluding symlinks
  [ -L "${d%/}" ] && continue
  # Check each mod for units in factions
  for faction in ${all_factions}; do
    path=${mod}${unit_path_middle}${faction}
    #echo ${path}
    # If path exists
    if [ -e "${path}" ]; then
      #find ${path} ${wildcard_xml_suffix}
      #echo 'Path exists: '${path}
      # Checks each file within path
      for file in ./"${path}"/*; do
        #echo '  Checking file: '${file}
        # Checks if that file is an XML file
        if [[ "$file" == *.xml ]]; then
          echo '  -o- XML found: '${file}
        fi
      done
    fi
  done
done