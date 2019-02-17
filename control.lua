-- DS's Incinerator Mod
-- Alex Pantuck, 2019
-- control.lua
-- Implementation of incinerator behaviour

script.on_init(
        function()
                -- Initialize list of incinerators
                global.Incinerators = {}
        end
)
--test
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

-- Every few ticks, go through list of incinerators. For each stack of items in each incinerator,
-- remove 1 item (then re-sort and merge the inventory).
script.on_event({defines.events.on_tick},
        function(e)
                if (e.tick % 5) ~= 0 then return end
                for index,incinerator in pairs(global.Incinerators) do
                        if incinerator.valid then
                                local inv = incinerator.get_inventory(defines.inventory.chest)
                                local itemStacks = inv.get_contents()
                                for name,numItem in pairs(itemStacks) do
                                        inv.remove({name = name, count=1})
                                end
                                inv.sort_and_merge()
                        end
                end
        end
)