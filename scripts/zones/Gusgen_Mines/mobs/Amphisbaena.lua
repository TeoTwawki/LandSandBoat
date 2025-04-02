-----------------------------------
-- Area: Gusgen Mines
--  Mob: Amphisbaena
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 682, 2, invaderXim.regime.type.GROUNDS)
end

return entity
