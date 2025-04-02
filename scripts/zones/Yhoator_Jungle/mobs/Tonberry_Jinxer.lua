-----------------------------------
-- Area: Yhoator Jungle
--  Mob: Tonberry Jinxer
-----------------------------------
mixins = { require('scripts/mixins/families/tonberry') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 133, 1, invaderXim.regime.type.FIELDS)
end

return entity
