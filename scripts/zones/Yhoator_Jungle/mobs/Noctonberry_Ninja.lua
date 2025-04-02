-----------------------------------
-- Area: Yhoator Jungle
--  Mob: Noctonberry Ninja
-----------------------------------
mixins =
{
    require('scripts/mixins/families/tonberry'),
    require('scripts/mixins/job_special')
}
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 133, 1, invaderXim.regime.type.FIELDS)
end

return entity
