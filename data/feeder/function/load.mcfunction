# 初期化。#load タグから毎リロード呼ばれる
scoreboard objectives add feeder.tmp dummy
scoreboard objectives add feeder.stat dummy

# サイドバーに出すので表示名を付ける。
# 失敗しても objective 自体は残るよう、add とは行を分けてある。
scoreboard objectives modify feeder.stat displayname {"text":"Livestock Feeder","color":"yellow"}

scoreboard players set #ten feeder.tmp 10

# 計測カウンタは未定義だと表示が欠けるので 0 で初期化しておく
#
# ★ここだけ # を付けないこと。
#   名前が # で始まるエントリはサイドバー等の表示から除外される。
#   feeder.tmp の内部変数は隠したいので # 付き、
#   feeder.stat は見せたいので # 無し、と使い分けている。
scoreboard players add cycles feeder.stat 0
scoreboard players add visits feeder.stat 0
scoreboard players add empty feeder.stat 0
scoreboard players add cap_all feeder.stat 0
scoreboard players add low_food feeder.stat 0
scoreboard players add no_pair feeder.stat 0

# 種別カウンタ。種を足しても table.mcfunction だけ直せば追従する。
function feeder:table {op:"stat/init"}

# 判定ループ。★間隔はここと tick.mcfunction の 2 箇所にある
schedule function feeder:tick 30s replace

# 表示ループ。★間隔はここと glow.mcfunction の 2 箇所にある
schedule function feeder:glow 2s replace
