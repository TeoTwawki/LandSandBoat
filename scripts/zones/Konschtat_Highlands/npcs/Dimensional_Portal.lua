-----------------------------------
-- Area: Konschtat Highlands
--  NPC: Dimensional_Portal
-- !pos 220.000 19.104 140.000 108
-----------------------------------
local ID = zones[invaderXim.zone.KONSCHTAT_HIGHLANDS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if player:getCurrentMission(invaderXim.mission.log_id.COP) > invaderXim.mission.id.cop.THE_WARRIORS_PATH then
        player:startEvent(915)
    else
        player:messageSpecial(ID.text.ALREADY_OBTAINED_TELE + 1) -- Telepoint Disappeared
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 915 and option == 1 then
        player:setPos(-635.599, -2.799, 163.8, 193, 33) -- To AlTaieu (R)
    end
end

return entity
