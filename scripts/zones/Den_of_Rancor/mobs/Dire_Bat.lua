-----------------------------------
-- Area: Den of Rancor
--  Mob: Dire Bat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 796, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 797, 1, invaderXim.regime.type.GROUNDS)
end

return entity
