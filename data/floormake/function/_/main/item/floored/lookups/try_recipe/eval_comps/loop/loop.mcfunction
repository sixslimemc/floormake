#> floormake:_/main/item/floored/lookups/try_recipe/eval_comps/loop/loop
#--------------------
# ../do
#--------------------
# cycle_forward and cycle_backward assume this always happens on loop:
data modify storage floormake:_ t.floored.this_chosen set from storage floormake:_ t.floored.eval_available[0].list[-1]
data remove storage floormake:_ t.floored.eval_available[0].list[-1]

