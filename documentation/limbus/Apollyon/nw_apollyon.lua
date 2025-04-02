-----------------------------------
-- Area: Apollyon
-- Name: NW Apollyon
-- !addkeyitem red_card
-- !addkeyitem cosmo_cleanse
-- !pos -600 -0.5 -600 38
-----------------------------------
local ID = zones[invaderXim.zone.APOLLYON]
-----------------------------------

local content = Limbus:new({
    zoneId           = invaderXim.zone.APOLLYON,
    battlefieldId    = invaderXim.battlefield.id.NW_APOLLYON,
    maxPlayers       = 18,
    timeLimit        = utils.minutes(30),
    index            = 1,
    area             = 2,
    entryNpc         = '_127',
    requiredKeyItems = { invaderXim.ki.COSMO_CLEANSE, invaderXim.ki.RED_CARD, message = ID.text.YOU_INSERT_THE_CARD_POLISHED },
    name             = 'NW_APOLLYON',
    lootCrateId      = ID.npc.NW_LOOT_CRATE,
    timeExtension   = 5,
})

function content:onBattlefieldInitialize(battlefield)
    Limbus.onBattlefieldInitialize(self, battlefield)

    for i, crateID in ipairs(ID.NW_APOLLYON.npc.TIME_CRATES) do
        npcUtil.showCrate(GetNPCByID(crateID))
    end

    for i, crateID in ipairs(ID.NW_APOLLYON.npc.RECOVER_CRATES) do
        npcUtil.showCrate(GetMobByID(crateID))
    end
end

local empowerBoss = function(battlefield, mobs)
    local boss = mobs[1]
    boss:addMod(invaderXim.mod.ATTP, 100)
    boss:addMod(invaderXim.mod.ACC, 50)
end

local depowerBoss = function(bossID)
    local boss = GetMobByID(bossID)
    if boss then
        boss:delMod(invaderXim.mod.ATTP, 100)
        boss:delMod(invaderXim.mod.ACC, 50)
    end
end

content.paths =
{
    [ID.mob.NW_PLUTO] =
    {
        { x = -458.0, y = 0.0, z =  46.0, wait = 5000 },
        { x = -458.0, y = 0.0, z = -14.0, wait = 5000 },
    },

    [ID.mob.NW_BARDHA_OFFSET] =
    {
        { x = -418.0, y = 0.0, z = 36.0, wait = 2500 },
        { x = -390.0, y = 0.0, z = 62.0, wait = 2500 },
    },

    [ID.mob.NW_BARDHA_OFFSET + 1] =
    {
        { x = -410.0, y = 0.0, z = 68.0, wait = 2500 },
        { x = -396.0, y = 0.0, z = 34.0, wait = 2500 },
    },

    [ID.mob.NW_BARDHA_OFFSET + 2] =
    {
        { x = -456.0, y = 0.0, z = 24.0, wait = 2500 },
        { x = -432.0, y = 0.0, z = 19.0, wait = 2500 },
    },

    [ID.mob.NW_BARDHA_OFFSET + 3] =
    {
        { x = -502.0, y = 0.0, z = 30.0, wait = 2500 },
        { x = -476.0, y = 0.0, z = 23.0, wait = 2500 },
    },

    [ID.mob.NW_BARDHA_OFFSET + 4] =
    {
        { x = -448.0, y = 0.0, z = 22.0, wait = 2500 },
        { x = -425.0, y = 0.0, z = 23.0, wait = 2500 },
    },

    [ID.mob.NW_BARDHA_OFFSET + 5] =
    {
        { x = -429.0, y = 0.0, z = -28.0, wait = 2500 },
        { x = -450.0, y = 0.0, z = -24.0, wait = 2500 },
    },

    [ID.mob.NW_BARDHA_OFFSET + 6] =
    {
        { x = -460.0, y = 0.0, z = 55.0, wait = 2500 },
        { x = -414.0, y = 0.0, z = 31.0, wait = 2500 },
    },

    [ID.mob.NW_ZLATOROG] =
    {
        { x = -384.0, y = 0.0,  z = 268.0, wait = 5000 },
        { x = -336.0, y = -0.5, z = 320.0, wait = 5000 },
    },

    [ID.mob.NW_MOUNTAIN_BUFFALO_OFFSET] =
    {
        { x = -306.0, y = 0.0, z = 317.0, wait = 5000 },
        { x = -295.0, y = 0.0, z = 354.0, wait = 5000 },
    },

    [ID.mob.NW_MOUNTAIN_BUFFALO_OFFSET + 1] =
    {
        { x = -329.0, y = 0.0, z = 283.0, wait = 5000 },
        { x = -345.0, y = 0.0, z = 281.0, wait = 5000 },
    },

    [ID.mob.NW_MOUNTAIN_BUFFALO_OFFSET + 2] =
    {
        { x = -334.0, y = 0.0, z = 222.0, wait = 5000 },
        { x = -373.0, y = 0.0, z = 252.0, wait = 5000 },
    },

    [ID.mob.NW_MOUNTAIN_BUFFALO_OFFSET + 3] =
    {
        { x = -334.0, y = 0.0,  z = 233.0, wait = 5000 },
        { x = -345.0, y = -1.0, z = 246.0, wait = 5000 },
    },

    [ID.mob.NW_MOUNTAIN_BUFFALO_OFFSET + 4] =
    {
        { x = -315.0, y = 0.0, z = 233.0, wait = 5000 },
        { x = -317.0, y = 0.0, z = 263.0, wait = 5000 },
    },

    [ID.mob.NW_MOUNTAIN_BUFFALO_OFFSET + 5] =
    {
        { x = -366.0, y = 0.0, z = 235.0, wait = 5000 },
        { x = -350.0, y = 0.0, z = 280.0, wait = 5000 },
    },

    [ID.mob.NW_MOUNTAIN_BUFFALO_OFFSET + 6] =
    {
        { x = -307.0, y = 0.0, z = 287.0, wait = 5000 },
        { x = -317.0, y = 0.0, z = 316.0, wait = 5000 },
    },

    [ID.mob.NW_APOLLYON_SCAVENGER_OFFSET] =
    {
        { x = -252.0, y = 0.0, z = 530.0, wait = 5000 },
        { x = -218.0, y = 0.0, z = 540.0, wait = 5000 },
    },

    [ID.mob.NW_APOLLYON_SCAVENGER_OFFSET + 1] =
    {
        { x = -310.0, y = 0.0, z = 485.0, wait = 10000 },
        { x = -293.0, y = 0.0, z = 505.0, wait = 10000 },
    },

    -- What happened with the one here? (ID: 16932966 as of Feb 4 2025)

    [ID.mob.NW_APOLLYON_SCAVENGER_OFFSET + 3] =
    {
        { x = -332.0, y = 0.0, z = 553.0, wait = 5000 },
        { x = -295.0, y = 0.0, z = 573.0, wait = 5000 },
    },

    [ID.mob.NW_APOLLYON_SCAVENGER_OFFSET + 4] =
    {
        { x = -324.0, y = 0.0, z = 590.0, wait = 5000 },
        { x = -290.0, y = 0.0, z = 557.0, wait = 5000 },
    },

    [ID.mob.NW_APOLLYON_SCAVENGER_OFFSET + 5] =
    {
        { x = -323.0, y = 0.0, z = 514.0, wait = 5000 },
        { x = -340.0, y = 0.0, z = 547.0, wait = 5000 },
    },

    [ID.mob.NW_APOLLYON_SCAVENGER_OFFSET + 6] =
    {
        { x = -308.0, y = 0.0, z = 494.0, wait = 10000 },
        { x = -337.0, y = 0.0, z = 522.0, wait = 10000 },
    },

    [ID.mob.NW_GORYNICH_OFFSET] =
    {
        { x = -567.0, y = 0.0, z = 603.0, wait = 10000 },
        { x = -537.0, y = 0.0, z = 637.0, wait = 10000 },
    },

    [ID.mob.NW_GORYNICH_OFFSET + 1] =
    {
        { x = -548.0, y = 0.0, z = 581.0, wait = 10000 },
        { x = -600.0, y = 0.0, z = 570.0, wait = 10000 },
    },

    [ID.mob.NW_GORYNICH_OFFSET + 2] =
    {
        { x = -615.0, y = 0.0, z = 531.0, wait = 10000 },
        { x = -583.0, y = 0.0, z = 571.0, wait = 10000 },
    },

    [ID.mob.NW_GORYNICH_OFFSET + 3] =
    {
        { x = -600.0, y = 0.0, z = 523.0, wait = 10000 },
        { x = -554.0, y = 0.0, z = 537.0, wait = 10000 },
    },

    [ID.mob.NW_GORYNICH_OFFSET + 4] =
    {
        { x = -555.0, y = 0.0, z = 614.0, wait = 10000 },
        { x = -529.0, y = 0.0, z = 630.0, wait = 10000 },
    },

    [ID.mob.NW_KAISER_BEHEMOTH] =
    {
        { x = -533.384, y = 0.000, z = 317.332 },
        { x = -572.622, y = 0.000, z = 321.561 },
        { x = -586.765, y = 0.000, z = 306.422 },
        { x = -592.706, y = 0.000, z = 271.736 },
        { x = -604.253, y = 0.000, z = 248.940 },
        { x = -590.466, y = 0.000, z = 232.526 },
        { x = -577.526, y = 0.000, z = 235.779 },
        { x = -564.415, y = 0.000, z = 244.076 },
        { x = -554.712, y = 0.000, z = 250.640 },
        { x = -534.004, y = 0.000, z = 248.469 },
        { x = -531.384, y = 0.000, z = 263.066 },
        { x = -524.566, y = 0.000, z = 290.070 },
        { x = -529.820, y = 0.000, z = 299.678 },
        { x = -530.384, y = 0.000, z = 305.172 },
        { x = -528.506, y = 0.000, z = 310.466 },
        { x = -536.660, y = 0.000, z = 317.356 },
    },
}

content.groups =
{
    {
        mobs = { 'Pluto' },
        mods =
        {
            [invaderXim.mod.GRAVITY_MEVA] = -25,
            [invaderXim.mod.BIND_MEVA   ] = -25,
        },

        setup = empowerBoss,
        death = function(battlefield, mob, count)
            invaderXim.limbus.spawnFrom(mob, ID.NW_APOLLYON.npc.ITEM_CRATES[1])
        end,
    },

    {
        mobs = { 'Bardha' },
        mods =
        {
            [invaderXim.mod.GRAVITY_MEVA] = -25,
            [invaderXim.mod.BIND_MEVA   ] = -25,
            [invaderXim.mod.SLEEP_MEVA  ] = -25,
        },

        allDeath = function(battlefield, mob)
            depowerBoss(ID.mob.NW_PLUTO)
        end,

        randomDeath = function(battlefield, mob)
            content:openDoor(battlefield, 1)
        end,
    },

    -- Floor 2
    {
        mobs = { 'Zlatorog' },
        mods =
        {
            [invaderXim.mod.GRAVITY_MEVA] = -25,
            [invaderXim.mod.BIND_MEVA   ] = -25,
            [invaderXim.mod.SLEEP_MEVA  ] = -25,
        },

        setup = empowerBoss,
        death = function(battlefield, mob, count)
            invaderXim.limbus.spawnFrom(mob, ID.NW_APOLLYON.npc.ITEM_CRATES[2])
        end,
    },

    {
        mobs = { 'Mountain_Buffalo' },
        mods =
        {
            [invaderXim.mod.GRAVITY_MEVA] = -25,
            [invaderXim.mod.BIND_MEVA   ] = -25,
            [invaderXim.mod.SLEEP_MEVA  ] = -25,
        },

        allDeath = function(battlefield, mob)
            depowerBoss(ID.mob.NW_ZLATOROG)
        end,

        randomDeath = function(battlefield, mob)
            content:openDoor(battlefield, 2)
        end,
    },

    -- Floor 3
    {
        mobs       = { 'Millenary_Mossback' },
        stationary = true,
        setup      = empowerBoss,
        death      = function(battlefield, mob, count)
            invaderXim.limbus.spawnFrom(mob, ID.NW_APOLLYON.npc.ITEM_CRATES[3])
        end,
    },

    {
        mobs = { 'Apollyon_Scavenger' },
        mods =
        {
            [invaderXim.mod.GRAVITY_MEVA] = -25,
            [invaderXim.mod.BIND_MEVA   ] = -25,
            [invaderXim.mod.SLEEP_MEVA  ] = -25,
        },

        stationary = true,
        allDeath   = function(battlefield, mob)
            depowerBoss(ID.mob.NW_MILLENARY_MOSSBACK)
        end,

        randomDeath = function(battlefield, mob)
            content:openDoor(battlefield, 3)
        end,
    },

    -- Floor 4
    {
        mobs = { 'Cynoprosopi' },
        mods =
        {
            [invaderXim.mod.GRAVITY_MEVA] = -25,
            [invaderXim.mod.BIND_MEVA   ] = -25,
        },

        setup = empowerBoss,
        death = function(battlefield, mob, count)
            invaderXim.limbus.spawnFrom(mob, ID.NW_APOLLYON.npc.ITEM_CRATES[4])
        end,
    },
    {
        --
        mobs = { 'Gorynich' },
        mods =
        {
            [invaderXim.mod.GRAVITY_MEVA] = -25,
            [invaderXim.mod.BIND_MEVA   ] = -25,
            [invaderXim.mod.SLEEP_MEVA  ] = -25,
        },

        allDeath = function(battlefield, mob)
            depowerBoss(ID.mob.NW_CYNOPROSOPI)
        end,

        randomDeath = function(battlefield, mob)
            content:openDoor(battlefield, 4)
        end,
    },

    -- Floor 5
    {
        mobs    = { 'Kaiser_Behemoth' },
        mobMods =
        {
            [invaderXim.mobMod.ALLI_HATE          ] = 50,
            [invaderXim.mobMod.MAGIC_COOL         ] = 30,
            [invaderXim.mobMod.SEVERE_SPELL_CHANCE] = 100,
        },

        setup = empowerBoss,
        death = function(battlefield, mob, count)
            npcUtil.showCrate(GetNPCByID(ID.npc.NW_LOOT_CRATE))
        end,
    },

    {
        mobs = { 'Kronprinz_Behemoth' },
        mods =
        {
            [invaderXim.mod.GRAVITY_MEVA] = -25,
            [invaderXim.mod.BIND_MEVA   ] = 25,
            [invaderXim.mod.SLEEP_MEVA  ] = 25,
        },

        mobMods    = { [invaderXim.mobMod.ALLI_HATE] = 50 },
        stationary = false,
        allDeath   = function(battlefield, mob)
            depowerBoss(ID.mob.NW_KAISER_BEHEMOTH)
        end,
    },
}

content.loot =
{
    [ID.NW_APOLLYON.npc.ITEM_CRATES[1]] =
    {
        {
            quantity = 2,
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,              weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.ARGYRO_RIVET,              weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SPOOL_OF_LIGHT_FILAMENT,   weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_BROWN_DOESKIN,   weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_FLAMESHUN_CLOTH, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,                     weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.SPOOL_OF_DIABOLIC_YARN,   weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.BLACK_RIVET,              weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SQUARE_OF_ASTRAL_LEATHER, weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.GOLD_STUD,                weight = invaderXim.loot.weight.LOW       },
        },
    },

    [ID.NW_APOLLYON.npc.ITEM_CRATES[2]] =
    {
        {
            quantity = 3,
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.SPOOL_OF_BENEDICT_YARN, weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SPOOL_OF_DIABOLIC_YARN, weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.POT_OF_EBONY_LACQUER,   weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_CANVAS_TOILE, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,                weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.ANCIENT_BRASS_INGOT, weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.WHITE_RIVET,         weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.BLUE_RIVET,          weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.ELECTRUM_STUD,       weight = invaderXim.loot.weight.LOW       },
        },
    },

    [ID.NW_APOLLYON.npc.ITEM_CRATES[3]] =
    {
        {
            quantity = 4,
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,              weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.ANCIENT_BRASS_INGOT,       weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_CHARCOAL_COTTON, weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.BLUE_RIVET,                weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_CORDUROY_CLOTH,  weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,                    weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.SPOOL_OF_BENEDICT_YARN,  weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SPOOL_OF_LIGHT_FILAMENT, weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SQUARE_OF_BROWN_DOESKIN, weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SQUARE_OF_CANVAS_TOILE,  weight = invaderXim.loot.weight.LOW       },
        },

        {
            quantity = 2,
            { item = invaderXim.item.NONE,                    weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.CHUNK_OF_ADAMAN_ORE,     weight = invaderXim.loot.weight.VERY_LOW  },
            { item = invaderXim.item.HANDFUL_OF_CLOT_PLASMA,  weight = invaderXim.loot.weight.VERY_LOW  },
            { item = invaderXim.item.DARKSTEEL_SHEET,         weight = invaderXim.loot.weight.VERY_LOW  },
            { item = invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,  weight = invaderXim.loot.weight.VERY_LOW  },
            { item = invaderXim.item.PIECE_OF_OXBLOOD,        weight = invaderXim.loot.weight.VERY_LOW  },
            { item = invaderXim.item.LIGHT_STEEL_INGOT,       weight = invaderXim.loot.weight.VERY_LOW  },
            { item = invaderXim.item.SPOOL_OF_RAINBOW_THREAD, weight = invaderXim.loot.weight.VERY_LOW  },
            { item = invaderXim.item.PONZE_OF_SHELL_POWDER,   weight = invaderXim.loot.weight.VERY_LOW  },
        },

        {
            { item = invaderXim.item.NONE,              weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },
    },

    [ID.NW_APOLLYON.npc.ITEM_CRATES[4]] =
    {
        {
            quantity = 5,
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            quantity = 2,
            { item = invaderXim.item.NONE,              weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.SQUARE_OF_CARDINAL_CLOTH, weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.FETID_LANOLIN_CUBE,       weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SHEET_OF_KUROGANE,        weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.ELECTRUM_STUD,            weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,                      weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.ARGYRO_RIVET,              weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.POT_OF_EBONY_LACQUER,      weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SQUARE_OF_CHARCOAL_COTTON, weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SQUARE_OF_FLAMESHUN_CLOTH, weight = invaderXim.loot.weight.LOW       },
        },
    },

    [ID.npc.NW_LOOT_CRATE] =
    {
        {
            quantity = 6,
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.WHITE_RIVET,              weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.BLACK_RIVET,              weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_ASTRAL_LEATHER, weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.GOLD_STUD,                weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,                     weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.SQUARE_OF_CARDINAL_CLOTH, weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.FETID_LANOLIN_CUBE,       weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SHEET_OF_KUROGANE,        weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SQUARE_OF_CORDUROY_CLOTH, weight = invaderXim.loot.weight.LOW       },
        },

        {
            { item = invaderXim.item.MAGENTA_CHIP, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,       weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.METAL_CHIP, weight = invaderXim.loot.weight.VERY_LOW  },
        },
    },
}

return content:register()
