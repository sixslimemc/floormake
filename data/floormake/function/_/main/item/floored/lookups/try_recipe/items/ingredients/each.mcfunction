#> floormake:_/main/item/floored/lookups/try_recipe/items/ingredients/each
#--------------------
# ../on
#--------------------

data modify storage floormake:_ t.floored.this_ingredient set from storage floormake:_ t.floored.ingredients[0]

# setup item check and condition macro:
data modify storage floormake:_ x.macro set value {}
execute if data storage floormake:_ t.floored.this_ingredient{id:false} run data modify storage floormake:_ x.macro.item_id set value "*"
execute unless data storage floormake:_ t.floored.this_ingredient{id:false} run data modify storage floormake:_ x.macro.item_id set from storage floormake:_ t.floored.this_ingredient.id
execute if data storage floormake:_ t.floored.this_ingredient.condition run data modify storage floormake:_ x.macro.condition set from storage floormake:_ t.floored.this_ingredient.condition
execute unless data storage floormake:_ t.floored.this_ingredient.condition run data modify storage floormake:_ x.macro.condition set value "scoreboard players set *x _floormake 1"

# check match:
execute store result score *x _floormake run function floormake:_/main/item/floored/lookups/try_recipe/items/ingredients/check_match with storage floormake:_ x.macro

# match:
execute store result storage floormake:_ x.macro.ingredient_index int 1 run scoreboard players get *floored.ingredient_index _floormake
data modify storage floormake:_ x.macro.guuid set from storage floormake:_ t.floored.item.guuid
execute if score *x _floormake matches 1.. run function floormake:_/main/item/floored/lookups/try_recipe/items/ingredients/match with storage floormake:_ x.macro

scoreboard players add *floored.ingredient_index _floormake 1
data remove storage floormake:_ t.floored.ingredients[0]
execute if data storage floormake:_ t.floored.ingredients[0] run function floormake:_/main/item/floored/lookups/try_recipe/items/ingredients/each
