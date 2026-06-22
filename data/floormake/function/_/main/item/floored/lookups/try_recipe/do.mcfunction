#> floormake:_/main/item/floored/lookups/try_recipe/do
#--------------------
# ../each
#--------------------

execute store result score *floored.lookup_self_index _floormake run data get storage floormake:_ t.floored.this_lookup.self_index

$execute as @e[type=item, distance=..$(radius), tag=!-, tag=!_] run function floormake:_/main/item/floored/lookups/try_recipe/items/on