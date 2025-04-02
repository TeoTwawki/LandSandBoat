-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: River Sahagin
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 127, 1, invaderXim.regime.type.FIELDS)
end

return entity
