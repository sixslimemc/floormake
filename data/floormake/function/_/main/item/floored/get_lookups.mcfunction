#> floormake:_/main/item/floored/get_lookups
#--------------------
# ./trigger
#--------------------

data modify storage floormake:_ t.floored.lookups set from storage floormake:_ data.dynamic_ingredients
$data modify storage floormake:_ t.floored.lookups append from storage floormake:_ data.ingredient_map."$(id)"[]