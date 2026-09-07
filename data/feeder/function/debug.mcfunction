# 状態を一括で吐く。/function feeder:debug
say --- feeder debug ---
execute store result score #n feeder.tmp if entity @e[distance=0..,tag=feeder,type=marker]
execute store result score #s feeder.tmp if entity @e[distance=0..,tag=feeder,tag=stocked,type=marker]
tellraw @s [{"text":"マーカー数: "},{"score":{"name":"#n","objective":"feeder.tmp"}},{"text":" (在庫あり: "},{"score":{"name":"#s","objective":"feeder.tmp"}},{"text":")"}]
tellraw @s [{"text":"cycles: "},{"score":{"name":"#cycles","objective":"feeder.stat"}},{"text":" / grow: "},{"score":{"name":"#grow","objective":"feeder.stat"}},{"text":" / breed: "},{"score":{"name":"#breed","objective":"feeder.stat"}}]

# 目視用。デバッグでは force が正しい（クライアント設定と距離に潰されないため）
# warn-off execute-group
execute as @e[distance=0..,tag=feeder,type=marker] at @s run particle minecraft:flame ~ ~1.2 ~ 0.1 0.4 0.1 0 40 force

# 目視より確実。座標をそのまま出す
execute as @e[distance=0..,tag=feeder,type=marker] run data get entity @s Pos
