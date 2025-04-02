-----------------------------------
-- Area: Fei'Yin
--  Mob: Vampire Bat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 711, 1, invaderXim.regime.type.GROUNDS)
end

return entity
