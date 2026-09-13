# レイが「Livestock Feeder という名前のドロッパー」に当たった位置
#（ブロック内の小数点座標）で実行される。
#
# 名前の照合は ray 側で済んでいる。
# （手前の別ドロッパーでレイを打ち切らないため）
# CustomName の確認方法: /data get block <x> <y> <z> CustomName

# 二重登録の防止
execute align xyz positioned ~0.5 ~0.5 ~0.5 if entity @e[tag=feeder,distance=..0.1,type=marker] run return 0

# ブロック中心に置く。角に summon すると射程が片側に偏る
execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon minecraft:marker ~ ~ ~ {Tags:["feeder"]}

# 登録できたことをプレイヤーに返す(ビーコンの音と緑色のパーティクル)
playsound minecraft:block.beacon.activate block @s ~ ~ ~ 0.6 1.8
particle minecraft:happy_villager ~ ~0.5 ~ 0.4 0.4 0.4 0 15
