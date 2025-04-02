-----------------------------------
-- Area: Sauromugue Champaign
--  Mob: Diving Beetle
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 40, 2, invaderXim.regime.type.FIELDS)
end

return entity
