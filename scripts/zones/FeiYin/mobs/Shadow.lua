-----------------------------------
-- Area: Fei'Yin
--  Mob: Shadow
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 712, 1, invaderXim.regime.type.GROUNDS)
end

return entity
