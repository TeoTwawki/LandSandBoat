-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Grilau
-- !pos -241.987 6.999 57.887 231
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if player:getCurrentMission(invaderXim.mission.log_id.SANDORIA) ~= invaderXim.mission.id.sandoria.NONE then
        player:startEvent(1008) -- Wrong Item
    else
        player:startEvent(1010) -- Mission not activated
    end
end

entity.onTrigger = function(player, npc)
    if player:getNation() ~= invaderXim.nation.SANDORIA then
        player:startEvent(1011) -- for Non-San d'Orians
    else
        local currentMission = player:getCurrentMission(invaderXim.mission.log_id.SANDORIA)

        if currentMission ~= invaderXim.mission.id.sandoria.NONE then
            player:startEvent(1001) -- Have mission already activated
        else
            local missionMask, repeatMask = invaderXim.mission.getMissionMask(player)
            player:startEvent(1009, missionMask, 0, 0 , 0 , 0 , repeatMask) -- Mission List
        end
    end
end

return entity
