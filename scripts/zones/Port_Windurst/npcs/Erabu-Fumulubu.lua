-----------------------------------
-- Area: Port Windurst
--  NPC: Erabu-Fumulubu
-- Type: Fishing Synthesis Image Support
-- !pos -178.900 -2.789 76.200 240
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.crafting.oldImageSupportOnTrigger(player, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.crafting.oldImageSupportOnEventFinish(player, csid, option, npc)
end

return entity
