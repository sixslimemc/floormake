#> floormake:_/main/item/floored/lookups/try_recipe/ingredients/each
#--------------------
# ../do
#--------------------

data modify storage floormake:_ t.floored.this_ingredient set from storage floormake:_ t.floored.ingredients[0]



scoreboard players add *floored.ingredient_index _floormake 1
data remove storage floormake:_ t.floored.ingredients[0]
execute if data storage floormake:_ t.floored.ingredients[0] run function floormake:_/main/item/floored/lookups/try_recipe/items/ingredients/each
