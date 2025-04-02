-----------------------------------
-- Area: Bhaflau Thickets
-- Door: Heavy Iron Gate
-- !pos -180 -10 -758 52
-----------------------------------
local ID = zones[invaderXim.zone.BHAFLAU_THICKETS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if player:checkDistance(npc) < 3 then
        if player:getZPos() > -761 then
            player:messageSpecial(ID.text.STAGING_GATE_MAMOOL)
            player:messageSpecial(ID.text.STAGING_GATE_INTERACT)
            player:startOptionalCutscene(106)
        elseif not player:hasKeyItem(invaderXim.ki.MAMOOL_JA_ASSAULT_ORDERS) then
            player:messageSpecial(ID.text.STAGING_GATE_MAMOOL)
            player:messageSpecial(ID.text.STAGING_GATE_INTERACT)
            player:startEvent(107)
        else
            player:messageSpecial(ID.text.CANNOT_LEAVE, invaderXim.ki.MAMOOL_JA_ASSAULT_ORDERS)
        end
    else
        player:messageSpecial(ID.text.STAGING_GATE_CLOSER)
    end
end

return entity
