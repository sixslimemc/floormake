#> floormake:_/main/item/floored/lookups/try_recipe/eval_comps/do
#--------------------
# ../do
#--------------------

scoreboard players set *floored.eval_index _floormake 0
scoreboard players set *floored.eval_success _floormake 0

# use cycling not indexing

# [{items:[{contributing:int, guuid:Guuid}]}]
data modify storage floormake:_ t.floored.eval_chosen set value []

# [{list:[{evaluated:bool, items:[{contributing:int, guuid:Guuid}]}]}]
data modify storage floormake:_ t.floored.eval_available set value []

# [{<guuid>: {count: int}}]
data modify storage floormake:_ t.floored.eval_counts set value []
data modify storage floormake:_ t.floored.eval_counts append from storage floormake:_ t.floored.item_map

# populate {..eval_available}:
execute if data storage floormake:_ t.floored.compositions[0] run function floormake:_/main/item/floored/lookups/try_recipe/eval_comps/init_available

function floormake:_/main/item/floored/lookups/try_recipe/eval_comps/loop/loop