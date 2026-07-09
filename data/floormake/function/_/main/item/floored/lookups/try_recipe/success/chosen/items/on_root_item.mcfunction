#> floormake:_/main/item/floored/lookups/try_recipe/success/chosen/items/on_root_item
# AS [root item]
#--------------------
# ./each
#--------------------

data modify entity @s PickupDelay set value 2s
data modify storage floormake:_ t.floored.root_data set from entity @s

execute store result score *x _floormake run data get storage floormake:_ t.floored.root_data.Item.count
execute store result score *y _floormake run data get storage floormake:_ t.floored.this_entry.contributing
scoreboard players operation *x _floormake -= *y _floormake


# set ingredient directly if no split required:
execute if score *x _floormake matches ..0 run return run function floormake:_/main/item/floored/lookups/try_recipe/success/chosen/items/set_ingredient

# split:
summon item ~ ~ ~ {Tags:["_floormake.init"], Item:{id:"minecraft:slime_ball", count:1}}
execute as @n[type=item, tag=_floormake.init, dx=0] at @s run function floormake:_/main/item/floored/lookups/try_recipe/success/chosen/items/split