-----------------------------------
-- Area: Quicksand Caves
--  Mob: Antican Princeps
-- Note: PH for Sagittarius X-XIII and Antican Praefectus
-----------------------------------
local ID = zones[invaderXim.zone.QUICKSAND_CAVES]
-----------------------------------
---@type TMobEntity
local entity = {}

local sagittariusPHTable =
{
    [ID.mob.SAGITTARIUS_X_XIII - 5] = ID.mob.SAGITTARIUS_X_XIII, -- 641 -16.786 -774
}

local magisterPHTable =
{
    -- Antican Magister is a lottery of various Antica at (C-6).
    -- https://www.bg-wiki.com/ffxi/Antican_Magister
    [ID.mob.ANTICAN_MAGISTER - 2] = ID.mob.ANTICAN_MAGISTER,
}

local praefectusPHTable =
{
    [ID.mob.ANTICAN_PRAEFECTUS - 1] = ID.mob.ANTICAN_PRAEFECTUS, -- -90.01 -0.567 -29.424
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
    invaderXim.mob.phOnDespawn(mob, sagittariusPHTable, 10, 14400) -- 4 hours
    invaderXim.mob.phOnDespawn(mob, praefectusPHTable, 10, 3600) -- 1 hour
    invaderXim.mob.phOnDespawn(mob, magisterPHTable, 10, 3600) -- 1 hour
end

return entity
