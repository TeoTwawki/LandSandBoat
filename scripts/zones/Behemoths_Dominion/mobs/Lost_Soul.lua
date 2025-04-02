-----------------------------------
-- Area: Behemoths Dominion
--  Mob: Lost Soul
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 103, 2, invaderXim.regime.type.FIELDS)
end

return entity
