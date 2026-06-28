#> floormake:_/main/item/floored/lookups/try_recipe/eval_comps/loop/get_new_count/each_item
#--------------------
# ./do
#--------------------

data modify storage floormake:_ x.macro.guuid set from storage floormake:_ t.floored.update_items[-1].guuid
execute store result score *floored.subtract_amount _floormake run data get storage floormake:_ t.floored.update_items[-1].contributing

execute store result score *x _floormake run function floormake:_/main/item/floored/lookups/try_recipe/eval_comps/loop/get_new_count/operation with storage floormake:_ x.macro
execute if score *x _floormake matches 0 run return run scoreboard players set *floored.update_success _floormake 0

data remove storage floormake:_ t.floored.update_items[-1]
execute if data storage floormake:_ t.floored.update_items[0] run function floormake:_/main/item/floored/lookups/try_recipe/eval_comps/loop/get_new_count/each_item