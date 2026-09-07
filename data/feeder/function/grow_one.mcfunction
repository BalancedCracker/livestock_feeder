# 実行者=候補の牛。過剰繁殖を避けるため 1 サイクルにつき 1 頭だけ処理する
execute if score #fed feeder.tmp matches 1.. run return 0

# Age : 負=子供 / 0=成体 / 正=繁殖クールダウン中
execute store result score #age feeder.tmp run data get entity @s Age

# 残り 2 分 (2400 ticks) 以下は自然成長に任せる。
# 0.. も同時に弾けるので、成体・クールダウン中のチェックはこの 1 行で足りる。
execute if score #age feeder.tmp matches -2400.. run return 0

# 残り成長時間の 10% を短縮。Age は負値なので「絶対値を減らす」= 加算方向
scoreboard players operation #delta feeder.tmp = #age feeder.tmp
scoreboard players operation #delta feeder.tmp /= #ten feeder.tmp
scoreboard players operation #age feeder.tmp -= #delta feeder.tmp
execute store result entity @s Age int 1 run scoreboard players get #age feeder.tmp

# ★ここは as で呼ばれているだけなので、実行位置は「マーカー」のまま。
#   at @s を付けないと子牛の上ではなく給餌器の上に出る（一度これを踏んだ）。
execute at @s run particle minecraft:happy_villager ~ ~1 ~ 0.3 0.3 0.3 0 6 force
# 給餌器の上にも出す。どの台が働いたかが分かる
particle minecraft:happy_villager ~ ~1 ~ 0.3 0.3 0.3 0 6 force

scoreboard players set #fed feeder.tmp 1
scoreboard players add #grow feeder.stat 1
