-----------------------------------
-- Area: Gusgen Mines
--  Mob: Rockmill
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 685, 2, invaderXim.regime.type.GROUNDS)
end

return entity
