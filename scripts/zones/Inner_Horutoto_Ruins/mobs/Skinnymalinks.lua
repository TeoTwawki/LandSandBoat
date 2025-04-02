-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Skinnymalinks
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 653, 2, invaderXim.regime.type.GROUNDS)
end

return entity
