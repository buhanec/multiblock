#
# 		Data pack by IJAMinecraft
#       @ ijaminecraft.com
# 		@ youtube.com/user/IJAMinecraft
#


# make dead players get a death kit 3 times
execute as @a[scores={ija-a004xf=1..}] at @s run function common:deathkit

# give counter entity a tag if a block was mined this tick
execute as @e[tag=ija-a4-block] at @s if block ~ ~ ~ minecraft:fire run tag @s add ija-a4-mined
execute as @e[tag=ija-a4-block] at @s if block ~ ~ ~ minecraft:air run tag @s add ija-a4-mined
execute as @e[tag=ija-a4-block] at @s if block ~ ~ ~ minecraft:water run tag @s add ija-a4-mined

# wait phase before going to next phase
execute as @e[tag=ija-a4-mined] at @s run function common:block/waitinginit
execute as @e[tag=ija-a4-waiting] at @s run function common:block/waiting

# replace air/fire/water with barrier
execute as @e[tag=ija-a4-mined] at @s run fill ~ ~ ~ ~ ~ ~ minecraft:barrier replace minecraft:air
execute as @e[tag=ija-a4-mined] at @s run fill ~ ~ ~ ~ ~ ~ minecraft:barrier replace minecraft:fire
execute as @e[tag=ija-a4-mined] at @s run fill ~ ~ ~ ~ ~ ~ minecraft:barrier replace minecraft:water



# tell players their 'block mining' score
execute as @a[scores={ija-a004xOnline=1,ija-a004xe=1..}] at @s run tellraw @s {"text":"\nYou mined ","color":"yellow","extra":[{"score":{"name":"@s","objective":"ija-a004xe"},"bold":"true","color":"gold"},{"text":" of "},{"score":{"name":"@e[tag=ija-a4-block,limit=1]","objective":"ija-a004xe"}},{"text":" total blocks."}]}

# cap 'blocks mined' counter at 2.000.000.000
scoreboard players set @e[scores={ija-a004xe=2000000001..}] ija-a004xe 2000000000

# increase score if the block is mined
scoreboard players add @e[tag=ija-a4-block] ija-a004xa 0
scoreboard players add @e[tag=ija-a4-mined] ija-a004xa 1

# if a block was mined, give closest player a point
execute as @e[tag=ija-a4-mined] at @s run scoreboard players add @p ija-a004xe 1



# tutorial texts (armor stands)
execute as @e[tag=ija-a4-block,scores={ija-a004xa=..31}] at @s run function common:tutorialtexts
execute as @e[tag=ija-a4-block,scores={ija-a004xa=32..}] at @s run kill @e[tag=ija-a4-tutorial]



# preserve dropped items and teleport them on top of block
execute as @e[tag=ija-a4-block] at @s run execute as @e[type=item,distance=..2] run data merge entity @s {NoAI:true,Invulnerable:true,Age:-32768}
execute as @e[tag=ija-a4-block] at @s run execute as @e[type=item,distance=..2] unless entity @s[tag=ija-a4-tped] run tp @s ~ ~0.7 ~
execute as @e[tag=ija-a4-block] at @s run execute as @e[type=item,distance=..2] unless entity @s[tag=ija-a4-tped] run data merge entity @s {PickupDelay:15,Motion:[0.0,0.0,0.0]}
execute as @e[tag=ija-a4-block] at @s run tag @e[type=item,distance=..2] add ija-a4-tped

# when a new block is mined, the items are always teleported up again
execute as @e[tag=ija-a4-mined] at @s run tp @e[type=item,distance=..2] ~ ~0.7 ~
execute as @e[tag=ija-a4-mined] at @s run execute as @e[type=item,distance=..2] run data merge entity @s {Motion:[0.0,0.0,0.0]}

# save players standing on top from falling down
execute as @e[tag=ija-a4-mined] at @s run execute as @a[dx=0,dy=0,dz=0] at @s run tp @s ~ ~0.3 ~



# run block spawning process if countdown is running or mined tag is set
execute as @e[tag=ija-a4-mined] at @s unless entity @s[tag=ija-a4-waiting] run function common:block/spawner
execute as @e[tag=ija-a4-block,scores={ija-a004xc=1..}] at @s unless entity @s[tag=ija-a4-mined] unless entity @s[tag=ija-a4-waiting] run function common:block/spawner

execute as @e[tag=ija-a4-block] at @s run function common:block/endportal

# when block respawns, give some visuals and audio
execute as @e[tag=ija-a4-block,scores={ija-a004xc=1}] at @s run particle minecraft:cloud ~ ~ ~ 0.45 0.35 0.45 0.01 8 force
execute as @e[tag=ija-a4-block,scores={ija-a004xc=1}] at @s run particle minecraft:poof ~ ~ ~ 0.45 0.35 0.45 0.01 4 force
execute as @e[tag=ija-a4-block,scores={ija-a004xc=1}] at @s run playsound minecraft:block.bamboo_sapling.place master @a[distance=..20] ~ ~ ~ 0.5 1.2 1
execute as @e[tag=ija-a4-block,scores={ija-a004xc=1}] at @s run playsound minecraft:block.wool.break master @a[distance=..20] ~ ~ ~ 0.5 0.1 1

# display special particles if chests are currently spawned
execute as @e[tag=ija-a4-block] at @s if block ~ ~ ~ chest{CustomName:'{"color":"blue","text":"Super Chest"}'} run particle minecraft:sneeze ~ ~ ~ 0.5 0.5 0.5 0.001 3 force
execute as @e[tag=ija-a4-block] at @s if block ~ ~ ~ chest{CustomName:'{"color":"dark_purple","text":"Rare Chest"}'} run particle minecraft:dragon_breath ~ ~ ~ 0 0 0 0.02 10 force
execute as @e[tag=ija-a4-block] at @s if block ~ ~ ~ chest{CustomName:'{"color":"dark_red","text":"Benevolent Gift"}'} run particle minecraft:heart ~ ~ ~ 0.5 0.5 0.5 0.01 1 force

# count down cooldown
scoreboard players add @e[tag=ija-a4-block] ija-a004xc 0
scoreboard players remove @e[tag=ija-a4-block,scores={ija-a004xc=1..}] ija-a004xc 1

tag @e[tag=ija-a4-mined] remove ija-a4-mined
