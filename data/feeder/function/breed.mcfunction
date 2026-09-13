# 最寄りの 2 頭を発情させる。マクロ関数。  id = 対象エンティティ ID
#
# ハートの描画はクライアントが InLove を見て勝手にやる。
# ★同種のみを対象にすること。異種を同時に発情させると相手が見つからず、
#   餌だけ消えて何も起きない。
$execute as @e[distance=..4,nbt={Age:0,InLove:0},sort=nearest,limit=2,type=$(id)] run data merge entity @s {InLove:600}
