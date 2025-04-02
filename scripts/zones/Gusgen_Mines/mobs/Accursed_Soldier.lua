-----------------------------------
-- Area: Gusgen Mines
--  Mob: Accursed Soldier
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 679, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 680, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 685, 1, invaderXim.regime.type.GROUNDS)
end

return entity
