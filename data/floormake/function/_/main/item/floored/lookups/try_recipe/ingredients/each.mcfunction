#> floormake:_/main/item/floored/lookups/try_recipe/ingredients/each
#--------------------
# ../do
#--------------------

data modify storage floormake:_ t.floored.this_ingredient set from storage floormake:_ t.floored.ingredients[-1]



data remove storage floormake:_ t.floored.ingredients[-1]
execute if data storage floormake:_ t.floored.ingredients[0] run function floormake:_/main/item/floored/lookups/try_recipe/ingredients/each
