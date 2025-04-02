-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Death Jacket
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 125, 1, invaderXim.regime.type.FIELDS)
end

return entity
