-----------------------------------
-- Area: Quicksand Caves
--  Mob: Antican Signifer
-- Note: PH for Centurio X-I and Antican Proconsul
-----------------------------------
local ID = zones[invaderXim.zone.QUICKSAND_CAVES]
-----------------------------------
---@type TMobEntity
local entity = {}

local centurioPHTable =
{
    [ID.mob.CENTURIO_X_I - 1] = ID.mob.CENTURIO_X_I, -- 773.581 1.576 -568.904
}

local magisterPHTable =
{
    -- Antican Magister is a lottery of various Antica at (C-6).
    -- https://www.bg-wiki.com/ffxi/Antican_Magister
    [ID.mob.ANTICAN_MAGISTER - 1] = ID.mob.ANTICAN_MAGISTER,
}

local proconsulPHTable =
{
    [ID.mob.ANTICAN_PROCONSUL - 1] = ID.mob.ANTICAN_PROCONSUL, -- 89.575 -0.299 -196.206
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
    invaderXim.mob.phOnDespawn(mob, centurioPHTable, 10, 9000) -- 2.5 hours
    invaderXim.mob.phOnDespawn(mob, magisterPHTable, 10, 3600) -- 1 hour
    invaderXim.mob.phOnDespawn(mob, proconsulPHTable, 10, 3600) -- 1 hour
end

return entity
