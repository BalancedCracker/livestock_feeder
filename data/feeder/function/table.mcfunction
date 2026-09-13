# 対象の家畜の一覧。マクロ関数。
#
#   op   = 各行に対して呼び出す関数名
#   key  = 統計カウンタの接頭辞
#   id   = エンティティ ID
#   food = 餌のアイテムタグ
#   cap  = その種の密度上限
#
# ★種を足すならここに 1 行足して、対応するアイテムタグを作るだけ。
#
# ★op を差し替えることで、同じ表を給餌処理にも統計の初期化・表示・リセットにも
#   使い回している。表がひとつしかないので、種を足したときに片方だけ直し忘れる、
#   という事故が起きない。
#   呼び出し先が使わない引数は無視されるので、key しか見ない関数でも問題ない。
#
# ★餌グループではなく「種ごと」に 1 行なのは、異種を同時に発情させると
#   相手が見つからず餌だけ消えるため（ウシとヒツジは繁殖できない）。
$function feeder:$(op) {key:"cow",       id:"minecraft:cow",       food:"#feeder:wheat_food",   cap:"8"}
$function feeder:$(op) {key:"mooshroom", id:"minecraft:mooshroom", food:"#feeder:wheat_food",   cap:"8"}
$function feeder:$(op) {key:"sheep",     id:"minecraft:sheep",     food:"#feeder:wheat_food",   cap:"8"}
$function feeder:$(op) {key:"pig",       id:"minecraft:pig",       food:"#feeder:pig_food",     cap:"8"}
$function feeder:$(op) {key:"rabbit",    id:"minecraft:rabbit",    food:"#feeder:rabbit_food",  cap:"8"}
$function feeder:$(op) {key:"chicken",   id:"minecraft:chicken",   food:"#feeder:chicken_food", cap:"8"}
