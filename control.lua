-- DS's Incinerator Mod
-- Alex Pantuck, 2019
-- control.lua
-- Implementation of incinerator behaviour


-- Initialize the list of incinerators
-- (Incinerators are indexed by their entity.unit_number)
script.on_init(
        function()
                global.Incinerators = {}
        end
)

-- When an incinerator is placed, add it to the list of incinerators
script.on_event({defines.events.on_built_entity, defines.events.on_robot_built_entity},
        function(e)
                local entity = e.created_entity
                if entity.name== "incinerator" then
                        local index = entity.unit_number
                        global.Incinerators[index] = entity
                end
        end
)

-- When an incinerator is destroyed, remove it from list of incinerators
script.on_event({on_robot_mined_entity, on_player_mined_entity, on_entity_died},
        function(e)
                local destroyed = e.entity
                if destroyed.name== "incinerator" then
                        local index = destroyed.unit_number
                        global.Incinerators[index] = nil
                end
        end
)

-- Every 20 ticks, clear the incinerator inv
script.on_event({defines.events.on_tick},
        function(e)
                if not (e.tick%20)== 0 then return end
                for index,incinerator in pairs(global.Incinerators) do
                        if incinerator.valid then
                                incinerator.clear_items_inside()
                        end
                end
        end
)