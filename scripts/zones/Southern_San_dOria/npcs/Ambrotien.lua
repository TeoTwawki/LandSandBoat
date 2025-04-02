-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Ambrotien
-- !pos 93.419 -0.001 -57.347 230
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if player:getCurrentMission(invaderXim.mission.log_id.SANDORIA) ~= invaderXim.mission.id.sandoria.NONE then
        player:startEvent(2008) -- Wrong Item
    else
        player:startEvent(2010) -- Mission not activated
    end
end

entity.onTrigger = function(player, npc)
    if player:getNation() ~= invaderXim.nation.SANDORIA then
        player:startEvent(2011) -- for Non-San d'Orians
    else
        local currentMission = player:getCurrentMission(invaderXim.mission.log_id.SANDORIA)

        if currentMission ~= invaderXim.mission.id.sandoria.NONE then
            player:startEvent(2001) -- Have mission already activated
        else
            local missionMask, repeatMask = invaderXim.mission.getMissionMask(player)
            player:startEvent(2009, missionMask, 0, 0 , 0 , 0 , repeatMask) -- Mission List
        end
    end
end

return entity
