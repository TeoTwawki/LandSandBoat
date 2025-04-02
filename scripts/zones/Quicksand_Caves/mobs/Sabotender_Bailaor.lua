-----------------------------------
-- Area: Quicksand Caves
--  Mob: Sabotender Bailaor
-----------------------------------
local ID = zones[invaderXim.zone.QUICKSAND_CAVES]
-----------------------------------
---@type TMobEntity
local entity = {}

local bailarinPHTable =
{
    [ID.mob.SABOTENDER_BAILARIN - 3] = ID.mob.SABOTENDER_BAILARIN, -- 604 -5.5 -680
    [ID.mob.SABOTENDER_BAILARIN - 2] = ID.mob.SABOTENDER_BAILARIN, -- 600 -5.5 -673
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 816, 1, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, bailarinPHTable, 100, 9000) -- 2.5 hours
end

return entity
