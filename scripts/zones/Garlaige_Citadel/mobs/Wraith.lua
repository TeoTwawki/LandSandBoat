-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Wraith
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 708, 3, invaderXim.regime.type.GROUNDS)
end

return entity
