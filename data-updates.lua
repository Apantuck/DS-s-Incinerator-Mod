-- DS's Incinerator Mod
-- Alex Pantuck, 2019
-- data-final-fixes.lua
-- to do: set every item without a fuel-category to "everything"

-- modify landfill tech to include garbage cube recipe
local landfill = table.deepcopy(data.raw.item["landfill"])
landfill.effects = {
      {
        type = "unlock-recipe",
        recipe = "landfill"
      },
      {
        type = "unlock-recipe",
        recipe = "garbage-landfill"
      }
}