-----------------------------------
-- Area: Fei'Yin
--  Mob: Hellish Weapon
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 716, 2, invaderXim.regime.type.GROUNDS)
end

return entity
