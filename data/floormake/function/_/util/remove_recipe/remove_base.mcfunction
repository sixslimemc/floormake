# UTIL > floormake :_/util/ remove_recipe
# remove_base
#--------------------
# ./main
#--------------------

$data remove storage floormake:data recipes[{pack_id:"$(pack_id)", id:"$(id)"}]
$data remove storage floormake:_ data.dynamic_ingredients[{recipe:{pack_id:"$(pack_id)", id:"$(id)"}}]