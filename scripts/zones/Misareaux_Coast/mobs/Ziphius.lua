-----------------------------------
-- Area: Misareaux Coast
--   NM: Ziphius
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 445)
end

return entity
