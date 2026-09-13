# 状態を一括で吐く。/function feeder:debug
#
# ★カウンタが 28 個あるのでサイドバーには収まらない。
#   常時表示したいなら feeder.stat をサイドバーに出すのではなく、
#   必要なときにこの関数を叩くこと。
say --- feeder debug ---

execute store result score #n feeder.tmp if entity @e[distance=0..,tag=feeder,type=marker]
execute store result score #s feeder.tmp if entity @e[distance=0..,tag=feeder,tag=stocked,type=marker]
tellraw @s [{"text":"Feeder(s): "},{"score":{"name":"#n","objective":"feeder.tmp"}},{"text":" (with food: "},{"score":{"name":"#s","objective":"feeder.tmp"}},{"text":")"}]

# 種別カウンタの合計を集める
scoreboard players set #sum_slots feeder.tmp 0
scoreboard players set #sum_grow feeder.tmp 0
scoreboard players set #sum_breed feeder.tmp 0
scoreboard players set #sum_cap feeder.tmp 0
function feeder:table {op:"stat/sum"}

tellraw @s [{"text":"cycles:","color":"gray"},{"score":{"name":"cycles","objective":"feeder.stat"}},{"text":" visits:","color":"gray"},{"score":{"name":"visits","objective":"feeder.stat"}},{"text":" empty:","color":"gray"},{"score":{"name":"empty","objective":"feeder.stat"}}]
tellraw @s [{"text":"total  ","color":"gold"},{"text":"slots:","color":"gray"},{"score":{"name":"#sum_slots","objective":"feeder.tmp"}},{"text":" grow:","color":"gray"},{"score":{"name":"#sum_grow","objective":"feeder.tmp"}},{"text":" breed:","color":"gray"},{"score":{"name":"#sum_breed","objective":"feeder.tmp"}},{"text":" cap:","color":"gray"},{"score":{"name":"#sum_cap","objective":"feeder.tmp"}}]
tellraw @s [{"text":"blocked","color":"gold"},{"text":"  cap_all:","color":"gray"},{"score":{"name":"cap_all","objective":"feeder.stat"}},{"text":" low_food:","color":"gray"},{"score":{"name":"low_food","objective":"feeder.stat"}},{"text":" no_pair:","color":"gray"},{"score":{"name":"no_pair","objective":"feeder.stat"}}]

# 種別の内訳
function feeder:table {op:"stat/show"}

# 目視用。デバッグでは force が正しい（クライアント設定と距離に潰されないため）
# warn-off execute-group
execute as @e[distance=0..,tag=feeder,type=marker] at @s run particle minecraft:flame ~ ~1.2 ~ 0.1 0.4 0.1 0 40 force

# 目視より確実。座標をそのまま出す。
#
# ★data get ではチャットに出ない。
#   関数の中で実行されたコマンドは feedback が抑制されるため、
#   say / tellraw のような「明示的にメッセージを送るコマンド」以外は
#   画面に何も出てこない。手打ちすると出るので気づきにくい。
#   座標は nbt テキストコンポーネントで tellraw に埋め込む。
#
# ★宛先を @s にしないこと。
#   execute as @e の内側では @s はマーカー自身を指すので、
#   マーカーに向かって喋ることになり誰にも届かない。
# warn-off execute-group
execute as @e[distance=0..,tag=feeder,type=marker] run tellraw @a [{"text":"  marker @ ","color":"gray"},{"nbt":"Pos","entity":"@s","color":"white"}]
