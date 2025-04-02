-----------------------------------
-- Door
-- 7th Floor Door to Boss
-- !pos -340 -6 520
-----------------------------------
-----------------------------------

---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.salvage.openBossDoor(npc)
end

return entity
