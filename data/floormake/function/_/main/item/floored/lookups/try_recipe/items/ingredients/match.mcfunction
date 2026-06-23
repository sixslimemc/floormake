#> floormake:_/main/item/floored/lookups/try_recipe/items/ingredients/match
#--------------------
# ./each
#--------------------
scoreboard players add *floored.ingredient_matches _floormake 1

# LEFTOFF:
# populate {..compositions[$(ingredient_index)].list} properly, taking into account the limit of this item's count and adding to existing entries that have 'needs' > 0

$data modify storage floormake:_ t.floored.this_composition set from storage floormake:_ t.floored.compositions[$(ingredient_index)]

# modify existing list (via full remake)
data modify storage floormake:_ t.floored.comp_entries set from storage floormake:_ t.floored.this_composition.list
data modify storage floormake:_ t.floored.this_composition.list set value []
execute if data storage floormake:_ t.floored.comp_entries[0] run function floormake:_/main/item/floored/lookups/try_recipe/items/ingredients/comp_entries/each

# entry of just this item:
# *x = contributing
# *y = needs
scoreboard players operation *x _floormake = *floored.item_count _floormake
execute store result score *y _floormake run data get storage floormake:_ t.floored.this_ingredient.count
execute if score *x _floormake > *y _floormake run scoreboard players operation *x _floormake = *y _floormake
scoreboard players operation *y _floormake -= *x _floormake

data modify storage floormake:_ x.entry set value {needs:0, items:[{guuid:"", contributing:0}]}
execute store result storage floormake:_ x.entry.needs int 1 run scoreboard players get *y _floormake
execute store result storage floormake:_ x.entry.items[0].contributing int 1 run scoreboard players get *y _floormake
data modify storage floormake:_ x.entry.items[0].guuid set from storage floormake:_ t.floored.item.guuid
data modify storage floormake:_ t.floored.this_composition.list append from storage floormake:_ x.entry



$data modify storage floormake:_ t.floored.compositions[$(ingredient_index)] set from storage floormake:_ t.floored.this_composition