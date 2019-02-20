-- DS's Incinerator Mod
-- Alex Pantuck, 2019
-- incinerator.lua
-- Definition for garbage disposal technology

local garbage_tech = {
    type = "technology",
    name = "garbage-disposal",
    enabled = false,
    icon_size = 128,
    icon = "__base__/graphics/technology/steel-processing.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "incinerator"
      },
      {
        type = "unlock-recipe",
        recipe = "garbage-cube"
      },
      {
        type = "unlock-recipe",
        recipe = "methane-gas"
      },
      {
        type = "unlock-recipe",
        recipe = "gas-boiler"
      },
      {
        type = "unlock-recipe",
        recipe = "compressor"
      }
    },
    unit =
    {
      count = 50,
      ingredients = {{"science-pack-1", 10}},
      time = 5
    },
}

local glandfill = {
    type = "technology",
    name = "garbage-landfill",
    enabled = false,
    icon_size = 128,
    icon = "__base__/graphics/technology/steel-processing.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "garbage-landfill"
      }
    },
    unit =
    {
      count = 50,
      ingredients = {{"science-pack-1", 10}},
      time = 5
    },
    prerequisites = {"garbage-disposal", "landfill"}
}

data:extend(
{
  garbage_tech,
  glandfill
})