Storing the tips and tricks to make certain ideas work.

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