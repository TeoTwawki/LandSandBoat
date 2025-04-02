-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Dire Bat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 809, 2, invaderXim.regime.type.GROUNDS)
end

return entity
