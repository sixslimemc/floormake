#> floormake:_/main/item/floored/lookups/try_recipe/eval_comps/loop/cycle_current
#--------------------
# 
#--------------------

data modify storage floormake:_ t.floored.this_chosen.evaluated set value true
data modify storage floormake:_ t.floored.eval_available[0].list prepend from storage floormake:_ t.floored.this_chosen

# cycle backward if all has been evaluated:
data modify storage floormake:_ x.entry set from storage floormake:_ t.floored.eval_available[0].list[-1]
execute if data storage floormake:_ x.entry{evaluated:true} run return run function floormake:_/main/item/floored/lookups/try_recipe/eval_comps/loop/cycle_backward
