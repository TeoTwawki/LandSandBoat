-----------------------------------
-- Area: Quicksand Caves
--  Mob: Antican Hastatus
-- Note: PH for Antican Magister
-----------------------------------
local ID = zones[invaderXim.zone.QUICKSAND_CAVES]
-----------------------------------
---@type TMobEntity
local entity = {}

local magisterPHTable =
{
    -- Antican Magister is a lottery of various Antica at (C-6).
    -- https://www.bg-wiki.com/ffxi/Antican_Magister
    [ID.mob.ANTICAN_MAGISTER - 3] = ID.mob.ANTICAN_MAGISTER,
}

entity.onMobDeath = function(mob, player, optParams)
    invaderXim.regime.checkRegime(player, mob, 812, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 813, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 814, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 815, 1, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 816, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 817, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 818, 2, invaderXim.regime.type.GROUNDS)
    invaderXim.regime.checkRegime(player, mob, 819, 2, invaderXim.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, magisterPHTable, 10, 3600) -- 1 hour
end

return entity
