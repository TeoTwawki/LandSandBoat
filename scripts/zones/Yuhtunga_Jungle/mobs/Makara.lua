-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Makara
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 127, 2, invaderXim.regime.type.FIELDS)
end

return entity
