# UTIL > floormake :_/util/ remove_recipe
# ingredients/each
#--------------------
# ../main
#--------------------

data modify storage floormake:_ u.remove_recipe.this_ingredient set from storage floormake:_ u.remove_recipe.ingredients[-1]

execute store success score *remove_recipe.is_dynamic _floormake if data storage floormake:_ u.remove_recipe.this_ingredient{id:false}

data modify storage floormake:_ x.macro set from storage floormake:_ u.remove_recipe.existing_recipe
data modify storage floormake:_ x.macro.item_id set from storage floormake:_ u.remove_recipe.this_ingredient.id
execute if score *remove_recipe.is_dynamic _floormake matches 0 run function floormake:_/util/remove_recipe/ingredients/remove_id_map with storage floormake:_ x.macro

data remove storage floormake:_ u.remove_recipe.ingredients[-1]
execute if data storage floormake:_ u.remove_recipe.ingredients[0] run function floormake:_/util/remove_recipe/ingredients/each