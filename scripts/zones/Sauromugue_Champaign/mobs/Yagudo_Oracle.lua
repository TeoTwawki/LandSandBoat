-----------------------------------
-- Area: Sauromugue Champaign
--  Mob: Yagudo Oracle
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 99, 2, invaderXim.regime.type.FIELDS)
end

return entity
