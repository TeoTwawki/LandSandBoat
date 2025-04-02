-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Siege Bat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 704, 1, invaderXim.regime.type.GROUNDS)
end

return entity
