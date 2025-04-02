-----------------------------------
-- Area: Castle Oztroja [S]
--  Mob: Yagudo Sentinel
-- Note: PH for Aa Xalmo the Savage and Zhuu Buxu the Silent
-----------------------------------
local ID = zones[invaderXim.zone.CASTLE_OZTROJA_S]
-----------------------------------
---@type TMobEntity
local entity = {}

local aaXalmoPHTable =
{
    [ID.mob.AA_XALMO_THE_SAVAGE - 16] = ID.mob.AA_XALMO_THE_SAVAGE,
    [ID.mob.AA_XALMO_THE_SAVAGE - 5]  = ID.mob.AA_XALMO_THE_SAVAGE,
}

local zhuuBuxuPHTable =
{
    [ID.mob.ZHUU_BUXU_THE_SILENT - 1] = ID.mob.ZHUU_BUXU_THE_SILENT,
}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, aaXalmoPHTable, 10, 7200) -- 2 hour
    invaderXim.mob.phOnDespawn(mob, zhuuBuxuPHTable, 10, 7200) -- 2 hour
end

return entity
