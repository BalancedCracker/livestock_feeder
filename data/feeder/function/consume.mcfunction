# 小麦を 1 個消費する。
# if items の container.* は「あるか」しか答えないので、
# 減らす側はスロットを 1 つずつ特定するしかない。
# ドロッパーは 9 スロットなのでベタ書きが一番速くて読める。
execute if items block ~ ~ ~ container.0 minecraft:wheat run return run item modify block ~ ~ ~ container.0 feeder:consume_one
execute if items block ~ ~ ~ container.1 minecraft:wheat run return run item modify block ~ ~ ~ container.1 feeder:consume_one
execute if items block ~ ~ ~ container.2 minecraft:wheat run return run item modify block ~ ~ ~ container.2 feeder:consume_one
execute if items block ~ ~ ~ container.3 minecraft:wheat run return run item modify block ~ ~ ~ container.3 feeder:consume_one
execute if items block ~ ~ ~ container.4 minecraft:wheat run return run item modify block ~ ~ ~ container.4 feeder:consume_one
execute if items block ~ ~ ~ container.5 minecraft:wheat run return run item modify block ~ ~ ~ container.5 feeder:consume_one
execute if items block ~ ~ ~ container.6 minecraft:wheat run return run item modify block ~ ~ ~ container.6 feeder:consume_one
execute if items block ~ ~ ~ container.7 minecraft:wheat run return run item modify block ~ ~ ~ container.7 feeder:consume_one
execute if items block ~ ~ ~ container.8 minecraft:wheat run return run item modify block ~ ~ ~ container.8 feeder:consume_one
