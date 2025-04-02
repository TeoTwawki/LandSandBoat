-----------------------------------
-- Area: Fei'Yin
--  Mob: Killing Weapon
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 716, 1, invaderXim.regime.type.GROUNDS)
end

return entity
