# 統計カウンタを全てゼロに戻す。  /function feeder:reset_stats
#
# チューニングの試行ごとに叩く前提。28 個あるので手打ちでは消せない。
scoreboard players set cycles feeder.stat 0
scoreboard players set visits feeder.stat 0
scoreboard players set empty feeder.stat 0
scoreboard players set cap_all feeder.stat 0
scoreboard players set low_food feeder.stat 0
scoreboard players set no_pair feeder.stat 0
function feeder:table {op:"stat/reset"}
tellraw @s {"text":"Livestock Feeder statistics reset.","color":"green"}
