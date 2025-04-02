-----------------------------------
-- Area: Dangruf Wadi
--  Mob: Wadi Leech
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 641, 2, invaderXim.regime.type.GROUNDS)
end

return entity
