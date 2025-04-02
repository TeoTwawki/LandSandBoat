-----------------------------------
-- Brothers
-- Bearclaw Pinnacle ENM, Zephyr Fan
-- !addkeyitem ZEPHYR_FAN
-- !pos 121 -171 758 6
-----------------------------------
local ID = zones[invaderXim.zone.BEARCLAW_PINNACLE]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.BEARCLAW_PINNACLE,
    battlefieldId    = invaderXim.battlefield.id.BROTHERS,
    maxPlayers       = 18,
    levelCap         = 75,
    timeLimit        = utils.minutes(30),
    index            = 3,
    entryNpc         = 'Wind_Pillar_4',
    exitNpc          = 'Wind_Pillar_Exit',
    requiredKeyItems = { invaderXim.ki.ZEPHYR_FAN, message = ID.text.ZEPHYR_RIPS },
    grantXP          = 3500,
})

content.groups =
{
    {
        mobs = { 'Eldertaur' },
        mods =
        {
            [invaderXim.mod.DMGMAGIC  ] = -1000,
            [invaderXim.mod.SLEEP_MEVA] = 75,
        },

        mobMods =
        {
            [invaderXim.mobMod.SIGHT_RANGE] = 30,
        },
    },
    {
        mobs = { 'Mindertaur' },
        mods =
        {
            [invaderXim.mod.DMGMAGIC    ] = -1000,
            [invaderXim.mod.SILENCE_MEVA] = 75,
            [invaderXim.mod.SLEEP_MEVA  ] = 50,
        },

        mobMods =
        {
            [invaderXim.mobMod.SIGHT_RANGE] = 30,
        }
    },
}

content:addEssentialMobs({ 'Eldertaur', 'Mindertaur' })

content.loot =
{
    {
        { item = invaderXim.item.NONE,                     weight = invaderXim.loot.weight.VERY_LOW },
        { item = invaderXim.item.SQUARE_OF_ELTORO_LEATHER, weight = invaderXim.loot.weight.NORMAL   },
        { item = invaderXim.item.PIECE_OF_CASSIA_LUMBER,   weight = invaderXim.loot.weight.NORMAL   },
        { item = invaderXim.item.DRAGON_BONE,              weight = invaderXim.loot.weight.NORMAL   },
    },

    {
        { item = invaderXim.item.NONE,         weight = invaderXim.loot.weight.EXTREMELY_HIGH },
        { item = invaderXim.item.CLOUD_EVOKER, weight = invaderXim.loot.weight.LOW            },
    },

    {
        quantity = 2,
        { item = invaderXim.item.NONE,                weight = invaderXim.loot.weight.HIGH },
        { item = invaderXim.item.SCOUTERS_ROPE,       weight = invaderXim.loot.weight.LOW  },
        { item = invaderXim.item.HEDGEHOG_BOMB,       weight = invaderXim.loot.weight.LOW  },
        { item = invaderXim.item.MARTIAL_ANELACE,     weight = invaderXim.loot.weight.LOW  },
        { item = invaderXim.item.MARTIAL_LANCE,       weight = invaderXim.loot.weight.LOW  },
        { item = invaderXim.item.SCROLL_OF_RAISE_III, weight = invaderXim.loot.weight.HIGH },
    },
}

return content:register()
