#> floormake:_/main/item/floored/lookups/try_recipe/do
#--------------------
# ../each
#--------------------

execute store result score *floored.lookup_self_index _floormake run data get storage floormake:_ t.floored.this_lookup.self_index

# each ingredient:
scoreboard players set *floored.ingredient_index _floormake 0
data modify storage floormake:_ t.floored.ingredients set from storage floormake:_ t.floored.this_lookup.recipe.ingredients
execute if data storage floormake:_ t.floored.ingredients[0] run function floormake:_/main/item/floored/lookups/try_recipe/ingredients/each
