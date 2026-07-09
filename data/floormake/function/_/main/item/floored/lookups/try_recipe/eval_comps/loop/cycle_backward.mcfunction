#> floormake:_/main/item/floored/lookups/try_recipe/eval_comps/loop/cycle_backward
#--------------------
# ./cycle_current
#--------------------
# should only be called from ./cycle_current

data modify storage floormake:_ t.floored.eval_available[0].list append from storage floormake:_ t.floored.this_chosen

data remove storage floormake:_ t.floored.eval_chosen[-1]
data remove storage floormake:_ t.floored.eval_counts[-1]
data modify storage floormake:_ t.floored.eval_available prepend from storage floormake:_ t.floored.eval_available[-1]
data remove storage floormake:_ t.floored.eval_available[-1]
data modify storage floormake:_ t.floored.eval_available[1].list[].evaluated set value false
scoreboard players remove *floored.eval_index _floormake 1

# loop if index still in range:
execute if score *floored.eval_index _floormake matches 0.. run function floormake:_/main/item/floored/lookups/try_recipe/eval_comps/loop/loop
