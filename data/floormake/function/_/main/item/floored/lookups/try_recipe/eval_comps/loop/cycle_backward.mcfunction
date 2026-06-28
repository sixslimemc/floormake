#> floormake:_/main/item/floored/lookups/try_recipe/eval_comps/loop/cycle_backward
#--------------------
# ./cycle_current
#--------------------
# should only be called from ./cycle_current

data remove storage floormake:_ t.floored.eval_chosen[-1]
data modify storage floormake:_ t.floored.eval_available[0].list[].evaluated set value false
data modify storage floormake:_ t.floored.eval_available prepend from storage floormake:_ t.floored.eval_available[-1]
data remove storage floormake:_ t.floored.eval_available[-1]
scoreboard players remove *floored.eval_index _floormake 1

# loop if index still in range:
execute if score *floored.eval_index _floormake matches 0.. run function floormake:_/main/item/floored/lookups/try_recipe/eval_comps/loop/loop
