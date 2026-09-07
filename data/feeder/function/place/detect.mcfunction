# 実行者=プレイヤー。ドロッパーを設置した直後に advancement から呼ばれる。
#
# ★ここを忘れると 1 回しか動かない。
#   アドバンスメントは達成済みだと二度と発火しないので、
#   イベントトリガとして使う場合は必ず冒頭で自分を取り消す。
advancement revoke @s only feeder:placed_dropper

# 設置直後、置いたブロックは必ず視線上にある。
# 目の位置から前方へレイキャストして座標を拾う。30 ステップ x 0.2 = 6 ブロック。
scoreboard players set #ray feeder.tmp 30
execute anchored eyes positioned ^ ^ ^ run function feeder:place/ray
