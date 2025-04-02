-----------------------------------
-- Area: Ordelle's Caves
--  Mob: Shrieker
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 656, 2, invaderXim.regime.type.GROUNDS)
end

return entity
