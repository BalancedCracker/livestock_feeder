# 実行者=プレイヤー。ドロッパーを設置した直後に advancement から呼ばれる。
#
# ★ここを忘れると 1 回しか動かない。
#   アドバンスメントは達成済みだと二度と発火しないので、
#   イベントトリガとして使う場合は必ず冒頭で自分を取り消す。
advancement revoke @s only feeder:placed_dropper

# datapack にはイベントから座標を受け取る手段が無い。
# rewards.function は「プレイヤーとして・プレイヤーの位置で」走るだけで、
# どのブロックを置いたのかは渡ってこない。
#
# ただし設置直後、置いたブロックは必ず視線上にある
# （クリックした面の手前に湧くため）。
# 目の位置を起点にして前方を走査し、座標を再構成する。
execute anchored eyes positioned ^ ^ ^ run function feeder:place/ray
