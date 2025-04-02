-----------------------------------
-- Area: Tahrongi Canyon
--  Mob: Pygmaioi
-----------------------------------
require('scripts/quests/tutorial')
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 94, 2, invaderXim.regime.type.FIELDS)
    invaderXim.regime.checkRegime(player, mob, 95, 1, invaderXim.regime.type.FIELDS)
    invaderXim.tutorial.onMobDeath(player)
end

return entity
