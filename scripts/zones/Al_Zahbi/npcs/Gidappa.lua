-----------------------------------
-- Area: Al Zahbi
--  NPC: Gidappa
-- Type: Clothcraft Normal/Adv. Image Support
-- !pos 70.228 -7 -54.089 48
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
