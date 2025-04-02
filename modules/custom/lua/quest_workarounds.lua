-----------------------------------
-- This module is a compilation of overrides to temporarily fix
-- parts of quests that are not currently fully functional due to something
-- larger (like a system) not being implemented/operable.
-----------------------------------
-- Include the following:
-- - Explanation of what quest(s) needs temporary fix
-- - Link to issue reported on IXIM
-- - Explanation (if known) of how to fix
-- - Include a TODO so it can be searched.
-----------------------------------
require('modules/module_utils')
-----------------------------------
local m = Module:new('quest_workarounds')
-----------------------------------

m:addOverride('invaderXim.server.onServerStart', function()
    super()

    -- Bastok zones don't currently produce NONE weather, so we are adding SUNSHINE as an accepted weather so the quest becomes completable.
    -- See: https://github.com/InvaderXim/server/pull/5831
    invaderXim.module.modifyInteractionEntry('scripts/quests/bastok/Wish_Upon_a_Star', function(quest)
        quest.sections[2][invaderXim.zone.BASTOK_MARKETS]['Enu'].onTrade = function(player, npc, trade)
        local isNight = VanadielTOTD() == invaderXim.time.NIGHT or VanadielTOTD() == invaderXim.time.MIDNIGHT
            if npcUtil.tradeHasExactly(trade, invaderXim.item.FALLEN_STAR) then
                if
                    player:getWeather() == invaderXim.weather.NONE or
                    player:getWeather() == invaderXim.weather.SUNSHINE and
                    isNight
                then
                    return quest:progressEvent(334)
                else
                    return quest:event(337)
                end
            end
        end
    end)
end)

return m
