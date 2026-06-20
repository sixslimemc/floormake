# IMPL > floormake : api/register
# recipes/ingredients/each
#--------------------
# ../register
#--------------------
scoreboard players remove *register.ingredient_index _floormake 1

data modify storage floormake:_ v.register.this_ingredient set from storage floormake:_ v.register.ingredients[-1]

# set *.is_dynamic:
execute store success score *register.is_dynamic _floormake if data storage floormake:_ v.register.this_ingredient{id:false}

# make entry:
data modify storage floormake:_ v.register.entry set value {recipe_index:0, ingredient_index:0}
data modify storage floormake:_ v.register.entry.self_condition set from storage floormake:_ v.register.this_ingredient.condition
execute store result storage floormake:_ v.register.entry.recipe_index int 1 run scoreboard players get *register.recipe_index _floormake
execute store result storage floormake:_ v.register.entry.ingredient_index int 1 run scoreboard players get *register.ingredient_index _floormake

# set id map if not dynamic:
execute if score *register.is_dynamic _floormake matches 0 run function floormake:_/impl/api/register/recipes/ingredients/set_id_map with storage floormake:_ v.register.this_ingredient

# add to dynamic ingredients if dynamic:
execute if score *register.is_dynamic _floormake matches 1 run data modify storage floormake:_ data.dynamic_ingredients append from storage floormake:_ v.register.entry

data remove storage floormake:_ v.register.ingredients[-1]
execute if data storage floormake:_ v.register.ingredients[0] run function floormake:_/impl/api/register/recipes/ingredients/each
