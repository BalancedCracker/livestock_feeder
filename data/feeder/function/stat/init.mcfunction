# 種別カウンタの初期化。マクロ関数。table.mcfunction から呼ばれる。  key = 接頭辞
#
# 未定義のままだと tellraw の score 部分が空欄になるので 0 で作っておく。
# add 0 なので既存の値は壊さない（リセットは stat/reset のほう）。
$scoreboard players add $(key).slots feeder.stat 0
$scoreboard players add $(key).grow feeder.stat 0
$scoreboard players add $(key).breed feeder.stat 0
$scoreboard players add $(key).cap feeder.stat 0
