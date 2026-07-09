#> floormake:_/main/item/floored/lookups/try_recipe/eval_comps/loop/loop
#--------------------
# ../do
#--------------------
# cycle_forward and cycle_backward assume this always happens on loop:
data modify storage floormake:_ t.floored.this_chosen set from storage floormake:_ t.floored.eval_available[0].list[-1]
data remove storage floormake:_ t.floored.eval_available[0].list[-1]

# DEBUG:
tellraw @a ["AVAILABLE: ", {'storage':'floormake:_', 'nbt':'t.floored.eval_available[0].list'}]
tellraw @a ["CHOSING: ", {'storage':'floormake:_', 'nbt':'t.floored.this_chosen'}]

# try get new count:
execute store result score *x _floormake run function floormake:_/main/item/floored/lookups/try_recipe/eval_comps/loop/get_new_count/do

execute if score *x _floormake matches 1 run return run function floormake:_/main/item/floored/lookups/try_recipe/eval_comps/loop/cycle_forward

function floormake:_/main/item/floored/lookups/try_recipe/eval_comps/loop/cycle_current