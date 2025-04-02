-----------------------------------
-- Area: Quicksand Caves
--  Mob: Spelunking Sabotender
-----------------------------------
local ID = zones[invaderXim.zone.QUICKSAND_CAVES]
-----------------------------------
---@type TMobEntity
local entity = {}

local bailarinaPHTable =
{
    [ID.mob.SABOTENDER_BAILARINA - 5] = ID.mob.SABOTENDER_BAILARINA, -- -458 0 780
    [ID.mob.SABOTENDER_BAILARINA - 1] = ID.mob.SABOTENDER_BAILARINA, -- -522 1 779
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 816, 1, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, bailarinaPHTable, 10, 9000) -- 2.5 hours
end

return entity
