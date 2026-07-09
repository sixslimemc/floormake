#> floormake:_/main/item/floored/lookups/try_recipe/success/clean_item
# AS [ingredient item]
#--------------------
# ./do
#--------------------
execute if entity @s[tag=_floormake.consuming] run return run kill @s
tag @s remove floormake.ingredient
tag @s remove floormake.was_split
scoreboard players reset @s floormake.ingredient_index