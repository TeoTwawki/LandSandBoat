-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Ivory Lizard
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 124, 2, invaderXim.regime.type.FIELDS)
end

return entity
