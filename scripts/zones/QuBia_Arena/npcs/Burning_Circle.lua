-----------------------------------
-- Area: Qu'Bia Arena
--  NPC: Burning Circle
-- !pos -221 -24 19 206
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    -- if player:hasKeyItem(invaderXim.ki.MARK_OF_SEED) and player:getCurrentMission(invaderXim.mission.log_id.ACP) == invaderXim.mission.id.acp.THOSE_WHO_LURK_IN_SHADOWS_II then
    --     player:startEvent(5)
    -- Temp disabled pending fixes for the BCNM mobs.
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 5 then
        player:completeMission(invaderXim.mission.log_id.ACP, invaderXim.mission.id.acp.THOSE_WHO_LURK_IN_SHADOWS_II)
        player:addMission(invaderXim.mission.log_id.ACP, invaderXim.mission.id.acp.THOSE_WHO_LURK_IN_SHADOWS_III)
    end
end

return entity
