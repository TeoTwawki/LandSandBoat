-----------------------------------
-- Area: Port Windurst
--  NPC: Panja-Nanja
-- Type: Fishing Adv. Image Support
-- !pos -194.499 -3 58.692 240
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
