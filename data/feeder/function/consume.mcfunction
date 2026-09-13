# 指定タグの餌を 1 個消費する。マクロ関数。  food = アイテムタグ
#
# if items の container.* は「あるか」しか答えないので、
# 減らす側はスロットを 1 つずつ特定するしかない。
# ドロッパーは 9 スロットなのでベタ書き。
#
# ★food をタグで受けるので、同じドロッパーに複数種類の餌が入っていても
#   「いま処理している種の餌」だけが減る。all_food で書くと、
#   ウシに給餌したのにニンジンが減る、という事故になる。
$execute if items block ~ ~ ~ container.0 $(food) run return run item modify block ~ ~ ~ container.0 feeder:consume_one
$execute if items block ~ ~ ~ container.1 $(food) run return run item modify block ~ ~ ~ container.1 feeder:consume_one
$execute if items block ~ ~ ~ container.2 $(food) run return run item modify block ~ ~ ~ container.2 feeder:consume_one
$execute if items block ~ ~ ~ container.3 $(food) run return run item modify block ~ ~ ~ container.3 feeder:consume_one
$execute if items block ~ ~ ~ container.4 $(food) run return run item modify block ~ ~ ~ container.4 feeder:consume_one
$execute if items block ~ ~ ~ container.5 $(food) run return run item modify block ~ ~ ~ container.5 feeder:consume_one
$execute if items block ~ ~ ~ container.6 $(food) run return run item modify block ~ ~ ~ container.6 feeder:consume_one
$execute if items block ~ ~ ~ container.7 $(food) run return run item modify block ~ ~ ~ container.7 feeder:consume_one
$execute if items block ~ ~ ~ container.8 $(food) run return run item modify block ~ ~ ~ container.8 feeder:consume_one
