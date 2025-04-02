-----------------------------------
-- Area: Bastok Mines
--  NPC: Rashid
-- Type: Mission Giver
-- !pos -8.444 -2 -123.575 234
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
