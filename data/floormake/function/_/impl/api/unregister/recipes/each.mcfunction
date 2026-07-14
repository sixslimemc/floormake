# IMPL > floormake : api/unregister
# recipes/each
#--------------------
# ../main
#--------------------

data modify storage floormake:_/in remove_recipe set from storage floormake:in unregister.recipes[-1]
function floormake:_/util/remove_recipe/main

data remove storage floormake:in unregister.recipes[-1]
execute if data storage floormake:in unregister.recipes[0] run function floormake:_/impl/api/unregister/recipes/each