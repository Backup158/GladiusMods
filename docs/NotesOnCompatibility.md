# Reinforcements
For icons, go from 160x160 to 100x100 to put two, top left and bottom right. The two icons won't be exactly in the corners; top left is going to be a bit more left, and bottom right is usually a bit more down. The full icon itself will still be 160x160.

If adding a weapon, it can be scaled to 80x80 and put in the top right.
## Infantry
Using the Guardsman is an example
- Reduce scale (from `1 1 1` to `0.75 0.75 0.75`)
- Double group size
- Change group size deltas (from `memberDeltaX="70" memberDeltaY="50"` to `memberDeltaX="50" memberDeltaY="40"`)
- Change costs and upkeep
    - Guardsman values:
        - Food upkeep (1 --> 6)
        - Food cost (10 --> 60)
        - Ore cost (10 --> 60)
        - Production cost (24 --> 54)
    - These values are the same for Guardsmen, Heavy Weapons Teams, Ratlings, etc. Balancing between these types is done through the traits being different.
    - Since my units usually are "Guardsmen but better" I increase the food/ore costs.
- Add traits
    - Strength in numbers
    - Battalion trait (attacks/hp buff)
    - Bulky --> VeryBulky --> SuperBulky