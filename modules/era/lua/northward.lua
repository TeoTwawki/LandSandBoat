-----------------------------------
-- Module to remove exp and gil from 'Northward' quest reward.
-- Gil and exp were added to the quest reward in 2017 so they are removed here. https://ffxiclopedia.fandom.com/wiki/Northward
-----------------------------------
require('modules/module_utils')
-----------------------------------
local m = Module:new('era_quest_northward')

m:addOverride('invaderXim.server.onServerStart', function()
    super()

    invaderXim.module.modifyInteractionEntry('scripts/quests/jeuno/Northward', function(quest)
        quest.reward = {
            fame     = 30,
            fameArea = invaderXim.fameArea.JEUNO,
            keyItem  = invaderXim.ki.MAP_OF_CASTLE_ZVAHL,
            title    = invaderXim.title.ENVOY_TO_THE_NORTH,
        }
    end)
end)

return m
