# Icons
160x160 in general
36x36 for overlay

# Modifying Meshes
Use Blender 4.0 to be able to import and export. The import script only works on 4+ and export is best on 2.9, but 4.0 covers both. What the fuck.

1. Import .msh file from game
2. do whatever edits idk
3. Select mesh only
4. Export as Proxy mesh .xml
5. Put into appropriate mod folder
6. Open it
  - If it has `normal id="xxx" x=0.00000 y=0.00000 z=0.00000` it's fucked
  - Normal values need to add up to 1
  - Copy the values if there are any. Temporarily, you can just do x=1.0 and make everyone oily
7. Start game to convert the xml into a msh