-----------------------------------
-- Abyssea Atma Fabricant
-----------------------------------
require('scripts/globals/abyssea')
-----------------------------------
xi = xi or {}
invaderXim.atmaFabricant = invaderXim.atmaFabricant or {}

invaderXim.atmaFabricant.onTrade = function(player, npc, trade)
end

invaderXim.atmaFabricant.onTrigger = function(player, npc)
    local ID = zones[player:getZoneID()]

    if not player:hasStatusEffect(invaderXim.effect.VISITANT) then
        player:messageSpecial(ID.text.NO_VISITANT_STATUS)
    else
        player:startEvent(2182)
    end
end

invaderXim.atmaFabricant.onEventUpdate = function(player, csid, option, npc)
end

invaderXim.atmaFabricant.onEventFinish = function(player, csid, option, npc)
end
