# IMPL > floormake : api/register
# recipes/ingredients/set_id_map
#--------------------
# ./each
#--------------------

$data modify storage floormake:_ data.ingredient_map."$(id)" append from storage floormake:_ v.register.entry