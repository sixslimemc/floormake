#> floormake:_/main/item/floored/lookups/try_recipe/eval_comps/loop/cycle_current
#--------------------
# 
#--------------------

data modify storage floormake:_ t.floored.this_chosen.evaluated set value true
data modify storage floormake:_ t.floored.eval_available[0].list prepend from storage floormake:_ t.floored.this_chosen

function floormake:_/main/item/floored/lookups/try_recipe/eval_comps/loop/loop