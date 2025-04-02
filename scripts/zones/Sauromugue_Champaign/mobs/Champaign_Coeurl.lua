-----------------------------------
-- Area: Sauromugue Champaign
--  Mob: Champaign Coeurl
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 98, 1, invaderXim.regime.type.FIELDS)
end

return entity
