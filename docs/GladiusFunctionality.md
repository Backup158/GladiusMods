Storing the code snippets to make certain ideas work.

# Multiple Tech Requirements to Build
Unlocked by the main one, then the one in the condition is also required to actually build it.

- It'll show up in the build menu when you have the main one researched
- AI might ignore the condition?

Normal:
```xml
        <produceUnit unit="AstraMilitarum/FortressOfArrogance" requiredUpgrade="AstraMilitarum/Baneblade"/>
```

Multiple requirements:
```xml
        <produceUnit unit="AstraMilitarum/FortressOfArrogance" requiredUpgrade="AstraMilitarum/Baneblade">
			<conditions>
				<player>
					<upgrade name="AstraMilitarum/Chimera"/>
				</player>
			</conditions>
		</produceUnit>
```
So it'll show up when you have Baneblade, but you can't actually build unless you have Chimera too.

Thanks to Malaikat for figuring this out

# Checking for Allied Commissars
When Astra Militarum units want to check for Commissars.

## Simple Solution
Literally check for Commissar
```xml
        <modifier>
			<conditions>
                <unit>
                    <unitsInRange count="1" range="2">
						<allied/>
						<type name="AstraMilitarum/LordCommissar"/>
                    </unitsInRange>
                </unit>
            </conditions>
			<effects>
				...
			</effects>
		</modifier>
```
This checks for >1 Lord Commissar within 2 tiles. However, this does not account for modded units. Heroes of Legend adds a few commissars, and my own mods have some too.

Adding checks for each one is tedious and unsustainable. 

## Broader Solution
Check for units with traits that are associated with Commissars
```xml
        <modifier>
            <!-- If Commissar is nearby, get fucking shot -->
            <conditions>
                <unit match="Any">
                    <unitsInRange count="1" range="2">
                        <allied/>
                        <faction name="AstraMilitarum"/>
                        <trait name="Hero"/>
                        <trait name="Stubborn"/> <!-- Every commissar should have this trait -->
                    </unitsInRange>
                </unit>
            </conditions>
            <effects>
                <hitpoints add="-12"/>
                <morale add="-60"/>
            </effects>
        </modifier>
```
The Lord Commissar is the only Guard hero with Stubborn, and modded commissars typically copy that over. There'll likely be some false positives, but I don't care.

# Checking for Enemy Orks
Checking to see if your enemy is an Ork.

## Simple Solution
Literally check the faction
```xml
        <modifier>
			<conditions>
				<encounter>
					<opponent>
						<faction name="Orks"/>
					</opponent>
				</encounter>
			</conditions>
			<effects>
				<accuracy mul="0.17"/>
			</effects>
		</modifier>
```
Works great, until you run into a modded Ork faction (the only one atm is Malaikat's Dreadheadz). Adding a check for that will cause a crash if user doesn't have that installed. I could make a patch file for each new faction, but... no...

## Broader Solution
Check for Ork healing trait. All Ork units will use this.
```xml
        <modifier>
			<conditions>
				<encounter>
					<opponent>
						<trait name="Orks/GreenTideHealing"/>
					</opponent>
				</encounter>
			</conditions>
			<effects>
				<accuracy mul="0.17"/>
			</effects>
		</modifier>
```
Could probably make it a match any then add the other Ork green tide traits to be more robust.

# Replicating Bolter Discipline
```xml
        <modifier>
			<conditions>
				<unit>
					<notMovedThisTurn/>
				</unit>
				<weapon>
					<trait name="RapidFire"/>
				</weapon>
				<encounterRange greater="1"/>
			</conditions>
			<effects>
				<rangedAttacks mul="1"/>
			</effects>
		</modifier>
```

# Checking Cargo Slots Filled
```xml
        <modifier>
			<conditions>
				<unit>
					<cargoSlotsTaken greater="1"/>
				</unit>
			</conditions>
			<effects>
				<attacks mul="0.1"/>
				<meleeDamageReduction add="0.17"/>
			</effects>
		</modifier>
		<modifier>
			<conditions>
				<unit>
					<cargoSlotsTaken greater="2"/>
				</unit>
			</conditions>
			<effects>
				<!-- <rangedAccuracy mul="0.17"/> -->
				<actionPointsMax add="1"/>
				<meleeDamageReduction add="0.17"/>
			</effects>
		</modifier>
```

# Replicating Ordnance Trait
0 Accuracy after moving
```xml
        <modifier>
			<conditions>
				<unit>
					<movedThisTurn/>
					<noTrait name="Flyer"/>
					<noTrait name="Fortification"/>
					<noTrait name="Relentless"/>
					<noTrait name="SlowAndPurposeful"/>
					<noTrait name="Vehicle"/>
				</unit>
			</conditions>
			<effects>
				<rangedAccuracy min="-999" max="-999"/>
			</effects>
		</modifier>
```

# Changing Movement Cost from Attacking
```xml
        <!-- Limited movement after shooting if near allied cities -->
		<modifier>
			<conditions>
                <unit>
                    <unitsInRange count="1" range="3">
						<allied/>
						<trait name="Headquarters"/>
                    </unitsInRange>
				</unit>
            </conditions>
			<effects>
				<consumedMovement max="2"/>
			</effects>
		</modifier>
```
In this example, it only takes 2 movement points to shoot, so an infantry with 3 move can move 1 tile after shooting, if it didn't move that turn.

# Making checks for trait ranks
Does NOT work:
```xml
	<unit>
		<trait name="AstraMilitarum/uwu_SemtexianBombardiers_BigBertha_Range" rank="0"/>
	</unit>
```

The other idea is to make each rank a unique trait. I don't know how to make that work with the regular thing?

# Making Actions Visible Based on Condition
Add `useConditionsForVisiblity="1"` to the base info with the name and such. Note the typo.