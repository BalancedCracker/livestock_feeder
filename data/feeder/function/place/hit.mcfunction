# レイがドロッパーに当たった位置（ブロック内の小数点座標）で実行される。

# 金床で付けた名前が一致しなければ何もしない。
# ★CustomName の表記はバージョン依存。26.1.2 では素の文字列。
#   確認方法: /data get block <x> <y> <z> CustomName
execute unless data block ~ ~ ~ {CustomName:"cow_feeder"} run return 0

# 二重登録の防止
execute align xyz positioned ~0.5 ~0.5 ~0.5 if entity @e[tag=feeder,distance=..0.1,type=marker] run return 0

# ブロック中心に置く。角に summon すると射程が片側に偏る
execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon minecraft:marker ~ ~ ~ {Tags:["feeder"]}

# 登録できたことをプレイヤーに返す(ビーコンの音と緑色のパーティクル)
playsound minecraft:block.beacon.activate block @s ~ ~ ~ 0.6 1.8
particle minecraft:happy_villager ~ ~0.5 ~ 0.4 0.4 0.4 0 15
