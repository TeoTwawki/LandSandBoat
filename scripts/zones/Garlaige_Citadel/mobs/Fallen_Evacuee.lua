-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Fallen Evacuee
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 703, 2, invaderXim.regime.type.GROUNDS)
end

return entity
