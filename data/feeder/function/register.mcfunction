# 手動登録（フォールバック）。ドロッパーの上に立って実行する。
# 名前による自動登録が効かないときの逃げ道として残してある。
#
# ★名前の検査を入れてあるので、素のドロッパーや金床で名付けたものは登録できない。
#   ここを緩くすると「クラフトでのみ入手」という前提が崩れる。
#
# ★メッセージは英語リテラル。
#   意味の一致する翻訳キーがバニラに存在しないため、無理に translate を
#   使うとどの言語でも意味の通らない文章になる。
execute unless block ~ ~-1 ~ minecraft:dropper run return run tellraw @s {"text":"Stand on top of a Livestock Feeder and run this again.","color":"red"}
execute unless data block ~ ~-1 ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run tellraw @s {"text":"That dropper is not a crafted Livestock Feeder.","color":"red"}
execute positioned ~ ~-1 ~ align xyz positioned ~0.5 ~0.5 ~0.5 if entity @e[tag=feeder,distance=..0.1,type=marker] run return run tellraw @s {"text":"This Livestock Feeder is already registered.","color":"yellow"}
execute positioned ~ ~-1 ~ align xyz positioned ~0.5 ~0.5 ~0.5 run summon minecraft:marker ~ ~ ~ {Tags:["feeder"]}
tellraw @s {"text":"Livestock Feeder registered.","color":"green"}
