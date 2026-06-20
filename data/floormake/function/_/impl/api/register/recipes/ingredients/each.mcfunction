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
data modify storage floormake:_ v.register.entry set value {recipe:{}, self_index:0}
data modify storage floormake:_ v.register.entry.recipe set from storage floormake:_ v.register.this_recipe
data modify storage floormake:_ v.register.entry.self_condition set from storage floormake:_ v.register.this_ingredient.condition
execute store result storage floormake:_ v.register.entry.self_index int 1 run scoreboard players get *register.ingredient_index _floormake

# set id map if not dynamic:
data modify storage floormake:_ x.macro set from storage floormake:_ v.register.this_recipe
data modify storage floormake:_ x.macro.id set from storage floormake:_ v.register.this_ingredient.id
execute if score *register.is_dynamic _floormake matches 0 run function floormake:_/impl/api/register/recipes/ingredients/set_id_map with storage floormake:_ x.macro

# add to dynamic ingredients if dynamic:


data remove storage floormake:_ v.register.ingredients[-1]
execute if data storage floormake:_ v.register.ingredients[0] run function floormake:_/impl/api/register/recipes/ingredients/each
