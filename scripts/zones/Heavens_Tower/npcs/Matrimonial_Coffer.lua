-----------------------------------
-- Area: Heavens Tower
--  NPC: Matrimonial Coffer
-- !pos -5.955 0.249 24.360 242
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.matrimonialcoffer.startEvent(player)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.matrimonialcoffer.finishEvent(player, csid, option, npc)
end

return entity
