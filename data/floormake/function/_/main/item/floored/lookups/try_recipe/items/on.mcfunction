#> floormake:_/main/item/floored/lookups/try_recipe/items/on
# AS [item]
#--------------------
# ../do
#--------------------

# each ingredient:
scoreboard players set *floored.ingredient_index _floormake 0
data modify storage floormake:_ t.floored.ingredients set from storage floormake:_ t.floored.this_lookup.recipe.ingredients
execute if data storage floormake:_ t.floored.ingredients[0] run function floormake:_/main/item/floored/lookups/try_recipe/items/ingredients/each
