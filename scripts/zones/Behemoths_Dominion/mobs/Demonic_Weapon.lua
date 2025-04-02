-----------------------------------
-- Area: Behemoths Dominion
--  Mob: Demonic Weapon
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 102, 2, invaderXim.regime.type.FIELDS)
end

return entity
