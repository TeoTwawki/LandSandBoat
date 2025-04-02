-----------------------------------
-- Area: Qulun Dome
--  NPC: Door
-- Involved in Mission: Magicite
-- !pos 60 24 -2 148
-----------------------------------
local ID = zones[invaderXim.zone.QULUN_DOME]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if
        player:hasKeyItem(invaderXim.ki.SILVER_BELL) and
        player:hasKeyItem(invaderXim.ki.CORUSCANT_ROSARY) and
        player:hasKeyItem(invaderXim.ki.BLACK_MATINEE_NECKLACE)
    then
        if player:getZPos() < -7.2 then
            player:startEvent(51)
        else
            -- This event automatically handles the distance check
            player:startEvent(50)
        end
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if (csid == 50 or csid == 51) and option == 1 then
        player:messageSpecial(ID.text.THE_3_ITEMS_GLOW_FAINTLY, invaderXim.ki.SILVER_BELL, invaderXim.ki.CORUSCANT_ROSARY, invaderXim.ki.BLACK_MATINEE_NECKLACE)
    end
end

return entity
