-----------------------------------
-- Area: Den of Rancor
--  Mob: Bullbeggar
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 803, 2, invaderXim.regime.type.GROUNDS)
end

return entity
