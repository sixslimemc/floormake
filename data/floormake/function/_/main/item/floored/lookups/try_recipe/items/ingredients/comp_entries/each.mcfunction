#> floormake:_/main/item/floored/lookups/try_recipe/items/ingredients/comp_entries/each
#--------------------
# ../match
#--------------------

data modify storage floormake:_ t.floored.this_entry_mut set from storage floormake:_ t.floored.comp_entries[-1]

function floormake:_/main/item/floored/lookups/try_recipe/items/ingredients/comp_entries/modify

data modify storage floormake:_ t.floored.this_composition.list append from storage floormake:_ t.floored.this_entry_mut

data remove storage floormake:_ t.floored.comp_entries[-1]
execute if data storage floormake:_ t.floored.comp_entries[0] run function floormake:_/main/item/floored/lookups/try_recipe/items/ingredients/comp_entries/each