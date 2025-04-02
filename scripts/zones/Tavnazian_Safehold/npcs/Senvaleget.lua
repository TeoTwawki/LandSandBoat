-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Senvaleget
-- !pos -103 -26 -49 26
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if player:hasCompletedMission(invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.DARKNESS_NAMED) then
        player:sendMenu(invaderXim.menuType.AUCTION)
    -- Else 10918
    end
end

return entity
