#
# 		Data pack by IJAMinecraft
# 		@ ijaminecraft.com
# 		@ youtube.com/user/IJAMinecraft
#

# show help menu in chat
tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
tellraw @s {"text":" Help Menu","color":"gold"}

tellraw @s {"text":" Click on the buttons for more info:\n","color":"yellow"}

function common:help/phasesmenu

tellraw @s {"text":"   ","extra":[{"text":"[Chests]","color":"green","clickEvent":{"action":"run_command","value":"/trigger ija-a4 set 2"},"hoverEvent":{"action":"show_text","value":"Click for info\nabout chests!"}}]}

# end help menu
tellraw @s {"text":" "}
