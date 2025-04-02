-----------------------------------
-- Area: Qufim Island (126)
--  NPC: Undulating Confluence
-- !pos -204.531 -20.027 75.318 126
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if player:getCurrentMission(invaderXim.mission.log_id.ROV) >= invaderXim.mission.id.rov.SET_FREE then
        player:startEvent(65)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 65 and option == 1 then
        invaderXim.teleport.to(player, invaderXim.teleport.id.ESCHA_ZITAH)
    end
end

return entity
