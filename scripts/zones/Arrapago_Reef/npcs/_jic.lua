-----------------------------------
-- Area: Arrapago Reef
-- Door: Runic Seal
-- !pos 36 -10 620 54
-----------------------------------
local ID = zones[invaderXim.zone.ARRAPAGO_REEF]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if not invaderXim.instance.onTrigger(player, npc, invaderXim.zone.ILRUSI_ATOLL) then
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.assault.onAssaultUpdate(player, csid, option)
    invaderXim.instance.onEventUpdate(player, csid, option)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.instance.onEventFinish(player, csid, option)
end

return entity
