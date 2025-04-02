-----------------------------------
-- Area: Port Windurst
--  NPC: Thubu Parohren
-- Type: Fishing Guild Master
-- !pos -182.230 -3.835 61.373 240
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.crafting.guildMasterOnTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    invaderXim.crafting.guildMasterOnTrigger(player, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.crafting.guildMasterOnEventFinish(player, csid, option, npc)
end

return entity
