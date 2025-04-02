-----------------------------------
-- Area: Batallia Downs
--  Mob: Orcish Nightraider
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 74, 3, invaderXim.regime.type.FIELDS)
end

return entity
