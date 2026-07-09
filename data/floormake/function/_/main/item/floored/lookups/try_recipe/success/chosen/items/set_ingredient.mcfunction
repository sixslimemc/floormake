#> floormake:_/main/item/floored/lookups/try_recipe/success/chosen/items/set_ingredient
# AS [ingredient item]
#--------------------
# ./on_root_item
# ./split
#--------------------

tag @s add floormake.ingredient
scoreboard players operation @s floormake.ingredient_index = *floored.ingredient_index _floormake
execute if score *floored.consume_item _floormake matches 1 run tag @s add _floormake.consuming

# run ingredient result:
function floormake:_/main/item/floored/lookups/try_recipe/success/chosen/items/run_ingredient with storage floormake:_ t.floored.this_result