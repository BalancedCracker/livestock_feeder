# 稼働インジケータ専用の短い周期ループ。2 秒ごと。
schedule function feeder:glow 2s replace

# ★ここでブロックの中身は見ない。
#   在庫判定は 30 秒周期の each が済ませて stocked タグに畳んである。
#   タグ照合はほぼ無料なので、台数が増えてもコストが伸びない。
# ★force は付けない。
#   normal のままなら約 32 ブロックを超えた分はサーバが自動で送信を止める。
#   常時表示のインジケータでは、この自動間引きこそが欲しい挙動。
execute as @e[tag=feeder,tag=stocked,distance=0..,type=marker] at @s run particle minecraft:composter ~ ~1.1 ~ 0.15 0.05 0.15 0 3
