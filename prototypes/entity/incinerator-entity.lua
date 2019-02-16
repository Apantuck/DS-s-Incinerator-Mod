-- DS's Incinerator Mod
-- Alex Pantuck, 2019
-- incinerator-entity.lua
-- Definition of the incinerator entity
-- Effectively a steel chest that looks like a steel furnace

data:extend(
{
        {
                type = "container",
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
                fast_replaceable_group = "container",
                inventory_size = 1,
                enable_inventory_bar = false,
                emissions_per_tick = 0.01,
                picture = {
                        layers = 
                        {
                        {
                                filename = "__base__/graphics/entity/steel-furnace/steel-furnace.png",
                                priority = "high",
                                width = 85,
                                height = 87,
                                shift = util.by_pixel(-1.5, 1.5),
                                hr_version = {
                                        filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace.png",
                                        priority = "high",
                                        width = 171,
                                        height = 174,
                                        shift = util.by_pixel(-1.25, 2),
                                        scale = 0.5
                                }
                        },
                        {
                                filename = "__base__/graphics/entity/steel-furnace/steel-furnace-shadow.png",
                                priority = "high",
                                width = 139,
                                height = 43,
                                draw_as_shadow = true,
                                shift = util.by_pixel(39.5, 11.5),
                                hr_version = {
                                        filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-shadow.png",
                                        priority = "high",
                                        width = 277,
                                        height = 85,
                                        draw_as_shadow = true,
                                        shift = util.by_pixel(39.25, 11.25),
                                        scale = 0.5
                                }
                        }
                        }
                }
        }
}
)