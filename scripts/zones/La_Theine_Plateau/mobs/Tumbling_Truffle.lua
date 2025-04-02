-----------------------------------
-- Area: La Theine Plateau
--  Mob: Tumbling Truffle
-----------------------------------
require('scripts/quests/tutorial')
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.hunts.checkHunt(mob, player, 154)
    invaderXim.regime.checkRegime(player, mob, 71, 2, invaderXim.regime.type.FIELDS)
    invaderXim.tutorial.onMobDeath(player)
    invaderXim.magian.onMobDeath(mob, player, optParams, set{ 68 })
end

return entity
