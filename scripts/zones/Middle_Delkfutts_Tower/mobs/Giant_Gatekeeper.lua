-----------------------------------
-- Area: Middle Delkfutt's Tower
--  Mob: Giant Gatekeeper
-- Note: PH for Rhoitos and Polybotes
-----------------------------------
local ID = zones[invaderXim.zone.MIDDLE_DELKFUTTS_TOWER]
-----------------------------------
---@type TMobEntity
local entity = {}

local polybotesPHTable =
{
    [ID.mob.POLYBOTES + 1] = ID.mob.POLYBOTES, -- -42.392 -63.535 -0.946
}

local rhoitosPHTable =
{
    [ID.mob.RHOITOS + 1] = ID.mob.RHOITOS, -- 81.445 -79.977 71.427
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 783, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 784, 2, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, rhoitosPHTable, 5, math.random(7200, 14400)) -- 2 to 4 hours (could not find info, so using Ogygos' cooldown)
    invaderXim.mob.phOnDespawn(mob, polybotesPHTable, 5, math.random(7200, 14400)) -- 2 to 4 hours (could not find info, so using Ogygos' cooldown)
end

return entity
