-- DS's Incinerator Mod
-- Alex Pantuck, 2019
-- incinerator-entity.lua

------------------------------------------------------------
-- Incinerator

local incinerator = {
        type = "assembling-machine",
        name = "incinerator",
        icon = "__base__/graphics/icons/steel-furnace.png",
        icon_size = 32,
        flags = {
                "placeable-neutral", 
                "placeable-player", 
                "player-creation", 
                "not-rotatable",
                "not-flammable"
        },
        minable = {mining_time = 1, result = "incinerator"},
        max_health = 300,
        corpse = "medium-remnants",
        open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
        close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        working_sound = { sound = { filename = "__base__/sound/furnace.ogg" } },
        resistances = {{ type = "fire", percent = 100 }},
        collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
        selection_box = {{-0.8, -1}, {0.8, 1}},
        fast_replaceable_group = "assembling-machine",
        crafting_categories = {"crafting"},
        crafting_speed = 0.5,
        result_inventory_size = 1,
        source_inventory_size = 1,
        energy_source = {
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
        },
        energy_usage = "180kW",
        render_no_network_icon = false,
        ingredient_count = 1,
        fixed_recipe = "methane-gas",
        crafting_categories = {"compression"}
        animation = {
        layers = {
        {
                filename = "__base__/graphics/entity/steel-furnace/steel-furnace.png",
                priority = "high",
                width = 85,
                height = 87,
                frame_count = 1,
                shift = util.by_pixel(-1.5, 1.5),
                hr_version = {
                        filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace.png",
                        priority = "high",
                        width = 171,
                        height = 174,
                        frame_count = 1,
                        shift = util.by_pixel(-1.25, 2),
                        scale = 0.5
                }
        },
        {
                filename = "__base__/graphics/entity/steel-furnace/steel-furnace-shadow.png",
                priority = "high",
                width = 139,
                height = 43,
                frame_count = 1,
                draw_as_shadow = true,
                shift = util.by_pixel(39.5, 11.5),
                hr_version = {
                        filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-shadow.png",
                        priority = "high",
                        width = 277,
                        height = 85,
                        frame_count = 1,
                        draw_as_shadow = true,
                        shift = util.by_pixel(39.25, 11.25),
                        scale = 0.5
                }
        }
        }
        },
        working_visualisations = {
        {
                north_position = {0.0, 0.0},
                east_position = {0.0, 0.0},
                south_position = {0.0, 0.0},
                west_position = {0.0, 0.0},
                animation = {
                        filename = "__base__/graphics/entity/steel-furnace/steel-furnace-fire.png",
                        priority = "high",
                        line_length = 8,
                        width = 29,
                        height = 40,
                        frame_count = 48,
                        axially_symmetrical = false,
                        direction_count = 1,
                        shift = util.by_pixel(-0.5, 6),
                        hr_version = {
                                filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-fire.png",
                                priority = "high",
                                line_length = 8,
                                width = 57,
                                height = 81,
                                frame_count = 48,
                                axially_symmetrical = false,
                                direction_count = 1,
                                shift = util.by_pixel(-0.75, 5.75),
                                scale = 0.5
                        }
                },
                light = {intensity = 1, size = 1, color = {r = 1.0, g = 1.0, b = 1.0}}
        },
        {
                north_position = {0.0, 0.0},
                east_position = {0.0, 0.0},
                south_position = {0.0, 0.0},
                west_position = {0.0, 0.0},
                effect = "flicker", -- changes alpha based on energy source light intensity
                animation = {
                        filename = "__base__/graphics/entity/steel-furnace/steel-furnace-glow.png",
                        priority = "high",
                        width = 60,
                        height = 43,
                        frame_count = 1,
                        shift = {0.03125, 0.640625},
                        blend_mode = "additive"
                }
        },
        {
                north_position = {0.0, 0.0},
                east_position = {0.0, 0.0},
                south_position = {0.0, 0.0},
                west_position = {0.0, 0.0},
                effect = "flicker", -- changes alpha based on energy source light intensity
                animation = {
                        filename = "__base__/graphics/entity/steel-furnace/steel-furnace-working.png",
                        priority = "high",
                        line_length = 8,
                        width = 64,
                        height = 75,
                        frame_count = 1,
                        axially_symmetrical = false,
                        direction_count = 1,
                        shift = util.by_pixel(0, -4.5),
                        blend_mode = "additive",
                        hr_version = {
                                filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-working.png",
                                priority = "high",
                                line_length = 8,
                                width = 130,
                                height = 149,
                                frame_count = 1,
                                axially_symmetrical = false,
                                direction_count = 1,
                                shift = util.by_pixel(0, -4.25),
                                blend_mode = "additive",
                                scale = 0.5
                        }
                }
        }
        },
}

------------------------------------------------------------

data:extend({
        {incinerator}       
})