# 手動登録（フォールバック）。ドロッパーの上に立って実行する。
# 名前による自動登録が効かないときの逃げ道として残してある。
execute unless block ~ ~-1 ~ minecraft:dropper run return run tellraw @s {"text":"ドロッパーの上に立って実行してください","color":"red"}
execute positioned ~ ~-1 ~ align xyz positioned ~0.5 ~0.5 ~0.5 if entity @e[tag=feeder,distance=..0.1,type=marker] run return run tellraw @s {"text":"すでに登録済みです","color":"yellow"}
execute positioned ~ ~-1 ~ align xyz positioned ~0.5 ~0.5 ~0.5 run summon minecraft:marker ~ ~ ~ {Tags:["feeder"]}
tellraw @s {"text":"給餌器として登録しました","color":"green"}
