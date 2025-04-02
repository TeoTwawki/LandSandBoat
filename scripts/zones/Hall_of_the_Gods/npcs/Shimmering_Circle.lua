-----------------------------------
-- Area: Hall of the Gods
--  NPC: Shimmering Circle
-- Lifts players up to the sky!
-- !pos 0 -20 147 251
-----------------------------------
local ID = zones[invaderXim.zone.HALL_OF_THE_GODS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if player:getZPos() < 200 then
        if player:getCurrentMission(invaderXim.mission.log_id.ZILART) >= invaderXim.mission.id.zilart.THE_GATE_OF_THE_GODS then
            player:startEvent(10)
        else
            player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
        end
    else
        player:startEvent(11)
    end
end

return entity
