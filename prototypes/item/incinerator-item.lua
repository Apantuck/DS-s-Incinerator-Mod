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
-- places garbage-wall entity (aka stone-wall for now)
local gCube = {
    type = "item",
    name = "garbage-cube",
    subgroup = "intermediate-product",
    flags = { "goes-to-main-inventory" },
    icon = "__base__/graphics/icons/landfill.png",
    icon_size = 32,
    place_result = "garbage-wall",
    stack_size = 200
}

-- garbage cube recipe
-- made in compressor.
-- turns nothing into cube, but takes fuel.
-- Takes anything as fuel
local gCubeRecipe = {
    type = "recipe",
    name = "garbage-cube",
    category = "compression",
    subgroup = "intermediate-product",
    result = "garbage-cube",
    result_count = 1,
    ingredients = {},
    allow_decomposition = false,
    energy_required = 2,
    always_show_made_in = true,
    enabled = false
}

-- Alt landfill recipe that takes garbage cubes
local gLandfill = table.deepcopy(data.raw.recipe["landfill"])
gLandfill.name = "garbage-landfill"
gLandfill.ingredients = {"garbage-cube", 5}
gLandfill.normal = {
    ingredients = {{"garbage-cube", 5}},
    result = "landfill"
}
gLandfill.expensive = {
    ingredients = {{"garbage-cube", 10}},
    result = "landfill"
}

-------------------------------------------------------
-- methane item/fluid

local methane = {
    type = "fluid",
    name = "methane-gas",
    subgroup = "fluid",
    default_temperature = 15,
    max_temperature = 1000,
    heat_capacity = "0.2KJ",
    icon = "__base__/graphics/icons/fluid/steam.png",
    icon_size = 32,
    base_color = {r=0.5, g=0.5, b=0.5},
    flow_color = {r=1.0, g=1.0, b=1.0},
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    gas_temperature = 15,
    auto_barrel = false,
    fuel_category = "chemical",
    fuel_value = "12MJ"
}

local methRecipe = {
    type = "recipe",
    name = "methane-gas",
    subgroup = "fluid-recipes",
    category = "incineration",
    normal = {
        ingredients = {{"garbage-cube", 5}},
        results = {{type = "fluid", name = "methane-gas", amount = 20}}
    },
    allow_decomposition = false,
    energy_required = 100,
    emissions_multiplier = 5,
    always_show_made_in = true,
    enabled = false,
    hidden = true
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
    {
        incinerator, 
        inRecipe, 
        gCube, 
        gCubeRecipe,
        gLandfill,
        methane, 
        methRecipe,
        gBoiler, 
        gBoilerRecipe,
        compressor, 
        compressorRecipe
    }
)