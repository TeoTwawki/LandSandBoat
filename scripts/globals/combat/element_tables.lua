-----------------------------------
-- Tables defining diferent elemental caracteristics.
-- Ordered by element ID.
-----------------------------------
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.combat = invaderXim.combat or {}
invaderXim.combat.element = invaderXim.combat.element or {}
-----------------------------------

local column =
{
    ELEMENT_OPPOSED       =  1,
    DAY_ASSOCIATED        =  2,
    WEATHER_SINGLE        =  3,
    WEATHER_DOUBLE        =  4,
    MOD_ELEMENT_SDT       =  5,
    MOD_ELEMENT_RES_RANK  =  6,
    MOD_ELEMENT_NULL      =  7,
    MOD_ELEMENT_ABSORB    =  8,
    MOD_ELEMENT_MACC      =  9,
    MOD_ELEMENT_MEVA      = 10,
    MOD_AFFINITY_DMG      = 11,
    MOD_AFFINITY_MACC     = 12,
    MOD_FORCE_DW_BONUS    = 13,
    EFFECT_BARSPELL       = 14,
    MERIT_ELEMENT_POTENCY = 15,
    MERIT_ELEMENT_MACC    = 16,
}

invaderXim.combat.element.dataTable =
{
    [invaderXim.element.FIRE   ] = { invaderXim.element.WATER,   invaderXim.day.FIRESDAY,     invaderXim.weather.HOT_SPELL,  invaderXim.weather.HEAT_WAVE,     invaderXim.mod.FIRE_SDT,    invaderXim.mod.FIRE_RES_RANK,    invaderXim.mod.FIRE_NULL,  invaderXim.mod.FIRE_ABSORB,  invaderXim.mod.FIRE_MACC,    invaderXim.mod.FIRE_MEVA,    invaderXim.mod.FIRE_AFFINITY_DMG,    invaderXim.mod.FIRE_AFFINITY_ACC,    invaderXim.mod.FORCE_FIRE_DWBONUS,      invaderXim.effect.BARFIRE,     invaderXim.merit.FIRE_MAGIC_POTENCY,      invaderXim.merit.FIRE_MAGIC_ACCURACY      },
    [invaderXim.element.ICE    ] = { invaderXim.element.FIRE,    invaderXim.day.ICEDAY,       invaderXim.weather.SNOW,       invaderXim.weather.BLIZZARDS,     invaderXim.mod.ICE_SDT,     invaderXim.mod.ICE_RES_RANK,     invaderXim.mod.ICE_NULL,   invaderXim.mod.ICE_ABSORB,   invaderXim.mod.ICE_MACC,     invaderXim.mod.ICE_MEVA,     invaderXim.mod.ICE_AFFINITY_DMG,     invaderXim.mod.ICE_AFFINITY_ACC,     invaderXim.mod.FORCE_ICE_DWBONUS,       invaderXim.effect.BARBLIZZARD, invaderXim.merit.ICE_MAGIC_POTENCY,       invaderXim.merit.ICE_MAGIC_ACCURACY       },
    [invaderXim.element.WIND   ] = { invaderXim.element.ICE,     invaderXim.day.WINDSDAY,     invaderXim.weather.WIND,       invaderXim.weather.GALES,         invaderXim.mod.WIND_SDT,    invaderXim.mod.WIND_RES_RANK,    invaderXim.mod.WIND_NULL,  invaderXim.mod.WIND_ABSORB,  invaderXim.mod.WIND_MACC,    invaderXim.mod.WIND_MEVA,    invaderXim.mod.WIND_AFFINITY_DMG,    invaderXim.mod.WIND_AFFINITY_ACC,    invaderXim.mod.FORCE_WIND_DWBONUS,      invaderXim.effect.BARAERO,     invaderXim.merit.WIND_MAGIC_POTENCY,      invaderXim.merit.WIND_MAGIC_ACCURACY      },
    [invaderXim.element.EARTH  ] = { invaderXim.element.WIND,    invaderXim.day.EARTHSDAY,    invaderXim.weather.DUST_STORM, invaderXim.weather.SAND_STORM,    invaderXim.mod.EARTH_SDT,   invaderXim.mod.EARTH_RES_RANK,   invaderXim.mod.EARTH_NULL, invaderXim.mod.EARTH_ABSORB, invaderXim.mod.EARTH_MACC,   invaderXim.mod.EARTH_MEVA,   invaderXim.mod.EARTH_AFFINITY_DMG,   invaderXim.mod.EARTH_AFFINITY_ACC,   invaderXim.mod.FORCE_EARTH_DWBONUS,     invaderXim.effect.BARSTONE,    invaderXim.merit.EARTH_MAGIC_POTENCY,     invaderXim.merit.EARTH_MAGIC_ACCURACY     },
    [invaderXim.element.THUNDER] = { invaderXim.element.EARTH,   invaderXim.day.LIGHTNINGDAY, invaderXim.weather.THUNDER,    invaderXim.weather.THUNDERSTORMS, invaderXim.mod.THUNDER_SDT, invaderXim.mod.THUNDER_RES_RANK, invaderXim.mod.LTNG_NULL,  invaderXim.mod.LTNG_ABSORB,  invaderXim.mod.THUNDER_MACC, invaderXim.mod.THUNDER_MEVA, invaderXim.mod.THUNDER_AFFINITY_DMG, invaderXim.mod.THUNDER_AFFINITY_ACC, invaderXim.mod.FORCE_LIGHTNING_DWBONUS, invaderXim.effect.BARTHUNDER,  invaderXim.merit.LIGHTNING_MAGIC_POTENCY, invaderXim.merit.LIGHTNING_MAGIC_ACCURACY },
    [invaderXim.element.WATER  ] = { invaderXim.element.THUNDER, invaderXim.day.WATERSDAY,    invaderXim.weather.RAIN,       invaderXim.weather.SQUALL,        invaderXim.mod.WATER_SDT,   invaderXim.mod.WATER_RES_RANK,   invaderXim.mod.WATER_NULL, invaderXim.mod.WATER_ABSORB, invaderXim.mod.WATER_MACC,   invaderXim.mod.WATER_MEVA,   invaderXim.mod.WATER_AFFINITY_DMG,   invaderXim.mod.WATER_AFFINITY_ACC,   invaderXim.mod.FORCE_WATER_DWBONUS,     invaderXim.effect.BARWATER,    invaderXim.merit.WATER_MAGIC_POTENCY,     invaderXim.merit.WATER_MAGIC_ACCURACY     },
    [invaderXim.element.LIGHT  ] = { invaderXim.element.DARK,    invaderXim.day.LIGHTSDAY,    invaderXim.weather.AURORAS,    invaderXim.weather.STELLAR_GLARE, invaderXim.mod.LIGHT_SDT,   invaderXim.mod.LIGHT_RES_RANK,   invaderXim.mod.LIGHT_NULL, invaderXim.mod.LIGHT_ABSORB, invaderXim.mod.LIGHT_MACC,   invaderXim.mod.LIGHT_MEVA,   invaderXim.mod.LIGHT_AFFINITY_DMG,   invaderXim.mod.LIGHT_AFFINITY_ACC,   invaderXim.mod.FORCE_LIGHT_DWBONUS,     0,                     0,                                0                                 },
    [invaderXim.element.DARK   ] = { invaderXim.element.LIGHT,   invaderXim.day.DARKSDAY,     invaderXim.weather.GLOOM,      invaderXim.weather.DARKNESS,      invaderXim.mod.DARK_SDT,    invaderXim.mod.DARK_RES_RANK,    invaderXim.mod.DARK_NULL,  invaderXim.mod.DARK_ABSORB,  invaderXim.mod.DARK_MACC,    invaderXim.mod.DARK_MEVA,    invaderXim.mod.DARK_AFFINITY_DMG,    invaderXim.mod.DARK_AFFINITY_ACC,    invaderXim.mod.FORCE_DARK_DWBONUS,      0,                     0,                                0                                 },
}

invaderXim.combat.element.getOppositeElement = function(element)
    -- Validate fed value.
    local elementToCheck = utils.defaultIfNil(element, 0)

    if elementToCheck < invaderXim.element.FIRE or elementToCheck > invaderXim.element.DARK then
        return 0
    end

    return invaderXim.combat.element.dataTable[elementToCheck][column.ELEMENT_OPPOSED]
end

-----------------------------------
-- Day-related functions
-----------------------------------
invaderXim.combat.element.getAssociatedDay = function(element)
    -- Validate fed value.
    local elementToCheck = utils.defaultIfNil(element, 0)

    if elementToCheck < invaderXim.element.FIRE or elementToCheck > invaderXim.element.DARK then
        return -1
    end

    return invaderXim.combat.element.dataTable[elementToCheck][column.DAY_ASSOCIATED]
end

invaderXim.combat.element.getOppositeDay = function(element)
    -- Validate fed value.
    local elementToCheck = utils.defaultIfNil(element, 0)

    if elementToCheck < invaderXim.element.FIRE or elementToCheck > invaderXim.element.DARK then
        return -1
    end

    -- Fetch opposite element.
    elementToCheck = invaderXim.combat.element.dataTable[elementToCheck][column.ELEMENT_OPPOSED]

    return invaderXim.combat.element.dataTable[elementToCheck][column.DAY_ASSOCIATED]
end

invaderXim.combat.element.getDayElement = function(day)
    -- Validate fed value.
    local dayToCheck = utils.defaultIfNil(day, -1)

    for elementToCheck = invaderXim.element.FIRE, invaderXim.element.DARK do
        if dayToCheck == invaderXim.combat.element.dataTable[elementToCheck][column.DAY_ASSOCIATED] then
            return elementToCheck
        end
    end

    return invaderXim.element.NONE
end

-----------------------------------
-- Weather-related functions
-----------------------------------
invaderXim.combat.element.getAssociatedSingleWeather = function(element)
    -- Validate fed value.
    local elementToCheck = utils.defaultIfNil(element, 0)

    if elementToCheck < invaderXim.element.FIRE or elementToCheck > invaderXim.element.DARK then
        return -1
    end

    return invaderXim.combat.element.dataTable[elementToCheck][column.WEATHER_SINGLE]
end

invaderXim.combat.element.getOppositeSingleWeather = function(element)
    -- Validate fed value.
    local elementToCheck = utils.defaultIfNil(element, 0)

    if elementToCheck < invaderXim.element.FIRE or elementToCheck > invaderXim.element.DARK then
        return -1
    end

    -- Fetch opposite element.
    elementToCheck = invaderXim.combat.element.dataTable[elementToCheck][column.ELEMENT_OPPOSED]

    return invaderXim.combat.element.dataTable[elementToCheck][column.WEATHER_SINGLE]
end

invaderXim.combat.element.getAssociatedDoubleWeather = function(element)
    -- Validate fed value.
    local elementToCheck = utils.defaultIfNil(element, 0)

    if elementToCheck < invaderXim.element.FIRE or elementToCheck > invaderXim.element.DARK then
        return -1
    end

    return invaderXim.combat.element.dataTable[elementToCheck][column.WEATHER_DOUBLE]
end

invaderXim.combat.element.getOppositeDoubleWeather = function(element)
    -- Validate fed value.
    local elementToCheck = utils.defaultIfNil(element, 0)

    if elementToCheck < invaderXim.element.FIRE or elementToCheck > invaderXim.element.DARK then
        return -1
    end

    -- Fetch opposite element.
    elementToCheck = invaderXim.combat.element.dataTable[elementToCheck][column.ELEMENT_OPPOSED]

    return invaderXim.combat.element.dataTable[elementToCheck][column.WEATHER_DOUBLE]
end

invaderXim.combat.element.getWeatherElement = function(weather)
    -- Validate fed value.
    local weatherToCheck = utils.defaultIfNil(weather, 0)

    for elementChecked = invaderXim.element.FIRE, invaderXim.element.DARK do
        local elementalSingle = invaderXim.combat.element.dataTable[elementChecked][column.WEATHER_SINGLE]
        local elementalDouble = invaderXim.combat.element.dataTable[elementChecked][column.WEATHER_DOUBLE]

        if weatherToCheck == elementalSingle or weatherToCheck == elementalDouble then
            return elementChecked
        end
    end

    return invaderXim.element.NONE
end

-----------------------------------
-- Modifier-related functions
-----------------------------------
invaderXim.combat.element.getElementalSDTModifier = function(element)
    -- Validate fed value.
    local elementToCheck = utils.defaultIfNil(element, 0)

    if elementToCheck < invaderXim.element.FIRE or elementToCheck > invaderXim.element.DARK then
        return 0
    end

    return invaderXim.combat.element.dataTable[elementToCheck][column.MOD_ELEMENT_SDT]
end

invaderXim.combat.element.getElementalResistanceRankModifier = function(element)
    -- Validate fed value.
    local elementToCheck = utils.defaultIfNil(element, 0)

    if elementToCheck < invaderXim.element.FIRE or elementToCheck > invaderXim.element.DARK then
        return 0
    end

    return invaderXim.combat.element.dataTable[elementToCheck][column.MOD_ELEMENT_RES_RANK]
end

invaderXim.combat.element.getElementalNullificationModifier = function(element)
    -- Validate fed value.
    local elementToCheck = utils.defaultIfNil(element, 0)

    if elementToCheck < invaderXim.element.FIRE or elementToCheck > invaderXim.element.DARK then
        return 0
    end

    return invaderXim.combat.element.dataTable[elementToCheck][column.MOD_ELEMENT_NULL]
end

invaderXim.combat.element.getElementalAbsorptionModifier = function(element)
    -- Validate fed value.
    local elementToCheck = utils.defaultIfNil(element, 0)

    if elementToCheck < invaderXim.element.FIRE or elementToCheck > invaderXim.element.DARK then
        return 0
    end

    return invaderXim.combat.element.dataTable[elementToCheck][column.MOD_ELEMENT_ABSORB]
end

invaderXim.combat.element.getElementalMACCModifier = function(element)
    -- Validate fed value.
    local elementToCheck = utils.defaultIfNil(element, 0)

    if elementToCheck < invaderXim.element.FIRE or elementToCheck > invaderXim.element.DARK then
        return 0
    end

    return invaderXim.combat.element.dataTable[elementToCheck][column.MOD_ELEMENT_MACC]
end

invaderXim.combat.element.getElementalMEVAModifier = function(element)
    -- Validate fed value.
    local elementToCheck = utils.defaultIfNil(element, 0)

    if elementToCheck < invaderXim.element.FIRE or elementToCheck > invaderXim.element.DARK then
        return 0
    end

    return invaderXim.combat.element.dataTable[elementToCheck][column.MOD_ELEMENT_MEVA]
end

invaderXim.combat.element.getElementalAffinityDMGModifier = function(element)
    -- Validate fed value.
    local elementToCheck = utils.defaultIfNil(element, 0)

    if elementToCheck < invaderXim.element.FIRE or elementToCheck > invaderXim.element.DARK then
        return 0
    end

    return invaderXim.combat.element.dataTable[elementToCheck][column.MOD_AFFINITY_DMG]
end

invaderXim.combat.element.getElementalAffinityMACCModifier = function(element)
    -- Validate fed value.
    local elementToCheck = utils.defaultIfNil(element, 0)

    if elementToCheck < invaderXim.element.FIRE or elementToCheck > invaderXim.element.DARK then
        return 0
    end

    return invaderXim.combat.element.dataTable[elementToCheck][column.MOD_AFFINITY_MACC]
end

invaderXim.combat.element.getForcedDayOrWeatherBonusModifier = function(element)
    -- Validate fed value.
    local elementToCheck = utils.defaultIfNil(element, 0)

    if elementToCheck < invaderXim.element.FIRE or elementToCheck > invaderXim.element.DARK then
        return 0
    end

    return invaderXim.combat.element.dataTable[elementToCheck][column.MOD_FORCE_DW_BONUS]
end

-----------------------------------
-- Effect-related functions
-----------------------------------
invaderXim.combat.element.getAssociatedBarspellEffect = function(element)
    -- Validate fed value.
    local elementToCheck = utils.defaultIfNil(element, 0)

    if elementToCheck < invaderXim.element.FIRE or elementToCheck > invaderXim.element.WATER then
        return 0
    end

    return invaderXim.combat.element.dataTable[elementToCheck][column.EFFECT_BARSPELL]
end

-----------------------------------
-- Merit-related functions
-----------------------------------
invaderXim.combat.element.getElementalPotencyMerit = function(element)
    -- Validate fed value.
    local elementToCheck = utils.defaultIfNil(element, 0)

    if elementToCheck < invaderXim.element.FIRE or elementToCheck > invaderXim.element.WATER then
        return 0
    end

    return invaderXim.combat.element.dataTable[elementToCheck][column.MERIT_ELEMENT_POTENCY]
end

invaderXim.combat.element.getElementalAccuracyMerit = function(element)
    -- Validate fed value.
    local elementToCheck = utils.defaultIfNil(element, 0)

    if elementToCheck < invaderXim.element.FIRE or elementToCheck > invaderXim.element.WATER then
        return 0
    end

    return invaderXim.combat.element.dataTable[elementToCheck][column.MERIT_ELEMENT_MACC]
end
