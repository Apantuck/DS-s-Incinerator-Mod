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
        filter = "methane-gas",
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
local gBoilerEntity = table.deepcopy(data.raw.boiler["boiler"])
gBoilerEntity.fluid_boxes = {
        -- input/output water
        {
                base_area = 1,
                height = 2,
                base_level = -1,
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                {type = "input-output", position = {-2, 0.5}},
                {type = "input-output", position = {2, 0.5}}
                },
                production_type = "input-output",
                filter = "water"
        },
        -- output steam
        {
                base_area = 1,
                height = 2,
                base_level = 1,
                pipe_covers = pipecoverspictures(),
                pipe_connections =
                {
                {type = "output", position = {0, -1.5}}
                },
                production_type = "output",
                filter = "steam"
        },
        -- input methane
        {
                base_area = 1,
                height = 2,
                base_level = 1,
                pipe_covers = pipecoverspictures(),
                pipe_connections = {
                {type = "input", position = {0, 1.5}}
                },
                production_type = "input",
                filter = "methane-gas"
        }
}

-----------------------------------------------------------
-- garbage wall

local garbage_wall = table.deepcopy(data.raw.wall[stone-wall])
garbage_wall.name = "garbage-wall"
garbage_wall.emissions_per_tick = 0.001

---------------------------------------------------------
data:extend(
        {
                incinerator_entity,
                compressor_entity,
                gBoilerEntity,
                garbage_wall
        }
)