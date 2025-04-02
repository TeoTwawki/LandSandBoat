-----------------------------------
-- Area: Ve'Lugannon Palace
--  Mob: Caretaker
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 743, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 746, 1, invaderXim.regime.type.GROUNDS)
end

return entity
