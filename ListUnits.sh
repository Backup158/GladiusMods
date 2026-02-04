#!/bin/bash

# ######################
# VARIABLES
# ######################
created_units_here='./*/Data/World/Units/*/*.xml'
each_mod_units_path='./*/Data/World/Units/'
unit_path_middle='Data/World/Units/'
wildcard_xml_suffix='/*.xml$'
all_factions="$(find ./*/Data/World/Units/* -type d -exec basename {}  \; | sort | uniq)"
# XML Content matching
comment_start='<!--'
exclude_comments='[^('${comment_start}'( )*)]'
has_item_slots='<itemSlots base='
has_cargo_slots='<cargoSlots base='
# Templates to copy
templates_folder='./Backup Units + Inventory for All Units - Templates/'
slot_amounts=("1" "3" "6")
destination_a='./DexGattaca Units and Factions + Inventory for All Units ('
destination_b=')/'

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
          # Gets the file name by itself 
          file_base_name="$(basename "${file}")"
          echo '      '${file_base_name}

          # If the file already contains item slots, do not add more
          # If the file already contains cargo slots, do not add item slots to avoid the UI bug
          #     grep -w: match whole word
          #     stores result of grep in greprc
          #         0: found
          #         1: not found
          #         2: error
          grep -E -w "${exclude_comments}${has_item_slots}" "${file}" ; greprc=$?
          grep -E -w "${exclude_comments}${has_cargo_slots}" "${file}" ; greprc2=$?
          # If unit does not have item slots
          if [[ $greprc -eq 1 && $greprc2 -eq 1 ]]; then
            final_destination_ending=${destination_b}${unit_path_middle}${faction}'/'${file_base_name}'.ext'

            # Is the unit a battalion?
            if [[ "$file_base_name" == Battalion* ]]; then
              #echo 'battalion'
              template_path_start=${templates_folder}${unit_path_middle}'Battalion_'
            else
              #echo 'normal'
              template_path_start=${templates_folder}${unit_path_middle}'Normal_'
            fi
            #echo ${template_path_start}

            # Copy over templates
            # for each slot amount
            for amount in ${slot_amounts[@]}; do
                #echo '____________ amount: '${amount}
                final_template=${template_path_start}${amount}'.xml.ext'
                final_destination=${destination_a}${amount}${final_destination_ending}
                #echo ${final_template}
                #echo ${final_destination}

                cp "${final_template}" "${final_destination}"
            done
          else
            echo ' >>> HERO SKIPPED'
          fi
        fi
      done
    fi
  done
done