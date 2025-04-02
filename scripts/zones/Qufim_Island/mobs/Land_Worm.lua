-----------------------------------
-- Area: Qufim Island
--  Mob: Land Worm
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 41, 2, invaderXim.regime.type.FIELDS)
end

return entity
