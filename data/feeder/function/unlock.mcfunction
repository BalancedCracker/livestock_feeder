# レシピ解放時にアドバンスメントの rewards から呼ばれる。実行者=プレイヤー。
#
# ★バニラのレシピ開放トーストは「レシピブックを確認しましょう」としか言わない。
#   文言は翻訳キー (recipe.toast.description) で固定されており、
#   datapack から差し替える手段は無い。リソースパックで上書きはできるが、
#   バニラのレシピ開放トースト全部に影響してしまう。
#   そこでチャットに 1 行だけ添えて、何が解放されたのかを伝える。
#
# ★recipe.toast.title だけ translate を使っている。
#   これは「Recipe Unlocked / レシピ開放」そのもので意味が完全に一致するうえ、
#   直前に出るバニラのトーストと同じ語になるため一貫性も増す。
#   意味が一致しない箇所に無理に翻訳キーを当てると、どの言語でも通じない
#   文章になるので、説明文は英語リテラルにしてある。
tellraw @s [{"text":"[","color":"dark_gray"},{"translate":"recipe.toast.title","color":"gold"},{"text":"] ","color":"dark_gray"},{"text":"Livestock Feeder","color":"yellow"},{"text":" - feeds and breeds your farm animals automatically.","color":"gray"}]
