-----------------------------------
-- Area: Tahrongi Canyon
--  Mob: Canyon Crawler
-- Note: PH for Herbage Hunter
-----------------------------------
local ID = zones[invaderXim.zone.TAHRONGI_CANYON]
require('scripts/quests/tutorial')
-----------------------------------
---@type TMobEntity
local entity = {}

local herbagePHTable =
{
    [ID.mob.HERBAGE_HUNTER - 1] = ID.mob.HERBAGE_HUNTER, -- -119.301, 24.087, 448.636
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 96, 1, invaderXim.regime.type.FIELDS)
    invaderXim.tutorial.onMobDeath(player)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, herbagePHTable, 10, 3600) -- 1 hour minimum
end

return entity
