# common setup
function common:setup

# make players spawn above the one block
spawnpoint @a[scores={ija-a004xLoaded=1},name=HedgeFundBoi] 20 61 20
spawnpoint @a[scores={ija-a004xLoaded=1},name=sopling] -20 61 -20
spawnpoint @a[scores={ija-a004xLoaded=1},name=Finkregh] -20 61 20
spawnpoint @a[scores={ija-a004xLoaded=1},name=BobFerret] 20 61 -20

# make players that first joined appear on the one block
tp @a[scores={ija-a004xLoaded=1},name=HedgeFundBoi] 20.5 61.3 20.5
tp @a[scores={ija-a004xLoaded=1},name=sopling] -19.5 61.3 -19.5
tp @a[scores={ija-a004xLoaded=1},name=Finkregh] -19.5 61.3 20.5
tp @a[scores={ija-a004xLoaded=1},name=BobFerret] 20.5 61.3 -19.5

# at first world load, load in block counter entity
execute as @e[limit=1] positioned 20.5 60.5 20.5 unless entity @e[tag=ija-a4-block,distance=..1] run setblock ~ ~ ~ minecraft:grass_block
execute as @e[limit=1] positioned -19.5 60.5 -19.5 unless entity @e[tag=ija-a4-block,distance=..1] run setblock ~ ~ ~ minecraft:grass_block
execute as @e[limit=1] positioned -19.5 60.5 20.5 unless entity @e[tag=ija-a4-block,distance=..1] run setblock ~ ~ ~ minecraft:grass_block
execute as @e[limit=1] positioned 20.5 60.5 -19.5 unless entity @e[tag=ija-a4-block,distance=..1] run setblock ~ ~ ~ minecraft:grass_block

# kill old infinite block, if user updated the map by exchanging the data pack and the infinite block's position changed
execute as @e[limit=1] positioned 20.5 60.5 20.5 unless entity @e[tag=ija-a4-block,distance=..1] run kill @e[tag=ija-a4-block,distance=..1]
execute as @e[limit=1] positioned -19.5 60.5 -19.5 unless entity @e[tag=ija-a4-block,distance=..1] run kill @e[tag=ija-a4-block,distance=..1]
execute as @e[limit=1] positioned -19.5 60.5 20.5 unless entity @e[tag=ija-a4-block,distance=..1] run kill @e[tag=ija-a4-block,distance=..1]
execute as @e[limit=1] positioned 20.5 60.5 -19.5 unless entity @e[tag=ija-a4-block,distance=..1] run kill @e[tag=ija-a4-block,distance=..1]

# Create entity to track block breaks
execute as @e[limit=1] positioned 20.5 60.5 20.5 unless entity @e[tag=ija-a4-block,distance=..1] run summon minecraft:area_effect_cloud ~ ~ ~ {PersistenceRequired:1b,NoGravity:1b,Duration:2000,Tags:["ija-a4-block"]}
execute as @e[limit=1] positioned -19.5 60.5 -19.5 unless entity @e[tag=ija-a4-block,distance=..1] run summon minecraft:area_effect_cloud ~ ~ ~ {PersistenceRequired:1b,NoGravity:1b,Duration:2000,Tags:["ija-a4-block"]}
execute as @e[limit=1] positioned -19.5 60.5 20.5 unless entity @e[tag=ija-a4-block,distance=..1] run summon minecraft:area_effect_cloud ~ ~ ~ {PersistenceRequired:1b,NoGravity:1b,Duration:2000,Tags:["ija-a4-block"]}
execute as @e[limit=1] positioned 20.5 60.5 -19.5 unless entity @e[tag=ija-a4-block,distance=..1] run summon minecraft:area_effect_cloud ~ ~ ~ {PersistenceRequired:1b,NoGravity:1b,Duration:2000,Tags:["ija-a4-block"]}

# Ensure entity age never causes expiry
execute as @e[tag=ija-a4-block] run data merge entity @s {Duration:2000,Age:0}

# common tick
function common:tick
