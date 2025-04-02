-----------------------------------
-- Area: Den of Rancor
--   NM: Tonberry Tracker
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
    invaderXim.regime.checkRegime(player, mob, 798, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 799, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 800, 2, invaderXim.regime.type.GROUNDS)
end

return entity
