-----------------------------------
-- Area: Al Zahbi
--  NPC: Zwaluh
-- Type: Leathercraft Normal/Adv. Image Support
-- !pos -71.556 -6.999 -103.015 48
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.crafting.ahtUhrganImageSupportOnTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    invaderXim.crafting.ahtUhrganImageSupportOnTrigger(player, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.crafting.ahtUhrganImageSupportOnEventFinish(player, csid, option, npc)
end

return entity
