-----------------------------------
-- Area: Windurst Woods
--  NPC: Ronana
-- Type: Bonecraft Image Support
-- !pos -1.540 -6.25 -144.517 241
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
