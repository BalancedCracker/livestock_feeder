# 最寄りの 2 頭を発情させる。ハートの描画はクライアントが InLove を見て勝手にやる
execute as @e[distance=..4,nbt={Age:0,InLove:0},sort=nearest,limit=2,type=cow] run data merge entity @s {InLove:600}
