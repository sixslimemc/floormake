#> floormake:_/main/item/floored/lookups/try_recipe/success/chosen/items/split
# AS [splitting item]
#--------------------
# ./on_root_item
#--------------------
tag @s remove _floormake.init

#DEBUG
say split

data modify storage floormake:_ x.data set from storage floormake:_ t.floored.root_data
data modify storage floormake:_ x.data.Item.count set from storage floormake:_ t.floored.this_entry.contributing
data remove storage floormake:_ x.data.Tags
data remove storage floormake:_ x.data.UUID
data remove storage floormake:_ x.data.Thrower
data modify storage floormake:_ x.data.PickupDelay set value 100s
data modify entity @s {} merge from storage floormake:_ x.data

tag @s add floormake.was_split

function floormake:_/main/item/floored/lookups/try_recipe/success/chosen/items/set_ingredient