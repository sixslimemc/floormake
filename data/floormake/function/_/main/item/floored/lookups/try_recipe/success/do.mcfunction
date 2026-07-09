#> floormake:_/main/item/floored/lookups/try_recipe/success/do
# AS [root item]
#--------------------
# ../do
#--------------------

scoreboard players set *floored.ingredient_index _floormake 0
execute if data storage floormake:_ t.floored.eval_chosen[0] run function floormake:_/main/item/floored/lookups/try_recipe/success/chosen/each

