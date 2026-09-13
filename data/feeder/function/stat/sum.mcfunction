# 種別カウンタの合計。マクロ関数。table.mcfunction から呼ばれる。  key = 接頭辞
#
# 呼ぶ前に #sum_* をゼロクリアしておくこと（debug.mcfunction が行う）。
$scoreboard players operation #sum_slots feeder.tmp += $(key).slots feeder.stat
$scoreboard players operation #sum_grow feeder.tmp += $(key).grow feeder.stat
$scoreboard players operation #sum_breed feeder.tmp += $(key).breed feeder.stat
$scoreboard players operation #sum_cap feeder.tmp += $(key).cap feeder.stat
