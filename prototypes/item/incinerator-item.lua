-- DS's Incinerator Mod
-- Alex Pantuck, 2019
-- incinerator.lua
-- Definition items and recipes

------------------------------------------------------------------
-- Incinerator

local incinerator = {
    type = "item",
    name = "incinerator",
    subgroup = "production-machine",
    flags = { "goes-to-quickbar" },
    icon = "__base__/graphics/icons/steel-furnace.png",
    icon_size = 32,
    place_result = "incinerator",
    stack_size = 50
}

local inRecipe = {
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
        energy_required = 2,
        allow_decomposition = false,
        enabled = false
}

-------------------------------------------------------------------
-- Garbage cube

-- garbage cube item
local gCube = {
    type = "item",
    name = "garbage-cube",
    subgroup = "intermediate-product",
    flags = { "goes-to-main-inventory" },
    icon = nil, -- replace later
    icon_size = 32,
    place_result = "garbage wall",
    stack_size = 200
}

-- Compressor converts (nothing) into cube,
-- (but accepts anything as fuel)
local gCubeRecipe = {
    type = "recipe",
    name = "garbage-cube",
    category = "compression",
    subgroup = "intermediate-product",
    result = "garbage-cube",
    result_count = 1,
    ingredients = nil,
    allow_decomposition = false,
    energy_required = 2,
    always_show_made_in = true,
    enabled = false
}

local gLandfill = table.deepcopy(data.raw.recipe["landfill"])
gLandfill.ingredients = {"garbage-cube", 5}

-------------------------------------------------------
-- methane item/fluid

local methane = {
    type = "fluid",
    name = "methane-gas",
    fuel_category = "chemical",
    fuel_value = "12MJ"
}

local methRecipe = {
    type = "recipe",
    name = "methane",
    subgroup = "fluid-recipe",
    category = "compression",
    ingredients = {"garbage-cube", 5},
    allow_decomposition = false,
    result = {type = "fluid", name = "methane-gas", amount = 20},
    energy_required = 10,
    emissions_multiplier = 5,
    always_show_made_in = true,
    enabled = false
}

---------------------------------------------------------
-- Gas boiler

local gBoiler = {
    type = "item",
    name = "gas-boiler",
    subgroup = "energy",
    flags = { "goes-to-quickbar" },
    icon = "__base__/graphics/icons/boiler.png",
    icon_size = 32,
    place_result = "gas-boiler",
    stack_size = 50
}

local gBoilerRecipe = {
    type = "recipe",
    name = "gas-boiler",
    result_count = 1,
    result = "gas-boiler",
    energy_required = 3,
    ingredients = {{"stone-furnace", 1}, {"pipe", 4}},
    enabled = false
}

--------------------------------------------------------
-- Compressor

local compressor = {
    type = "item",
    name = "compressor",
    subgroup = "smelting-machine",
    flags = { "goes-to-quickbar" },
    icon = "__base__/graphics/icons/steel-furnace.png",
    icon_size = 32,
    place_result = "compressor",
    stack_size = 25
}

local compressorRecipe = {
    type = "recipe",
    name = "compressor",
    energy_required = 5,
    normal = {
            ingredients = {{"iron-plate", 15}, {"electronic-circuit", 1}},
            result = "compressor"
    },
    expensive = {
        ingredients = {{"iron-plate", 25}, {"electronic-circuit", 5}},
        result = "compressor"
    },
    enabled = false,
    result_count = 1,
    result = "compressor"
}

-----------------------------------------------------------------------

data:extend(
    {incinerator, inRecipe},
    {gCube, gCubeRecipe},
    {methane, methRecipe},
    {gBoiler, gBoilerRecipe},
    {compressor, compressorRecipe},
    {gLandfill}
)