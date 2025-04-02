-----------------------------------
-- Area: Bhaflau Thickets
-- Door: Runic Seal
-- !pos -180 -6.8 -833 52
-----------------------------------
local ID = zones[invaderXim.zone.BHAFLAU_THICKETS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if not invaderXim.instance.onTrigger(player, npc, invaderXim.zone.MAMOOL_JA_TRAINING_GROUNDS) then
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
