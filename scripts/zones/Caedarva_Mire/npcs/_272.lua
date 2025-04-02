-----------------------------------
-- Area: Caedarva Mire
-- Door: Runic Seal
-- !pos 486 -23 -500 79
-----------------------------------
local ID = zones[invaderXim.zone.CAEDARVA_MIRE]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if not invaderXim.instance.onTrigger(player, npc, invaderXim.zone.LEUJAOAM_SANCTUM) then
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.assault.onAssaultUpdate(player, csid, option, npc)
    invaderXim.instance.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.instance.onEventFinish(player, csid, option, npc)
end

return entity
