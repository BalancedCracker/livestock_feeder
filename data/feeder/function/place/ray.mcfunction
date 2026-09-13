# 視線方向を 0.2 ブロック刻みで 5.6 ブロック先まで調べる。
# 実行位置 = プレイヤーの目。向きはプレイヤーの視線。
#
# ★再帰ではなく展開している。
#   ^ ^ ^N は「この関数に入った位置からの相対」なので、距離違いを並べれば
#   同じことができる。カウンタ用のスコアも再帰も要らない。
#   consume.mcfunction と同じで、機械的な繰り返しは展開したほうが速くて読める。
#
# ★打ち切り条件は「ドロッパーである」ではなく「登録対象になりうる」。
#   種類だけで止めると、視線上の手前に別のドロッパーがあった場合に
#   そこで打ち切られ、置いたばかりの本命まで到達しない。
#   条件を満たさないものは貫通して先へ進む。
#
# ★照合しているのは compound 形式の CustomName のみ。
#   金床でリネーム    -> CustomName は「素の文字列」
#   レシピ (色付き)   -> CustomName は「compound」
#   金床は色を付けられないので、compound かつ color を要求することで
#   「クラフトしたものだけを認識する」が成立する。
#
# ★刻み幅を粗くしないこと。
#   置いたブロックを視線が横切る距離は 1.0 とは限らない。面の端を浅い角度で
#   クリックすると、ブロック内を通る長さが 0.5 を下回ることがある。
#   0.2 はその取りこぼしを避けるための値。
execute positioned ^ ^ ^0.2 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^0.4 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^0.6 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^0.8 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^1.0 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^1.2 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^1.4 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^1.6 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^1.8 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^2.0 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^2.2 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^2.4 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^2.6 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^2.8 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^3.0 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^3.2 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^3.4 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^3.6 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^3.8 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^4.0 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^4.2 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^4.4 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^4.6 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^4.8 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^5.0 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^5.2 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^5.4 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
execute positioned ^ ^ ^5.6 if block ~ ~ ~ minecraft:dropper if data block ~ ~ ~ {CustomName:{text:"Livestock Feeder",color:"yellow"}} run return run function feeder:place/hit
