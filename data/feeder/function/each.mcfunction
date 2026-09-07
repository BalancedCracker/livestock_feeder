# 実行者=marker / 実行位置=ドロッパーの中心

# --- (1) 存在確認 : ドロッパーが消えていたら自分を撤去 ---
execute unless block ~ ~ ~ minecraft:dropper run return run kill @s

# --- (2) 在庫確認 : if items はマッチした「個数」を返す ---
# 結果を stocked タグに畳んでおく。glow ループはこのタグしか見ない。
tag @s remove stocked
execute store result score #wheat feeder.tmp if items block ~ ~ ~ container.* minecraft:wheat
execute if score #wheat feeder.tmp matches ..0 run return 0
tag @s add stocked

# --- (3) 子供の成長促進を優先 : 頭数が増えないので密度ガードは不要 ---
# AgeLocked:1b (金のタンポポ) はプレイヤーの明示的な意思なので除外する
scoreboard players set #fed feeder.tmp 0
execute as @e[distance=..4,nbt=!{Age:0},nbt=!{AgeLocked:1b},type=cow] run function feeder:grow_one
execute if score #fed feeder.tmp matches 1.. run return run function feeder:consume

# --- (4) 密度上限 : これ以上は増やさない ---
execute store result score #cows feeder.tmp if entity @e[distance=..4,type=cow]
execute if score #cows feeder.tmp matches 12.. run return 0

# --- (5) 繁殖 : 小麦 2 個 + 発情可能な成体 2 体 ---
execute if score #wheat feeder.tmp matches ..1 run return 0
execute store result score #ready feeder.tmp if entity @e[distance=..4,nbt={Age:0,InLove:0},type=cow]
execute if score #ready feeder.tmp matches ..1 run return 0

function feeder:breed
function feeder:consume
function feeder:consume
scoreboard players add #breed feeder.stat 1
