-----------------------------------
-- Area: Dynamis - Jeuno
--  Mob: Vanguard Armorer
-----------------------------------
mixins =
{
    require('scripts/mixins/dynamis_beastmen'),
    require('scripts/mixins/job_special')
}
local ID = zones[invaderXim.zone.DYNAMIS_JEUNO]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    invaderXim.mob.phOnDespawn(mob, ID.mob.GABBLOX_MAGPIETONGUE_PH, 10, 1200) -- 10% lottery chance and 20 minute cooldown values ASSUMED same as Dynamis-Beaucedine/Xarcabard, needs final verification
    invaderXim.mob.phOnDespawn(mob, ID.mob.TUFFLIX_LOGLIMBS_PH, 10, 1200) -- 10% lottery chance and 20 minute cooldown values ASSUMED same as Dynamis-Beaucedine/Xarcabard, needs final verification
    invaderXim.mob.phOnDespawn(mob, ID.mob.CLOKTIX_LONGNAIL_PH, 10, 1200) -- 10% lottery chance and 20 minute cooldown values ASSUMED same as Dynamis-Beaucedine/Xarcabard, needs final verification
    invaderXim.mob.phOnDespawn(mob, ID.mob.SCRUFFIX_SHAGGYCHEST_PH, 10, 1200) -- 10% lottery chance and 20 minute cooldown values ASSUMED same as Dynamis-Beaucedine/Xarcabard, needs final verification
end

return entity
