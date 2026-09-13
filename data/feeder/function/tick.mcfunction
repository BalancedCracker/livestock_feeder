# 最初に次回を予約しておく（この先で return しても止まらないように）
schedule function feeder:tick 30s replace

scoreboard players add cycles feeder.stat 1

# 全給餌器を巡回。ここだけは全体走査だが 30 秒に 1 回なので許容
execute as @e[tag=feeder,distance=0..,type=marker] at @s run function feeder:each
