-----------------------------------
-- Area: Den of Rancor
--  Mob: Mousse
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 797, 2, invaderXim.regime.type.GROUNDS)
end

return entity
