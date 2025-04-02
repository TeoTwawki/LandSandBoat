-----------------------------------
-- Area: Sauromugue Champaign
--  Mob: Sauromugue Skink
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 97, 1, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 99, 1, invaderXim.regime.type.FIELDS)
end

return entity
