-----------------------------------
-- Area: North Gustaberg [S] (88)
--  NPC: Stonehoused_Adit
-- !pos -434.655 36.708 279.983 88
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.instance.onTrigger(player, npc, invaderXim.zones.RUHOTZ_SILVERMINES)
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.instance.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.instance.onEventFinish(player, csid, option, npc)
end

return entity
