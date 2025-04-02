-----------------------------------
-- Like the Wind
-- Boneyard Gully ENM, Miasma Filter
-- !addkeyitem MIASMA_FILTER
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.BONEYARD_GULLY,
    battlefieldId    = invaderXim.battlefield.id.LIKE_THE_WIND,
    maxPlayers       = 18,
    levelCap         = 75,
    timeLimit        = utils.minutes(15),
    index            = 1,
    entryNpc         = '_081',
    exitNpcs         = { '_082', '_084', '_086' },
    requiredKeyItems = { invaderXim.ki.MIASMA_FILTER },

    grantXP = 2000,

    experimental = true,
})

-- TODO: Race Runner has a constant movement mechanic and different hate rules that need
-- to be implemented.  See: https://ffxiclopedia.fandom.com/wiki/Like_the_Wind

content:addEssentialMobs({ 'Race_Runner' })

content.loot =
{
    {
        { item = invaderXim.item.NONE,                   weight = 140 }, -- nothing
        { item = invaderXim.item.POT_OF_VIRIDIAN_URUSHI, weight = 310 }, -- Viridian Urushi
        { item = invaderXim.item.SQUARE_OF_GALATEIA,     weight = 241 }, -- Square of Galateia
        { item = invaderXim.item.SQUARE_OF_KEJUSU_SATIN, weight = 310 }, -- Kejusu Satin
    },

    {
        { item = invaderXim.item.NONE,         weight = 862 }, -- nothing
        { item = invaderXim.item.CLOUD_EVOKER, weight = 138 }, -- Cloud Evoker
    },

    {
        { item = invaderXim.item.NONE,                    weight = 380 }, -- nothing
        { item = invaderXim.item.MANEATER,                weight = 138 }, -- Maneater
        { item = invaderXim.item.WAGH_BAGHNAKHS,          weight = 172 }, -- Wagh Baghnakhs
        { item = invaderXim.item.ONIMARU,                 weight = 138 }, -- Onimaru
        { item = invaderXim.item.SCROLL_OF_ARMYS_PAEON_V, weight = 172 }, -- Army's Paeon V
    },

    {
        { item = invaderXim.item.NONE,                    weight = 380 }, -- nothing
        { item = invaderXim.item.MANEATER,                weight = 138 }, -- Maneater
        { item = invaderXim.item.WAGH_BAGHNAKHS,          weight = 172 }, -- Wagh Baghnakhs
        { item = invaderXim.item.ONIMARU,                 weight = 138 }, -- Onimaru
        { item = invaderXim.item.SCROLL_OF_ARMYS_PAEON_V, weight = 172 }, -- Army's Paeon V
    },
}

return content:register()
