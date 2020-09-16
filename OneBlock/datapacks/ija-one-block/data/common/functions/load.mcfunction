#
#       ███ ████ ████ █   █ ███ █   █ ████  ██  ███  ████ ████ █████
#        █     █ █  █ ██ ██  █  ██  █ █    █  █ █  █ █  █ █      █
#        █     █ ████ █ █ █  █  █ █ █ ████ █    ███  ████ ████   █
#        █  █  █ █  █ █   █  █  █  ██ █    █  █ █  █ █  █ █      █
#       ███  ██  █  █ █   █ ███ █   █ ████  ██  █  █ █  █ █      █
#
# 		This data pack was made by IJAMinecraft @ ijaminecraft.com
# 		You can visit me here: youtube.com/user/IJAMinecraft
# 		========================================================
#

gamerule sendCommandFeedback false
gamerule commandBlockOutput false
gamerule logAdminCommands false

# special blocks mined counter
scoreboard objectives add ija-a004xa dummy {"text":"progress"}
# for random number generation
scoreboard objectives add ija-a004xb dummy {"text":"random"}
# countdown after every block break
scoreboard objectives add ija-a004xc dummy {"text":"countdown"}
# for random number generation for afterphases.mcfunction
scoreboard objectives add ija-a004xd dummy {"text":"mob random"}

# 'block mining' counter for each player and the entity
scoreboard objectives add ija-a004xe dummy {"text":"blocks"}
scoreboard objectives setdisplay list ija-a004xe
scoreboard objectives setdisplay belowName ija-a004xe

# counters for deaths
# resets to 0 again on death
scoreboard objectives add ija-a004xf deathCount {"text":"just died"}
# counts up total deaths
scoreboard objectives add ija-a004xg deathCount {"text":"deaths"}

# counter for wait period
scoreboard objectives add ija-a004xh dummy {"text":"wait"}

# counter for end portal particles
scoreboard objectives add ija-a004xi dummy {"text":"end portal particles wait"}

# add trigger object that can be controlled by players
scoreboard objectives add ija-a4 trigger

# add scoreboard objective to test for newly joined player
scoreboard objectives remove ija-a004xOnline
scoreboard objectives add ija-a004xOnline dummy

# add scoreboard objective to test for first load of this function
scoreboard objectives add ija-a004xLoaded dummy
