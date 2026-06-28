#> floormake:_/main/item/floored/lookups/try_recipe/eval_comps/loop/get_new_count/do
#--------------------
#
#--------------------
# tries to set {..new_count}, returns 0 if unsuccessful (not enough counts for {..this_chosen} in {..eval_counts[-1]}.

scoreboard players set *floored.update_success _floormake 1

data modify storage floormake:_ t.floored.new_count set from storage floormake:_ t.floored.eval_counts[-1]

data modify storage floormake:_ t.floored.update_items set from storage floormake:_ t.floored.this_chosen.items
execute if data storage floormake:_ t.floored.update_items[0] run function floormake:_/main/item/floored/lookups/try_recipe/eval_comps/loop/get_new_count/each_item

return run scoreboard players get *floored.update_success _floormake