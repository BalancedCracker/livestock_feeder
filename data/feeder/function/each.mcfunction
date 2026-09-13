# 実行者=marker / 実行位置=ドロッパーの中心

# --- (1) 存在確認 : ドロッパーが消えていたら自分を撤去 ---
execute unless block ~ ~ ~ minecraft:dropper run return run kill @s

# --- (2) 巡回回数 : 統計の分母 ---
# ★cycles ではなくこちらを分母に使うこと。
#   cycles は台数にも在庫にも無関係に増えるうえ、未ロードチャンクの給餌器は
#   そもそも巡回されない。「実際に処理される機会が何回あったか」は visits。
scoreboard players add visits feeder.stat 1

# --- (3) 在庫確認 : 餌が 1 種類でも入っているか ---
# 結果を stocked タグに畳んでおく。glow ループはこのタグしか見ない。
tag @s remove stocked
execute store result score #any feeder.tmp if items block ~ ~ ~ container.* #feeder:all_food
execute if score #any feeder.tmp matches ..0 run return run scoreboard players add empty feeder.stat 1
tag @s add stocked

# --- (4) 全体頭数を数えておく ---
# 種別上限だけだと 6 種 x cap まで許してしまい、食肉工場になる。
# ここで 1 回だけ数え、各 species が繁殖の直前に参照する。
# ★同一サイクル内で増えた分は反映されない（次サイクルで補正される）
execute store result score #total feeder.tmp if entity @e[type=#feeder:livestock,distance=..4]

# --- (5) 種ごとの処理 ---
function feeder:table {op:"species"}
