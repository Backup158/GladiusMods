# Icons
160x160 in general
36x36 for overlay

# Modifying Meshes
Use Blender 4.0 to be able to import and export. The import script only works on 4+ and export is best on 2.9, but 4.0 covers both. What the fuck.
- Import from Gladius: choose one. I use TOFF's script
  - [TOFFster's script](https://discord.com/channels/467032336664494100/478509346326708227/1474500448261243145) linked in the Proxy Studios Discord (Gladius server)
  - [AmorGun's script](https://github.com/amorgun/blender_gladius)
- Export from Blender to Gladius .xml file: `<Gladius game folder>/Resources/Blender/ProxyStudios.zip`

1. Import .msh file from game
2. do whatever edits idk
3. Select mesh only
4. Export as Proxy mesh .xml
5. Put into appropriate mod folder
6. Open it
  - If it has `normal id="xxx" x="0.000000" y="0.000000" z="0.000000"` it's fucked
  - Normal values need to add up to 1
  - Copy the values if there are any. Temporarily, you can just do x="1.0" and make everyone oily
7. Start game to convert the xml into a msh

## Kitbashing or Replacing with Existing Model
Adding an existing mesh onto a new one. For this example, I will replace the Guardsman's Lasgun with a flamer.
1. Import both meshes
  - ex: import `Weapons/AstraMilitarum/GuardsmanLasgun.msh` and `Units/SisterOfBattle/Seraphim.msh`
  - The Seraphim hand flamer is baked into its mesh, so first I split it off
    - click seraphim in object mode
    - go into edit mode and wireframe view (to select the nested vertices in the same spots)
    - select flamer
    - duplicate (shift + d)
    - separate (p)
    - delete its vertex groups
2. Adjust the target mesh to look close to the source mesh
  - rotate it, move it around, etc
  - in this case, i transformed some vertices to make it longer too
  - so it should be overlapping
  - I also wanted to combine the stock onto it
    1. I selected the lasgun in obj mode
    2. went into edit mode to delete everything but the stock
    3. moved stock so it looks nice on the flamer
  - Be sure to adjust the bones too
3. Joined meshes
  1. Click target mesh
  2. click source mesh
  3. right click --> click join
4. Added weights (make sure you're in edit mode)
  1. select all vertices
  2. click the vertex button on the right panel (triangle with dots at corners)
  3. select the base node
  4. set weight to like 0.01
  5. click Assign
5. Export