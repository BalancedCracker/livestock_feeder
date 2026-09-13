# 種別カウンタのゼロクリア。マクロ関数。table.mcfunction から呼ばれる。  key = 接頭辞
$scoreboard players set $(key).slots feeder.stat 0
$scoreboard players set $(key).grow feeder.stat 0
$scoreboard players set $(key).breed feeder.stat 0
$scoreboard players set $(key).cap feeder.stat 0
