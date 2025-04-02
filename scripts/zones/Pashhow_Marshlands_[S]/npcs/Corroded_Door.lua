-----------------------------------
-- Area: Pashhow Marshlands [S] (90)
--  NPC: Corroded Door
-- !pos -385.602 21.970 456.359 90
-----------------------------------
local ID = zones[invaderXim.zone.PASHHOW_MARSHLANDS_S]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if not invaderXim.instance.onTrigger(player, npc, invaderXim.zone.RUHOTZ_SILVERMINES) then
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY) -- TODO: confirm this
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.instance.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.instance.onEventFinish(player, csid, option, npc)
end

return entity
