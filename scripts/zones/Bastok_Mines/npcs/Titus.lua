-----------------------------------
-- Area: Bastok Mines
--  NPC: Titus
-- Alchemy Synthesis Image Support
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
