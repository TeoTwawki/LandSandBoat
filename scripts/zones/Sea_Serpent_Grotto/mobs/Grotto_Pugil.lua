-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Grotto Pugil
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 808, 2, invaderXim.regime.type.GROUNDS)
end

return entity
