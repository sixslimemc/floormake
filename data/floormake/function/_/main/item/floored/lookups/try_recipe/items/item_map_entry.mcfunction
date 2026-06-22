#> floormake:_/main/item/floored/lookups/try_recipe/items/item_map_entry
#--------------------
# ./on
#--------------------

data modify storage floormake:_ x.entry set value {}
data modify storage floormake:_ x.entry.count set from storage floormake:_ t.floored.item.data.Item.count

$data modify storage floormake:_ t.floored.item_map.'$(guuid)' set from storage floormake:_ x.entry