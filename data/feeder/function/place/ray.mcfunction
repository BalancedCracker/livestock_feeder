# 0.2 ブロックずつ前進。ドロッパーに当たるか、上限に達したら終わり。
execute if block ~ ~ ~ minecraft:dropper run return run function feeder:place/hit
execute if score #ray feeder.tmp matches ..0 run return 0
scoreboard players remove #ray feeder.tmp 1
execute positioned ^ ^ ^0.2 run function feeder:place/ray
