# IMPL > floormake : api/register
# recipes/ingredients/set_id_map
#--------------------
# ./each
#--------------------

# set *.is_dynamic:
execute store success score *register.is_dynamic _floormake if data storage floormake:_ v.register.this_ingredient{id:false}

# remove existing:
$data remove storage floormake:_ data.ingredient_map."$(id)"[{recipe:{pack_id:"$(pack_id)", id:"$(id)"}}]

# make entry:
data modify storage floormake:_ x.entry set value {recipe:{}, self_index:0}
data modify storage floormake:_ x.entry.recipe set from storage floormake:_ v.register.this_recipe
execute store result storage floormake:_ x.entry.self_index int 1 run scoreboard players get *register.ingredient_index _floormake