-- DS's Incinerator Mod
-- Alex Pantuck, 2019
-- incinerator-entity.lua

------------------------------------------------------------
-- Incinerator

local incinerator_entity = table.deepcopy(data.raw.furnace["steel-furnace"])
incinerator_entity.name = "incinerator"
incinerator_entity.type = "assembling-machine"
incinerator_entity.crafting_categories = {"compression"}
incinerator_entity.render_no_network_icon = false
incinerator_entity.ingredient_count = 1
incinerator_entity.fixed_recipe = "methane-gas"
incinerator_entity.energy_source = {
        type = "burner",
        fuel_category = "chemical",
        effectivity = 1,
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
incinerator_entity.result_inventory_size = nil
incinerator_entity.source_inventory_size = nil
incinerator_entity.minable = {mining_time = 1, result = "incinerator"}

------------------------------------------------------------
-- Compressor

local compressor_entity = table.deepcopy(data.raw.furnace["steel-furnace"])
compressor_entity.name = "compressor"
compressor_entity.crafting_categories = {"compression"}
compressor_entity.result_inventory_size = 1
compressor_entity.source_inventory_size = 0
compressor_entity.energy_source = {
        type = "burner",
        effectivity = 1,
        emissions = 0.005,
        fuel_inventory_size = 1,
        fuel_categories = {"compressable", "chemical", "nuclear"}
}
compressor_entity.fluid_boxes = {
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }},
        secondary_draw_orders = { north = -1 }
      },
      off_when_no_fluid_recipe = false
}

-----------------------------------------------------------
-- Gas boiler


-----------------------------------------------------------
-- garbage wall



---------------------------------------------------------
data:extend(
        {
                incinerator_entity,
                compressor_entity
        }
)