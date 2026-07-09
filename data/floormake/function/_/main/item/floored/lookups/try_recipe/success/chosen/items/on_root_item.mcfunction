#> floormake:_/main/item/floored/lookups/try_recipe/success/chosen/items/on_root_item
# AS [root item]
#--------------------
# ./each
#--------------------

data modify storage floormake:_ t.floored.root_data set from entity @s

execute store result score *floored.new_count _floormake run data get storage floormake:_ t.floored.root_data.Item.count
execute store result score *x _floormake run data get storage floormake:_ t.floored.this_entry.contributing
scoreboard players operation *floored.new_count _floormake -= *x _floormake

# set ingredient directly if no split required:
execute if score *floored.new_count _floormake matches ..0 run return run function floormake:_/main/item/floored/lookups/try_recipe/success/chosen/items/set_ingredient

# split:
execute store result entity @s Item.count int 1 run scoreboard players get *floored.new_count _floormake
summon item ~ ~ ~ {Tags:["_floormake.init"], Item:{id:"minecraft:structure_void", count:1}}
execute as @n[type=item, tag=_floormake.init, dx=0] at @s run function floormake:_/main/item/floored/lookups/try_recipe/success/chosen/items/split
