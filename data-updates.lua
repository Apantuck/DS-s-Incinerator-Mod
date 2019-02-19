-- DS's Incinerator Mod
-- Alex Pantuck, 2019
-- data-final-fixes.lua
-- to do: set every item without a fuel-category to "everything"

-- modify landfill tech to include garbage cube recipe
local landfill_tech = data.raw.item["landfill"]
landfill_tech.effects = {
      {
        type = "unlock-recipe",
        recipe = "landfill"
      },
      {
        type = "unlock-recipe",
        recipe = "garbage-landfill"
      }
}

data:extend{landfill_tech}