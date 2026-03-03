This is the original patch notes from Lord Draconis from December 2023
---

In the beginning I kept a list of fixes, but over time I got tired of writing it all down. The following is partially a list of fixes: 



DELETED:
- Removed all duplicate units in the localization files.
- Removed many duplicate lines in Upgrades.xml but with different references.
- Removed Upgrades\tzeguard\Ratling.xml because the Kardone Changeseekers faction did not have a Ratling unit.
- Removed Valkyrie unit in Aircraft.xml from Gladius Renegade Militia's purchase, as they do not have this unit in the Units folder.
- Removed the Weapons folder, as they have unused weapons there.
- Deleted Vanitine Hedonites' MightMakesRight trait, as it was not in the technology tree.
- Removed Buildings\ChaosGuard\Cult.xml folder since it is not used by the faction.
- Removed unused Traits:
	Traits\ChaosGuard\Corrupted.xml
	Traits\nurgleguard\Corrupted.xml.
	Traits\tzeguard/TeleportationGate.xml
- Removed many references to code that remained as vestiges from other factions.
- A new unfinished faction has been removed.

FIXES:
+ [fix] Kardone Changeseekers faction Valkyrie icon was missing
+ [fix] The icon of Renegade Devil Dog of Hazakh Plaguetakers faction was missing.
+ [fix] Fill the Pain's buff icon was not displayed
+ [fix] Kardone Changeseekers faction did not have a description for Temporal Distortion of 8th tech level. (Upgrades.xml)
+ [fix] The Kardone Changeseekers faction did not have a description for Chaos Rising at tech level 6. (Upgrades.xml)
+ [fix] Chaos Rising did not have an icon.
+ [fix] No description for AircraftFlavor for Airport.
+ [fix] No description for HousingFlavor for Captive Pens.
+ [fix] No description for VehiclesFlavor for Chaos Renegade Armoury.
+ [fix] Fixed description of WebwayRedoubtDescription.
+ [fix] In Infantry.xml AstraMilitarum/Ratling was replaced by traitorguard/Ratling.
+ [fix] The population increase buff (Proselytise) for Gladius Renegade Militia faction did not work.
+ [fix] Fixed description links in Units.xml for Lord of Skulls.
+ [fix] Edited, removed duplicates and added search explanations in the following localization files:
		Actions.xml
		Traits.xml
		Units.xml
		Upgrades.xml
+ [fix] In Heroes.xml for Gladius Renegade Militia ChaosGuard/TechpriestBetrayer has been changed to traitorguard/TechpriestBetrayer.
+ [fix] Added Hydra unit to the Units folder for Gladius Renegade Militia, since it is in the research and purchase tree.
+ [fix] Shielded line webwayGate="ChaosGuard/ImperialStrongpoint in Factions\traitorguard.xml
+ [fix] Added icons for:
		Fear
		MindControl
		ChaosDevotion
		VeteransOfTheLongWar2	
+ [fix] Added broken Blood for the blood god trait for Gladius Renegade Militia.
+ [fix] Fixed icons and removed artifacts from:
		ConvertWildlife
		CultistSacrifice
		FeelNoPain
		Headquarters
		InfernalPower
		MightMakesRight
		MightMakesRight2
		and a few more I didn't write down.
+ [fix] Restored Scavenger2 in Gladius Renegade Militia.
+ [fix] Restored Our Lives for Tzeentch and added an icon.

CHANGES:
+ (change) Replaced pictures for faction: Hazakh Plaguetakers .
+ (change) Added description for Heretech for all factions.
+ (change) Organized and beautifully designed text in the localization files.
+ (change) Shielded unused units in localization file Units.xml.
+ (change) Added description for Chaos Bible for all factions.
+ (change) Added description for GuardsmantzeeFlavor for Benedictian Guardsmen.
+ (change) Added description for OrbitalScanFlavor for Reveal Shroud.
+ (change) Added description for ActivateWebwayGateFlavor for Renegade Imperial Bastion Control.
+ (change) Changed the Found Renegade Guard Fortress name to Reorganization Renegade Guard Fortress.
+ (change) Added description for WebwayRedoubtFlavor for Reorganization Renegade Guard Fortress.
+ (change) Added description for RatlingFlavor for Renegade Ratlings.
+ (change) Added description from ChaosSpaceMarinesCityFlavor for CityFlavor to Features.xml for all factions.
+ (change) Added description in Guardsman2Flavor for Traitor Guardsmen.
+ (change) Added unique icons for ChaosLandRaider, Chimera, DevilDog, Hydra, Leman Russ, Marauder Bomber, Thunderbolt and Valkyrie units. 
+ (change) Added unique faction unit icons for the technology tree.
+ (change) Added normal Cult icon for khorneguard, slaguard and tzeguard.


BUGS:
+ [Bag] Chaos Corruption ability in Gladius Renegade Militia faction does not work as planned. Only one type of infantry is affected by Astramilitarum, while the code says that almost all units of the faction should be affected. 
+ [Bag] VoxCaster of ChaosGuard and nurgleguard is not activated.

Multiple other changes that I'm tired of writing down:
+ Many artifact fixes in pictures
+ Lots of text fixes.
+ Lots of fixes to mechanics not working.