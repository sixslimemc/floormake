#> floormake:_/main/item/floored/lookups/try_recipe/success/chosen/items/each
#--------------------
# ../each
#--------------------

data modify storage floormake:_ t.floored.this_entry set from storage floormake:_ t.floored.this_chosen.items[-1]

# on item:
data modify storage floormake:_ x.mline set value {1:"execute as ", 2:true, 3:" at @s run function floormake:_/main/item/floored/lookups/try_recipe/success/chosen/items/on_root_item"}
data modify storage floormake:_ x.mline.2 set from storage floormake:_ t.floored.this_entry.guuid
function six:-/mline/3 with storage floormake:_ x.mline

data remove storage floormake:_ t.floored.this_chosen.items[-1]
execute if data storage floormake:_ t.floored.this_chosen.items[0] run function floormake:_/main/item/floored/lookups/try_recipe/success/chosen/items/each