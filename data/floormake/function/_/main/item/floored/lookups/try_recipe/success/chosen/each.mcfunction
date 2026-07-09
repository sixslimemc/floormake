#> floormake:_/main/item/floored/lookups/try_recipe/success/chosen/each
#--------------------
# ../do
#--------------------
# forward iter

data modify storage floormake:_ t.floored.this_chosen set from storage floormake:_ t.floored.eval_chosen[0]

# *.consume_item flag:
data modify storage floormake:_ x set from storage floormake:_ t.floored.eval_ingredients[0]
execute store success score *floored.consume_item _floormake if data storage floormake:_ x{is_consumed:true}

execute if data storage floormake:_ t.floored.this_chosen.items[0] run function floormake:_/main/item/floored/lookups/try_recipe/success/chosen/items/each

scoreboard players add *floored.ingredient_index _floormake 1
data remove storage floormake:_ t.floored.eval_chosen[0]
data remove storage floormake:_ t.floored.eval_ingredients[0]
execute if data storage floormake:_ t.floored.eval_chosen[0] run function floormake:_/main/item/floored/lookups/try_recipe/success/chosen/each