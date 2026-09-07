# 初期化。#load タグから毎リロード呼ばれる
scoreboard objectives add feeder.tmp dummy
scoreboard objectives add feeder.stat dummy
scoreboard players set #ten feeder.tmp 10

# 計測カウンタは未定義だと表示が欠けるので 0 で初期化しておく
scoreboard players add #cycles feeder.stat 0
scoreboard players add #grow feeder.stat 0
scoreboard players add #breed feeder.stat 0

# 判定ループ。★間隔はここと tick.mcfunction の 2 箇所にある
schedule function feeder:tick 30s replace

# 表示ループ。★間隔はここと glow.mcfunction の 2 箇所にある
schedule function feeder:glow 2s replace
