#> floormake:_/main/item/floored/lookups/try_recipe/eval_comps/loop/cycle_forward
#--------------------
# 
#--------------------

data modify storage floormake:_ t.floored.eval_chosen append from storage floormake:_ t.floored.this_chosen
data modify storage floormake:_ t.floored.eval_counts append from storage floormake:_ t.floored.new_count
data modify storage floormake:_ t.floored.eval_available append from storage floormake:_ t.floored.eval_available[0]
data remove storage floormake:_ t.floored.eval_available[0]
scoreboard players add *floored.eval_index _floormake 1

# return if loop not done:
execute if score *floored.eval_index _floormake < *floored.ingredients_length _floormake run return run function floormake:_/main/item/floored/lookups/try_recipe/eval_comps/loop/loop

# success:
scoreboard players set *floored.eval_success _floormake 1