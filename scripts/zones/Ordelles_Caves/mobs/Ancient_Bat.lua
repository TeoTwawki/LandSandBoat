-----------------------------------
-- Area: Ordelle's Caves
--  Mob: Ancient Bat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 659, 1, invaderXim.regime.type.GROUNDS)
end

return entity
