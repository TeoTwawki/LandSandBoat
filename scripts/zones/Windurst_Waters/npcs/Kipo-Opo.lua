-----------------------------------
-- Area: Windurst Waters
--  NPC: Kipo-Opo
-- Type: Cooking Adv. Image Support
-- !pos -119.750 -5.239 64.500 238
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
