-----------------------------------
-- Area: Temenos
-- Name: Central Temenos 1st Floor
-- !addkeyitem white_card
-- !addkeyitem cosmo_cleanse
-- !additem scarlet_chip
-- !pos 580.000 -2.375 104.000 37
-----------------------------------
local ID = zones[invaderXim.zone.TEMENOS]
-----------------------------------

local content = Limbus:new({
    zoneId           = invaderXim.zone.TEMENOS,
    battlefieldId    = invaderXim.battlefield.id.CENTRAL_TEMENOS_2ND_FLOOR,
    maxPlayers       = 18,
    timeLimit        = utils.minutes(45),
    index            = 5,
    area             = 6,
    entryNpc         = 'Matter_Diffusion_Module',
    requiredKeyItems = { invaderXim.ki.COSMO_CLEANSE, invaderXim.ki.WHITE_CARD, message = ID.text.YOU_INSERT_THE_CARD_POLISHED },
    requiredItems    = { invaderXim.item.SCARLET_CHIP },
    name             = 'CENTRAL_TEMENOS_2ND_FLOOR',
    lootCrateId      = ID.npc.C2_LOOT_CRATE,
})

local function weakenCarbuncle(elementalMod, bonusMod, bonusAmount, battlefield, mob, count)
    -- Remove the elemental bonus effects
    local zone      = mob:getZone()
    local carbuncle = zone:queryEntitiesByName('Mystic_Avatar_Carbuncle')[1]

    if elementalMod ~= invaderXim.mod.NONE then
        carbuncle:setMod(elementalMod, 0)
    end

    carbuncle:delMod(bonusMod, bonusAmount)
end

function content:handleElementalDeath(elementalMod, bonusMod, bonusAmount, weakElemental, battlefield, mob, count)
    -- Spawn the Mystic Avatar if this elemental died from morphing
    if mob:getLocalVar('morphed') == 1 then
        local mysticID = mob:getID() + 6
        local mystic   = GetMobByID(mysticID)

        if mystic then
            mystic:timer(3000, function(mobArg)
                mystic:setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos(), mob:getRotPos())
                SpawnMob(mysticID)
            end)
        end

        return
    end

    weakenCarbuncle(elementalMod, bonusMod, bonusAmount, battlefield, mob, count)

    -- Morph the weak elemental into a Mystic Avatar
    local zone      = mob:getZone()
    local elemental = zone:queryEntitiesByName(weakElemental)[1]

    if elemental:isAlive() then
        elemental:setLocalVar('morphed', 1)
        elemental:setHP(0)
    end
end

content.groups =
{
    {
        mobs =
        {
            'Fire_Elemental',
            'Ice_Elemental',
            'Air_Elemental',
            'Earth_Elemental',
            'Thunder_Elemental',
            'Water_Elemental',
            'Light_Elemental',
        },

        -- NOTE: Elementals in here take 50% physical damage instead of the usual 25%
        -- TODO: Verify if the Elementals here should detect sound
        mods =
        {
            [invaderXim.mod.SLASH_SDT   ] = 500,
            [invaderXim.mod.PIERCE_SDT  ] = 500,
            [invaderXim.mod.IMPACT_SDT  ] = 500,
            [invaderXim.mod.HTH_SDT     ] = 500,
            [invaderXim.mobMod.DETECTION] = invaderXim.detects.HEARING,
        },
    },

    -- Each Mystic Avatar has special elemental SDTs
    {
        spawned = false,
        mobs    = { 'Mystic_Avatar_Ifrit' },
        mods =
        {
            [invaderXim.mod.UDMGPHYS   ] = 2500,
            [invaderXim.mod.FIRE_ABSORB] = 100,
            [invaderXim.mod.FIRE_SDT   ] = -10000,
            [invaderXim.mod.ICE_SDT    ] = 9000,
            [invaderXim.mod.THUNDER_SDT] = 9000,
            [invaderXim.mod.EARTH_SDT  ] = 9000,
            [invaderXim.mod.WIND_SDT   ] = 9000,
            [invaderXim.mod.DARK_SDT   ] = 9000,
        },
    },

    {
        spawned = false,
        mobs    = { 'Mystic_Avatar_Shiva' },
        mods =
        {
            [invaderXim.mod.UDMGPHYS   ] = 2500,
            [invaderXim.mod.ICE_ABSORB ] = 100,
            [invaderXim.mod.ICE_SDT    ] = -10000,
            [invaderXim.mod.WATER_SDT  ] = 9000,
            [invaderXim.mod.THUNDER_SDT] = 9000,
            [invaderXim.mod.EARTH_SDT  ] = 9000,
            [invaderXim.mod.WIND_SDT   ] = 9000,
            [invaderXim.mod.DARK_SDT   ] = 9000,
        },
    },

    {
        spawned = false,
        mobs    = { 'Mystic_Avatar_Garuda' },
        mods =
        {
            [invaderXim.mod.UDMGPHYS   ] = 2500,
            [invaderXim.mod.WIND_ABSORB] = 100,
            [invaderXim.mod.WIND_SDT   ] = -10000,
            [invaderXim.mod.FIRE_SDT   ] = 9000,
            [invaderXim.mod.WATER_SDT  ] = 9000,
            [invaderXim.mod.THUNDER_SDT] = 9000,
            [invaderXim.mod.EARTH_SDT  ] = 9000,
            [invaderXim.mod.DARK_SDT   ] = 9000,
        },
    },

    {
        spawned = false,
        mobs    = { 'Mystic_Avatar_Titan' },
        mods =
        {
            [invaderXim.mod.UDMGPHYS    ] = 2500,
            [invaderXim.mod.EARTH_ABSORB] = 100,
            [invaderXim.mod.EARTH_SDT   ] = -10000,
            [invaderXim.mod.ICE_SDT     ] = 9000,
            [invaderXim.mod.FIRE_SDT    ] = 9000,
            [invaderXim.mod.WATER_SDT   ] = 9000,
            [invaderXim.mod.THUNDER_SDT ] = 9000,
            [invaderXim.mod.DARK_SDT    ] = 9000,
        },
    },

    {
        spawned = false,
        mobs    = { 'Mystic_Avatar_Ramuh' },
        mods =
        {
            [invaderXim.mod.UDMGPHYS   ] = 2500,
            [invaderXim.mod.LTNG_ABSORB] = 100,
            [invaderXim.mod.THUNDER_SDT] = -10000,
            [invaderXim.mod.ICE_SDT    ] = 9000,
            [invaderXim.mod.FIRE_SDT   ] = 9000,
            [invaderXim.mod.WATER_SDT  ] = 9000,
            [invaderXim.mod.WIND_SDT   ] = 9000,
            [invaderXim.mod.DARK_SDT   ] = 9000,
        },
    },

    {
        spawned = false,
        mobs    = { 'Mystic_Avatar_Leviathan' },
        mods =
        {
            [invaderXim.mod.UDMGPHYS    ] = 2500,
            [invaderXim.mod.WATER_ABSORB] = 100,
            [invaderXim.mod.WATER_SDT   ] = -10000,
            [invaderXim.mod.FIRE_SDT    ] = 9000,
            [invaderXim.mod.ICE_SDT     ] = 9000,
            [invaderXim.mod.EARTH_SDT   ] = 9000,
            [invaderXim.mod.WIND_SDT    ] = 9000,
            [invaderXim.mod.DARK_SDT    ] = 9000,
        },
    },

    -- Whenever an elemental dies the corresponding weak element morphs into a Mystic Avatar
    -- Each Elemental/Mystic Avatar weakens Carbuncle's elemental SDT as well as some bonus modifier
    {
        spawned = false,
        mobs =
        {
            'Fire_Elemental',
            'Mystic_Avatar_Ifrit',
        },

        death = utils.bind(content.handleElementalDeath, content, invaderXim.mod.FIRE_SDT, invaderXim.mod.ATTP, 50, 'Ice_Elemental'),
    },

    {
        spawned = false,
        mobs =
        {
            'Ice_Elemental',
            'Mystic_Avatar_Shiva',
        },

        -- TODO: Figure out the bonus modifier
        death = utils.bind(content.handleElementalDeath, content, invaderXim.mod.ICE_SDT, invaderXim.mod.MATT, 50, 'Air_Elemental'),
    },

    {
        spawned = false,
        mobs =
        {
            'Air_Elemental',
            'Mystic_Avatar_Garuda',
        },

        death = utils.bind(content.handleElementalDeath, content, invaderXim.mod.WIND_SDT, invaderXim.mod.EVA, 100, 'Earth_Elemental'),
    },

    {
        spawned = false,
        mobs =
        {
            'Earth_Elemental',
            'Mystic_Avatar_Titan',
        },

        death = utils.bind(content.handleElementalDeath, content, invaderXim.mod.EARTH_SDT, invaderXim.mod.UDMGPHYS, 5000, 'Thunder_Elemental'),
    },

    {
        spawned = false,
        mobs =
        {
            'Thunder_Elemental',
            'Mystic_Avatar_Ramuh',
        },

        death = utils.bind(content.handleElementalDeath, content, invaderXim.mod.THUNDER_SDT, invaderXim.mod.DOUBLE_ATTACK, 100, 'Water_Elemental'),
    },

    {
        spawned = false,
        mobs =
        {
            'Water_Elemental',
            'Mystic_Avatar_Leviathan',
        },

        death = utils.bind(content.handleElementalDeath, content, invaderXim.mod.WATER_SDT, invaderXim.mod.UDMGMAGIC, 5000, 'Fire_Elemental'),
    },

    {
        mobs  = { 'Light_Elemental' },
        death = utils.bind(weakenCarbuncle, content, invaderXim.mod.NONE, invaderXim.mod.DARK_SDT, 2500),
    },

    {
        mobs =
        {
            'Light_Elemental',
            'Mystic_Avatar_Carbuncle',
        },
        mobMods = { [invaderXim.mobMod.DETECTION] = invaderXim.detects.HEARING },
        isParty = true,
    },

    {
        mobs = { 'Mystic_Avatar_Carbuncle' },
        mods =
        {
            [invaderXim.mod.FIRE_SDT   ] = 9000,
            [invaderXim.mod.ICE_SDT    ] = 9000,
            [invaderXim.mod.WIND_SDT   ] = 9000,
            [invaderXim.mod.EARTH_SDT  ] = 9000,
            [invaderXim.mod.THUNDER_SDT] = 9000,
            [invaderXim.mod.WATER_SDT  ] = 9000,
            [invaderXim.mod.DARK_SDT   ] = 5000,
        },

        setup = function(battlefield, mobs)
            local mob = mobs[1]
            mob:addMod(invaderXim.mod.ATTP, 50)
            mob:addMod(invaderXim.mod.MATT, 50)
            mob:addMod(invaderXim.mod.EVA, 100)
            mob:addMod(invaderXim.mod.UDMGPHYS, 5000)
            mob:addMod(invaderXim.mod.DOUBLE_ATTACK, 100)
            mob:addMod(invaderXim.mod.UDMGMAGIC, 5000)
        end,

        death = function(battlefield, mob)
            npcUtil.showCrate(GetNPCByID(ID.npc.C2_LOOT_CRATE))
        end
    }
}

content.loot =
{
    [ID.npc.C2_LOOT_CRATE] =
    {
        {
            quantity = 6,
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.SQUARE_OF_ECARLATE_CLOTH, weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.DARK_ORICHALCUM_INGOT,    weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_SMALT_LEATHER,  weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_FILET_LACE,     weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.SPOOL_OF_COILED_YARN,     weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.PLAITED_CORD,             weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SHEET_OF_COBALT_MYTHRIL,  weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SPOOL_OF_LUMINIAN_THREAD, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,                     weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.UTOPIAN_GOLD_THREAD,      weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SQUARE_OF_SUPPLE_SKIN,    weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SPOOL_OF_SCARLET_ODOSHI,  weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SPOOL_OF_SILKWORM_THREAD, weight = invaderXim.loot.weight.LOW       },
        },

        {
            { item = invaderXim.item.CERULEAN_CHIP, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,       weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.METAL_CHIP, weight = invaderXim.loot.weight.VERY_LOW  },
        },
    }
}

return content:register()
