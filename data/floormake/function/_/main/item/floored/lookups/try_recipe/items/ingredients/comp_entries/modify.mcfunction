#> floormake:_/main/item/floored/lookups/try_recipe/items/ingredients/comp_entries/modify
#--------------------
# ./each
#--------------------

# dont modify if no needs:
execute store result score *y _floormake run data get storage floormake:_ t.floored.this_entry_mut.needs
execute if score *y _floormake matches ..0 run return 0

# *x = contributing
# *y = needs
scoreboard players operation *x _floormake = *floored.item_count _floormake
execute if score *x _floormake > *y _floormake run scoreboard players operation *x _floormake = *y _floormake
scoreboard players operation *y _floormake -= *x _floormake

data modify storage floormake:_ x.entry set value {guuid:"", contributing:0}
execute store result storage floormake:_ x.entry.contributing int 1 run scoreboard players get *x _floormake
data modify storage floormake:_ x.entry.guuid set from storage floormake:_ t.floored.item.guuid

data modify storage floormake:_ t.floored.this_entry_mut.items append from storage floormake:_ x.entry
execute store result storage floormake:_ t.floored.this_entry_mut.needs int 1 run scoreboard players get *y _floormake