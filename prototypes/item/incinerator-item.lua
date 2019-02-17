-- DS's Incinerator Mod
-- Alex Pantuck, 2019
-- incinerator.lua
-- Definition of the incinerator item and recipe
-- Effectively a steel chest that looks like a steel furnace

-- item characteristics:

local incinerator = {
    type = "item",
    name = "incinerator",
    icon = "__base__/graphics/icons/steel-furnace.png",
    icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "storage",
    order = "a[items]-c[steel-chest]",
    place_result = "incinerator",
    stack_size = 50
}

-- Item Recipe

local recipe = {
        type = "recipe",
        name = "incinerator",
        normal = {
            ingredients = {{"raw-wood", 5}, {"iron-plate", 25}},
            result = "incinerator"
        },
        expensive = {
            ingredients = {{"coal", 15}, {"iron-plate", 50}},
            result = "incinerator"
        },
        result_count = 1,
        energy_required = 3,
        allow_decomposition = false,
        enabled = true
}

data:extend{incinerator,recipe}