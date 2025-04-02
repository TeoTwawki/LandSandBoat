-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Yuhtunga Mandragora
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 124, 1, invaderXim.regime.type.FIELDS)
end

return entity
