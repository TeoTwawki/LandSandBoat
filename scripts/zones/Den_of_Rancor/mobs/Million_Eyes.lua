-----------------------------------
-- Area: Den of Rancor
--  Mob: Million Eyes
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 800, 1, invaderXim.regime.type.GROUNDS)
end

return entity
