-----------------------------------
-- Area: East Ronfaure
--  Mob: Orcish Mesmerizer
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 67, 1, invaderXim.regime.type.FIELDS)
end

return entity
