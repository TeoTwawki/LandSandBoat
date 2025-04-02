-----------------------------------
-- Shell We Dance?
-- Boneyard Gully ENM, Miasma Filter
-- !addkeyitem MIASMA_FILTER
-----------------------------------
local boneyardGullyID = zones[invaderXim.zone.BONEYARD_GULLY]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.BONEYARD_GULLY,
    battlefieldId    = invaderXim.battlefield.id.SHELL_WE_DANCE,
    maxPlayers       = 18,
    levelCap         = 75,
    timeLimit        = utils.minutes(30),
    index            = 3,
    entryNpc         = '_081',
    exitNpcs         = { '_082', '_084', '_086' },
    requiredKeyItems = { invaderXim.ki.MIASMA_FILTER },
    armouryCrates    =
    {
        boneyardGullyID.mob.PARATA + 8,
        boneyardGullyID.mob.PARATA + 17,
        boneyardGullyID.mob.PARATA + 26,
    },

    grantXP = 2000,

    experimental = true,
})

-- TODO: Needs additional cleanup and mixin work (previous comment).  Examine
-- mob spawn handling and move hardcoded IDs to this script or the mob and read as necessary.

content:addEssentialMobs({ 'Parata', 'Bladmall' })

content.loot =
{
    {
        { item = invaderXim.item.PIECE_OF_CASSIA_LUMBER,   weight = 375 },
        { item = invaderXim.item.SQUARE_OF_ELTORO_LEATHER, weight = 328 },
        { item = invaderXim.item.DRAGON_BONE,              weight = 263 },
    },

    {
        { item = invaderXim.item.NONE,         weight = 812 },
        { item = invaderXim.item.CLOUD_EVOKER, weight = 188 },
    },

    {
        quantity = 2,
        { item = invaderXim.item.NONE,                    weight = 199 },
        { item = invaderXim.item.STONE_SPLITTER,          weight = 150 },
        { item = invaderXim.item.FRENZY_FIFE,             weight = 175 },
        { item = invaderXim.item.BLAU_DOLCH,              weight = 238 },
        { item = invaderXim.item.SCROLL_OF_ARMYS_PAEON_V, weight = 238 },
    },
}

return content:register()
