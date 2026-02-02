#!/bin/bash

created_units_here='./*/Data/World/Units/*/*.xml'
each_mod_units_path='./*/Data/World/Units/'
wildcard_xml_suffix='/*.xml$'
all_factions="$(find ./*/Data/World/Units/* -type d -exec basename {}  \; | sort | uniq)"
templates_folder='./Backup Units + Inventory for All Units - Templates/'
destination_suffx='Data/World/Units/'
destination_1='./Backup Units + Inventory for All Units (1)/'

#echo $all_factions

for faction in ${all_factions}; do
  path=${each_mod_units_path}${faction}
  #for file in $path; do
  find ${path} ${wildcard_xml_suffix}
  #done
done