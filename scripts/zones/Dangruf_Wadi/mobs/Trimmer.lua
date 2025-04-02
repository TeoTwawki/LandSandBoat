-----------------------------------
-- Area: Dangruf Wadi
--  Mob: Trimmer
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 646, 1, invaderXim.regime.type.GROUNDS)
end

return entity
