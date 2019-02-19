-- DS's Incinerator Mod
-- Alex Pantuck, 2019
-- incinerator-entity.lua

------------------------------------------------------------
-- Incinerator

local incinerator = table.deepcopy(data.raw.furnace["steel-furnace"])
incinerator.name = "incinerator"
incinerator.crafting_categories = {"compression"}
incinerator.render_no_network_icon = false
incinerator.ingredient_count = 1
incinerator.fixed_recipe = "methane-gas"
incinerator.energy_source = {
        type = "burner",
        fuel_category = "chemical",
        effectivity = 1,
        usage_priority = "secondary-input",
        emissions = 0.05,
        fuel_inventory_size = 1,
        smoke = {
                {
                        name = "smoke",
                        frequency = 10,
                        position = {0.7, -1.2},
                        starting_vertical_speed = 0.08,
                        starting_frame_deviation = 60
                }
        }
}
incinerator.result_inventory_size = 1
incinerator.source_inventory_size = 1
incinerator.minable = {mining_time = 1, result = "incinerator"}

------------------------------------------------------------




-----------------------------------------------------------

data:extend{incinerator}