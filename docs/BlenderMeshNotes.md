# Modifying Meshes
- Import Script (Gladius --> Blender): choose one. I use amorgun's script.
  - [TOFFster's script](https://discord.com/channels/467032336664494100/478509346326708227/1474500448261243145) linked in the Proxy Studios Discord (Gladius server)
    - Use Blender 4.0 to be able to import and export. The import script only works on 4+ and export is best on 2.9, but 4.0 covers both. What the fuck.
    - Is better with animations iirc, but I had issues where it wouldn't export normals
  - [amorgun's script](https://github.com/amorgun/blender_gladius)
    - v1.2 and v1.3 requires Blender 4.4. Import and export works fine
    - If you using v1.2 for whatever reason, DO NOT DELETE THE DEFAULT BLENDER SETUP! It won't work if you don't have the Collections thing
- Export Script (Blender --> Gladius .xml file):
  - Comes with Gladius
  - Go to `<Gladius game folder>/Resources/Blender/ProxyStudios.zip`

1. Import .msh file from game
  - Note for amorgun's script v1.1: click mesh, shift click armature, parent with auto weights
  - For TOFF's script and amorgun's v1.2 script, you can import the unit's xml right in
2. Do whatever edits
3. Select mesh only (So don't select the armature, but do make sure it's joined)
4. Export as Proxy mesh .xml
5. Put into appropriate mod folder
6. Open it and check for errors
  - Normals
    - If it has `normal id="xxx" x="0.000000" y="0.000000" z="0.000000"` it's fucked
    - Normal values need to add up to 1
    - Copy the values if there are any. Temporarily, you can just do x="1.0" and make everyone oily
  - Too many bone weights
    - There can only be, at most, 4 references per boneWeight
    - If there are more, delete the lowest ones
    - Or go to the Blender file and limit weights
  - Not enough bone weights
    - boneWeight needs at least one
    - If there's an empty one, I usually just copy a nearby value
    - The better fix is to add the weight in the blend file, but sometimes it's too hard
7. Start game to convert the xml into a msh

## Kitbashing or Replacing with Existing Model
Adding an existing mesh onto a new one. For this example, I will replace the Guardsman's Lasgun with a flamer.
1. [TOFF's script] Import both meshes
  - ex: import `Weapons/AstraMilitarum/GuardsmanLasgun.msh` and `Units/SisterOfBattle/Seraphim.msh`
  - The Seraphim hand flamer is baked into its mesh, so first I split it off
    - click seraphim in object mode
    - go into edit mode and wireframe view (to select the nested vertices in the same spots)
    - select flamer
    - duplicate (`Shift + D`)
    - Move somewhere then `Left click` to place it down
    - Separate Selection (`P`)
    - delete its vertex groups
  - [amorgun's script]
    - The import replaces everything in the current collection
      - Import your thing and save
      - In a new project, import the other thing and strip off the things you don't need. Export as gfblt or whatever
      - Open the first thing. CLICK OFF THE MODEL. Import geflugestugheist. 
2. Adjust the target mesh to look close to the source mesh
  - Rotate it, move it around, etc
  - Move it so it overlaps the original mesh the way you want it to
  - In the example, I transformed some vertices to make it longer too
    - I also wanted to combine the stock onto it
      1. I selected the lasgun in obj mode
      2. went into edit mode to delete everything but the stock
      3. moved stock a bit so it looks nice on the flamer
    - Do all this now so it's easy to select all
  - For 3rd party models, this is also a good time to decimate the model, to optimize it for gameplay
3. Remove extraneous data (mainly when importing 3rd party models)
  - Vertex data bones from old one
  - Materials
    1. select object and be in obj mode
    2. click materials in right panel (circle cut in 4)
    3. select the unused texture then click the minus on the right bar
  - UVs
    - See UV maps section below
    - If there are multiple UVs exported, the textures get all muddied in game
4. Join and Add Weights
  - **NOTE**: Weights are *much* easier to do when the things are joined but not actually put together in the correct place
    - So I line them up, then move them forwards on the x axis only, so it's like a foot in front
    - Select the whole item, then assign weight to make sure you don't miss a spot
    - Weight paint manually as needed
    - Move the object back onto the guy
  - Method 1
    1. Joined meshes
      1. Click target mesh
      2. click source mesh
      3. right click --> click join
    2. Added weights (make sure you're in edit mode)
      1. select all vertices
      2. click the vertex button on the right panel (triangle with dots at corners)
      3. select the base node
      4. set weight to like 0.01
      5. click Assign
  - Method 2
    1. Click model
    2. Click Armature
    3. Right Click --> Join with Automatic Weights
  - Be sure to adjust the bones too, such as lining up muzzles
5. Modify UVs
  1. Select only the faces you added
  2. At the top, click UV (or press `U`)
  3. Select "Unpack" (if you selected only the relevant faces) or "Smart UV Project" (when there are gaps that prevent the typical unwrapping from working)
  4. Click the "UV Editor" at the top to open a new panel
  5. Import the diffuses and shit (If you imported the full unit files, they'll already be there)
  5. On that new panel, move the UV faces around to reuse things smartly
6. Export

## Normals Export Funny
When things look fine in material preview, but when you export it's always like `<normal id="0" x="0.000000" y="0.000000" z="0.000000"/>`

This is a bug with Toff's script (noted on 2026-03-07). Use amorgun's script instead. Transferring work seems to be not possible, so i cry.

## Mesh is there but some things are invisible
This is from fucking with the UVs, so the normals end up on the wrong side.
1. Click the affected faces
2. Click "Mesh" on the top bar
3. Click "Normals" --> Click "Flip"
4. Reexport

# General Blender
As I'm new to Blender, I'm keeping general hotkeys here too, for easy reference. For Blender 4.0.

## Weights
### Resetting Weights
1. Select all vertices
2. Shift click all bones
3. Press `Shift + X`
### Testing Weights
1. Select the armature
2. Choose "Pose View" (where there's object/edit mode)
3. Select a bone
4. Wiggle it about
### Adhering to the 4 Limit
1. click "Weights" on top
2. click "Limit Weights"
this is also where you can normalize all

## Delete/Merge Vertices/Edges/Vertices
In edit mode
1. Select the relevant things
2. Press `X`
3. Select the action
  - Delete is on top
  - Dissolve is at the bottom and is like merging

For another merge option
1. Select relevant things
2. Press `M`
3. Press `A` to merge at the center
Best to do this in wireframe mode to merge overlapping vertices more easily (though that may make UV editing harder)

## Select All but Some
1. Select All by pressing `A`
2. Entire Wireframe mode (Hold `Z` then select it) to select overlapping vertices
2. Pull up box select with `B`
3. `Shift + Left Click` select the vertices to deselect

## Decimate
1. Select mesh in Object Mode
2. Click Modifiers (Wrench) in right panel
3. Add modifier --> Generate --> Decimate
4. Set ratio
5. Click dropdown --> Apply, next to the "Decimate" label

## Decimate Selection Only
1. Select vertices in Edit Mode
2. Click "Mesh" on top bar
3. "Clean Up" --> "Decimate Geometry"
4. In the window that pops up, set ratio

## Flip Normals
1. Select face
2. `Alt + N`
3. Click "Flip"

## UV Maps
### Removing existing
This is important for importing 3rd party models, since they usually come in multiple parts, and having multiple UVs colors our guys like soup
1. Select mesh
2. Object data in right panel (triangle with 3 dots)
3. Click UV Maps tab
4. Select map and click minus

## Changing the fuckass startup
1. delete the cube and shit
2. file --> defaults --> save startup file --> overwrite

## Getting back the fuckass startup
1. Go to `~/.config/Blender/4.4/config` or wherever your settings are (I'm on Linux running Blender through Proton)
2. Delete `startup.blend`
3. Next time you start up Blender, it'll use the default
Make sure the config file is for the version the matches the one you'll use

# Blender Hotkeys
- Undo: `Ctrl + Z`
- Redo: `Ctrl + Shift + Z`
- Hide: `H`
- Unhide all: `Alt + H`
- Transformations
  - Move: `G`
  - Rotate: `R`
  - Scale: `S`
  - These can be locked to one axis by pressing X/Y/Z afterwards
  - Or type in numbers (mainly relevant for rotate)
  - Or edit the values in the right bar (Object: the orange square icon)
- Hide workspace UI: `Tab` (I hit this accidentally when alt tabbing frequently)