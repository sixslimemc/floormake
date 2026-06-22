#> floormake:_/main/item/floored/lookups/try_recipe/items/ingredients/check_match
#--------------------
# ./each
#--------------------

$execute unless items entity @s container.0 $(item_id) run return 0
$return run $(condition)

