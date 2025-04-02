-----------------------------------
-- Area: Tahrongi Canyon
--  Mob: Wild Dhalmel
-- Note: PH for Serpopard Ishtar
-----------------------------------
local ID = zones[invaderXim.zone.TAHRONGI_CANYON]
require('scripts/quests/tutorial')
-----------------------------------
---@type TMobEntity
local entity = {}

local serpopardPHTable =
{
    [ID.mob.SERPOPARD_ISHTAR[1] - 3] = ID.mob.SERPOPARD_ISHTAR[1], -- -9.176 -8.191 -64.347 (south)
    [ID.mob.SERPOPARD_ISHTAR[2] - 4] = ID.mob.SERPOPARD_ISHTAR[2], -- 22.360 23.757 281.584 (north)
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 96, 2, invaderXim.regime.type.FIELDS)
    invaderXim.tutorial.onMobDeath(player)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, serpopardPHTable, 10, 3600) -- 1 hour
end

return entity
