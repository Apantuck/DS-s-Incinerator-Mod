-- DS's Incinerator Mod
-- Alex Pantuck, 2019
-- incinerator.lua
-- Definition for garbage disposal technology

local garbage_tech = {
    type = "technology",
    name = "garbage-disposal",
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

data:extend{garbage_tech}