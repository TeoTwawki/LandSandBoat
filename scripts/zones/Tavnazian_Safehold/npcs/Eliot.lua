-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Eliot
-- !pos -103 -26 -49 26
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if player:hasCompletedMission(invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.DARKNESS_NAMED) then
        player:sendMenu(invaderXim.menuType.AUCTION)
    -- TODO: Else 10916
    end
end

return entity
