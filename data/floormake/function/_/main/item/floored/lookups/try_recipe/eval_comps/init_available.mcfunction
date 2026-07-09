#> floormake:_/main/item/floored/lookups/try_recipe/eval_comps/init_available
#--------------------
# ./do
#--------------------

data modify storage floormake:_ t.floored.eval_available prepend value {list:[]}
data modify storage floormake:_ t.floored.eval_available[0].list append from storage floormake:_ t.floored.compositions[-1].list[{needed:0}]
data remove storage floormake:_ t.floored.eval_available[0].list[].needed
data modify storage floormake:_ t.floored.eval_available[0].list[].evaluated set value true

data remove storage floormake:_ t.floored.compositions[-1]
execute if data storage floormake:_ t.floored.compositions[0] run function floormake:_/main/item/floored/lookups/try_recipe/eval_comps/init_available