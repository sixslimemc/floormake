# UTIL > floormake :_/util/ remove_recipe
# check_exists
#--------------------
# ./main
#--------------------

$data modify storage floormake:_ u.remove_recipe.existing_recipe set from storage floormake:data recipes[{pack_id:"$(pack_id)", id:"$(id)"}]

return run execute if data storage floormake:_ u.remove_recipe.existing_recipe