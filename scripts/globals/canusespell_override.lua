-----------------------------------
-- Can use spell override functionality
-- Used to allow cast of spells granted by job points
-----------------------------------
xi = xi or {}
invaderXim.spells = invaderXim.spells or {}

local jobPointSpellGiftMap =
{
    [invaderXim.job.WHM] =
    {
        [invaderXim.magic.spell.RERAISE_IV] = 100,
        [invaderXim.magic.spell.FULL_CURE]  = 1200,
    },

    [invaderXim.job.BLM] =
    {
        [invaderXim.magic.spell.FIRE_VI]     = 100,
        [invaderXim.magic.spell.BLIZZARD_VI] = 100,
        [invaderXim.magic.spell.AERO_VI]     = 100,
        [invaderXim.magic.spell.STONE_VI]    = 100,
        [invaderXim.magic.spell.THUNDER_VI]  = 100,
        [invaderXim.magic.spell.WATER_VI]    = 100,

        [invaderXim.magic.spell.ASPIR_III]   = 550,

        [invaderXim.magic.spell.DEATH]       = 1200,
    },

    [invaderXim.job.RDM] =
    {
        [invaderXim.magic.spell.FIRE_V]       = 100,
        [invaderXim.magic.spell.BLIZZARD_V]   = 100,
        [invaderXim.magic.spell.AERO_V]       = 100,
        [invaderXim.magic.spell.STONE_V]      = 100,
        [invaderXim.magic.spell.THUNDER_V]    = 100,
        [invaderXim.magic.spell.WATER_V]      = 100,

        [invaderXim.magic.spell.ADDLE_II]     = 550,
        [invaderXim.magic.spell.DISTRACT_III] = 550,
        [invaderXim.magic.spell.FRAZZLE_III]  = 550,

        [invaderXim.magic.spell.REFRESH_III]  = 1200,
        [invaderXim.magic.spell.TEMPER_II]    = 1200,
    },

    [invaderXim.job.PLD] =
    {
        [invaderXim.magic.spell.ENLIGHT_II] = 100,
    },

    [invaderXim.job.DRK] =
    {
        [invaderXim.magic.spell.ENDARK_II] = 100,
        [invaderXim.magic.spell.DRAIN_III] = 100,
    },

    [invaderXim.job.BRD] =
    {
        [invaderXim.magic.spell.FIRE_THRENODY_II]      = 100,
        [invaderXim.magic.spell.ICE_THRENODY_II]       = 100,
        [invaderXim.magic.spell.WIND_THRENODY_II]      = 100,
        [invaderXim.magic.spell.EARTH_THRENODY_II]     = 100,
        [invaderXim.magic.spell.LIGHTNING_THRENODY_II] = 100,
        [invaderXim.magic.spell.WATER_THRENODY_II]     = 100,
        [invaderXim.magic.spell.LIGHT_THRENODY_II]     = 100,
        [invaderXim.magic.spell.DARK_THRENODY_II]      = 100,
    },

    [invaderXim.job.NIN] =
    {
        [invaderXim.magic.spell.UTSUSEMI_SAN] = 100,
    },

    [invaderXim.job.SCH] =
    {
        [invaderXim.magic.spell.FIRESTORM_II]    = 100,
        [invaderXim.magic.spell.HAILSTORM_II]    = 100,
        [invaderXim.magic.spell.WINDSTORM_II]    = 100,
        [invaderXim.magic.spell.SANDSTORM_II]    = 100,
        [invaderXim.magic.spell.THUNDERSTORM_II] = 100,
        [invaderXim.magic.spell.RAINSTORM_II]    = 100,
        [invaderXim.magic.spell.AURORASTORM_II]  = 100,
        [invaderXim.magic.spell.VOIDSTORM_II]    = 100,

        [invaderXim.magic.spell.PYROHELIX_II]    = 1200,
        [invaderXim.magic.spell.CRYOHELIX_II]    = 1200,
        [invaderXim.magic.spell.ANEMOHELIX_II]   = 1200,
        [invaderXim.magic.spell.GEOHELIX_II]     = 1200,
        [invaderXim.magic.spell.LUMINOHELIX_II]  = 1200,
        [invaderXim.magic.spell.NOCTOHELIX_II]   = 1200,
    },

    [invaderXim.job.GEO] =
    {
        [invaderXim.magic.spell.FIRE_V]       = 100,
        [invaderXim.magic.spell.BLIZZARD_V]   = 100,
        [invaderXim.magic.spell.AERO_V]       = 100,
        [invaderXim.magic.spell.STONE_V]      = 100,
        [invaderXim.magic.spell.THUNDER_V]    = 100,
        [invaderXim.magic.spell.WATER_V]      = 100,

        [invaderXim.magic.spell.FIRA_III]     = 1200,
        [invaderXim.magic.spell.BLIZZARA_III] = 1200,
        [invaderXim.magic.spell.AERA_III]     = 1200,
        [invaderXim.magic.spell.STONERA_III]  = 1200,
        [invaderXim.magic.spell.THUNDARA_III] = 1200,
        [invaderXim.magic.spell.WATERA_III]   = 1200,
    },

    [invaderXim.job.RUN] =
    {
        [invaderXim.magic.spell.TEMPER] = 550,
    }
}

local function getSpellJobPointCostForJob(job, spellID)
    local jobGiftMap = jobPointSpellGiftMap[job]
    if jobGiftMap then
        local jobPointCost = jobGiftMap[spellID]

        if jobPointCost then
            return jobPointCost
        end
    end

    return -1
end

-- return true to indicate that the spell can indeed be cast
-- return false falls back to default behavior of checking main/sub job levels for cast availability
-- note: this only affects whether or not you are able to cast a spell in general, MP costs (if any) are still required.
invaderXim.spells.canUseSpellOverride = function(player, spell)
    local job            = player:getMainJob()
    local spellID        = spell:getID()
    local jobPointsSpent = player:getSpentJobPoints()

    local jobPointCostForSpell = getSpellJobPointCostForJob(job, spellID)

    if jobPointCostForSpell == -1 then -- that job can't cast that spell no matter how many JP they have
        return false
    end

    if jobPointsSpent >= jobPointCostForSpell then
        return true
    end

    return false
end
