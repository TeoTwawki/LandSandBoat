-----------------------------------
-- Area: Gusgen Mines
--  Mob: Madfly
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 686, 2, invaderXim.regime.type.GROUNDS)
end

return entity
