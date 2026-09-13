# 1 種ぶんの給餌処理。マクロ関数。table.mcfunction から呼ばれる。
#
#   key  = 統計カウンタの接頭辞      例 "cow"
#   id   = 対象エンティティ ID      例 "minecraft:cow"
#   food = 餌のアイテムタグ          例 "#feeder:wheat_food"
#   cap  = その種の密度上限          例 "8"
#
# 実行者=marker / 実行位置=ドロッパーの中心
#
# ★マクロにした理由:
#   餌が 1 種類だった頃は「9 行ベタ書きのほうが速くて読める」で正しかった。
#   6 種に増えた時点でトレードオフが逆転する。同じ 12 行を 6 回コピーすると、
#   バグ修正のたびに 6 箇所直すことになり、必ずどれかを取りこぼす。
#   再パースのコストは 30 秒間隔なら誤差。
#
# ★早期 return のたびに理由別のカウンタを積んでいる。
#   「何回働いたか」より「なぜ働かなかったか」のほうがチューニングに効く。
#   餌があった機会は必ずどれかに落ちるので、次の検算が成り立つ:
#     Σ<key>.slots = Σ<key>.cap + cap_all + low_food + no_pair + Σ<key>.breed
#   合わなければ、把握していない経路があるということ。

# --- 在庫確認 : この種の餌が入っていなければ即撤退 ---
# 餌が無い種はここで抜けるので、以降のエンティティ走査は走らない。
$execute store result score #food feeder.tmp if items block ~ ~ ~ container.* $(food)
execute if score #food feeder.tmp matches ..0 run return 0
$scoreboard players add $(key).slots feeder.stat 1

# --- 成長促進 ---
# AgeLocked:1b (金のタンポポ) はプレイヤーの明示的な意思なので除外する
#
# ★ここで return しないこと。
#   かつては「増やす前に片付ける」ため成長促進を優先して打ち切っていたが、
#   それは密度上限が無かった頃の代用品だった。いまは本物の上限があるので
#   打ち切りは不要で、子供が育ち切るまで繁殖が止まる待ち時間だけが残る。
#   成長促進と繁殖は同じサイクルで両方走ってよい。
scoreboard players set #fed feeder.tmp 0
$execute as @e[type=$(id),distance=..4,nbt=!{Age:0},nbt=!{AgeLocked:1b}] run function feeder:grow_one
$execute if score #fed feeder.tmp matches 1.. run function feeder:consume {food:"$(food)"}
$execute if score #fed feeder.tmp matches 1.. run scoreboard players add $(key).grow feeder.stat 1
# 消費した 1 個ぶんを在庫カウントからも引く。
# 引かないと、残り 1 個なのに繁殖が成立したと誤判定する。
execute if score #fed feeder.tmp matches 1.. run scoreboard players remove #food feeder.tmp 1

# --- 密度上限 (種別) ---
$execute store result score #n feeder.tmp if entity @e[type=$(id),distance=..4]
$execute if score #n feeder.tmp matches $(cap).. run return run scoreboard players add $(key).cap feeder.stat 1

# --- 密度上限 (全体) : each が数えた値を使う ---
execute if score #total feeder.tmp matches 24.. run return run scoreboard players add cap_all feeder.stat 1

# --- 繁殖 : 餌 2 個 + 発情可能な成体 2 頭 ---
# low_food と no_pair は症状が似ているが打つ手は正反対。
#   low_food -> 補充が必要
#   no_pair  -> 待てば解決する。異常ではない
# 表示でまとめるのは自由だが、取得は分けておくこと。合算すると後から分けられない。
execute if score #food feeder.tmp matches ..1 run return run scoreboard players add low_food feeder.stat 1
$execute store result score #ready feeder.tmp if entity @e[type=$(id),distance=..4,nbt={Age:0,InLove:0}]
execute if score #ready feeder.tmp matches ..1 run return run scoreboard players add no_pair feeder.stat 1

$function feeder:breed {id:"$(id)"}
$function feeder:consume {food:"$(food)"}
$function feeder:consume {food:"$(food)"}
$scoreboard players add $(key).breed feeder.stat 1
