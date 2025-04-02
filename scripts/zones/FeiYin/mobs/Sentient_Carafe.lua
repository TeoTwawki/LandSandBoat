-----------------------------------
-- Area: Fei'Yin
--  Mob: Sentient Carafe
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 718, 2, invaderXim.regime.type.GROUNDS)
end

return entity
