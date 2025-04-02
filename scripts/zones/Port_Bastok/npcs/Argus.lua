-----------------------------------
-- Area: Port Bastok
--  NPC: Argus
-- Type: Mission Giver
-- !pos 132.157 7.496 -2.187 236
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if player:getNation() ~= invaderXim.nation.BASTOK then
        player:startEvent(1003) -- For non-Bastokian
    else
        local currentMission = player:getCurrentMission(invaderXim.mission.log_id.BASTOK)

        if currentMission ~= invaderXim.mission.id.bastok.NONE then
            player:startEvent(1002) -- Have mission already activated
        else
            local flagMission, repeatMission = invaderXim.mission.getMissionMask(player)
            player:startEvent(1001, flagMission, 0, 0, 0, 0, repeatMission) -- Mission List
        end
    end
end

return entity
