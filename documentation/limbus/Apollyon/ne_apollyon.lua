-----------------------------------
-- Area: Apollyon
-- Name: NE Apollyon
-- !addkeyitem black_card
-- !addkeyitem cosmo_cleanse
-- !pos 600 -0.5 -600 38
-----------------------------------
local ID = zones[invaderXim.zone.APOLLYON]
-----------------------------------

local content = Limbus:new({
    zoneId           = invaderXim.zone.APOLLYON,
    battlefieldId    = invaderXim.battlefield.id.NE_APOLLYON,
    maxPlayers       = 18,
    timeLimit        = utils.minutes(30),
    index            = 3,
    area             = 4,
    entryNpc         = '_12i',
    requiredKeyItems = { invaderXim.ki.COSMO_CLEANSE, invaderXim.ki.BLACK_CARD, message = ID.text.YOU_INSERT_THE_CARD_POLISHED },
    lossEventParams  = { [5] = 1 },
    name             = 'NE_APOLLYON',
    lootCrateId      = ID.npc.NE_LOOT_CRATE,
    exitLocation     = 1,
    timeExtension    = 5,
})

function content:onBattlefieldInitialize(battlefield)
    Limbus.onBattlefieldInitialize(self, battlefield)

    for i, crateID in ipairs(ID.NE_APOLLYON.npc.TIME_CRATES) do
        npcUtil.showCrate(GetNPCByID(crateID))
    end

    for i, crateID in ipairs(ID.NE_APOLLYON.npc.RECOVER_CRATES) do
        npcUtil.showCrate(GetMobByID(crateID))
    end
end

content.paths =
{
    [ID.mob.NE_GOOBBUE_HARVESTER] =
    {
        { x = 425.0, y = 0.0, z = 22.0, wait = 1000 },
        { x = 475.0, y = 0.0, z = 22.0, wait = 1000 },
    },

    [ID.mob.NE_TROGLODYTE_DHALMEL_OFFSET] =
    {
        { x = 525.0, y = -0.5, z = 315.0 },
        { x = 550.0, y = -0.5, z = 310.0 },
        { x = 580.0, y = -0.5, z = 300.0 },
        { x = 588.0, y = -0.5, z = 285.0 },
        { x = 580.0, y = -0.5, z = 300.0 },
        { x = 550.0, y = -0.5, z = 310.0 },
    },

    [ID.mob.NE_TROGLODYTE_DHALMEL_OFFSET + 1] =
    {
        { x = 550.0, y = -0.5, z = 310.0 },
        { x = 580.0, y = -0.5, z = 300.0 },
        { x = 588.0, y = -0.5, z = 285.0 },
        { x = 585.0, y = -0.5, z = 265.0 },
        { x = 588.0, y = -0.5, z = 285.0 },
        { x = 580.0, y = -0.5, z = 300.0 },
    },

    [ID.mob.NE_TROGLODYTE_DHALMEL_OFFSET + 2] =
    {
        { x = 580.0, y = -0.5, z = 300.0 },
        { x = 588.0, y = -0.5, z = 285.0 },
        { x = 585.0, y = -0.5, z = 265.0 },
        { x = 565.0, y = -0.5, z = 250.0 },
        { x = 585.0, y = -0.5, z = 265.0 },
        { x = 588.0, y = -0.5, z = 285.0 },
    },

    [ID.mob.NE_TROGLODYTE_DHALMEL_OFFSET + 3] =
    {
        { x = 588.0, y = -0.5, z = 285.0 },
        { x = 585.0, y = -0.5, z = 265.0 },
        { x = 565.0, y = -0.5, z = 250.0 },
        { x = 540.0, y = -0.5, z = 260.0 },
        { x = 565.0, y = -0.5, z = 250.0 },
        { x = 585.0, y = -0.5, z = 265.0 },
    },

    [ID.mob.NE_TROGLODYTE_DHALMEL_OFFSET + 4] =
    {
        { x = 585.0, y = -0.5, z = 265.0 },
        { x = 565.0, y = -0.5, z = 250.0 },
        { x = 540.0, y = -0.5, z = 260.0 },
        { x = 530.0, y = -0.5, z = 280.0 },
        { x = 540.0, y = -0.5, z = 260.0 },
        { x = 565.0, y = -0.5, z = 250.0 },
    },

    [ID.mob.NE_TROGLODYTE_DHALMEL_OFFSET + 5] =
    {
        { x = 565.0, y = -0.5, z = 250.0 },
        { x = 540.0, y = -0.5, z = 260.0 },
        { x = 530.0, y = -0.5, z = 280.0 },
        { x = 525.0, y = -0.5, z = 315.0 },
        { x = 530.0, y = -0.5, z = 280.0 },
        { x = 540.0, y = -0.5, z = 260.0 },
    },

    [ID.mob.NE_TROGLODYTE_DHALMEL_OFFSET + 6] =
    {
        { x = 540.0, y = -0.5, z = 260.0 },
        { x = 530.0, y = -0.5, z = 280.0 },
        { x = 525.0, y = -0.5, z = 315.0 },
        { x = 550.0, y = -0.5, z = 310.0 },
        { x = 525.0, y = -0.5, z = 315.0 },
        { x = 530.0, y = -0.5, z = 280.0 },
    },

    [ID.mob.NE_TROGLODYTE_DHALMEL_OFFSET + 7] =
    {
        { x = 530.0, y = -0.5, z = 280.0 },
        { x = 525.0, y = -0.5, z = 315.0 },
        { x = 550.0, y = -0.5, z = 310.0 },
        { x = 580.0, y = -0.5, z = 300.0 },
        { x = 550.0, y = -0.5, z = 310.0 },
        { x = 525.0, y = -0.5, z = 315.0 },
    },

}

content.groups =
{
    -- Floor 1
    {
        mobs       = { 'Barometz_Boss', 'Borametz_Boss', 'Goobbue_Harvester' },
        stationary = false,
        setup      = function(battlefield, mobs)
            local bosses = utils.shuffle(mobs)
            bosses[1]:setLocalVar('item', 1)
            bosses[2]:setLocalVar('vortex', 1)
        end,

        death = function(battlefield, mob, count)
            if mob:getLocalVar('item') == 1 then
                invaderXim.limbus.spawnFrom(mob, ID.NE_APOLLYON.npc.ITEM_CRATES[1])
            elseif mob:getLocalVar('vortex') == 1 then
                content:openDoor(battlefield, 1)
            end
        end,
    },

    {
        mobs       = { 'Barometz', 'Borametz', 'Barometz_Boss', 'Borametz_Boss' },
        mobMods    = { [invaderXim.mobMod.ALLI_HATE] = 50 },
        stationary = false,
    },

    -- Floor 2
    {
        mobs    = { 'Bialozar_Boss' },
        mobMods = { [invaderXim.mobMod.DETECTION] = invaderXim.detects.HEARING },
        death   = function(battlefield, mob, count)
            invaderXim.limbus.spawnFrom(mob, ID.NE_APOLLYON.npc.ITEM_CRATES[2])
        end,
    },

    {
        mobs = { 'Sirin', 'Cornu' },
    },

    {
        -- Bialozar and Thiazi x2
        mobs        = { 'Bialozar', 'Thiazi' },
        mobMods     = { [invaderXim.mobMod.DETECTION] = invaderXim.detects.HEARING },
        randomDeath = function(battlefield, mob)
            content:openDoor(battlefield, 2)

            -- Determine which mobs should be in floor three and add their group
            local sweepers =
            {
                mobIds      = {},
                randomDeath = function(battlefieldInner, sweeperMob)
                    content:openDoor(battlefieldInner, 3)
                end,
            }

            local cleanersLarge =
            {
                mobIds = {},
                stationary = false,

                randomDeath = function(battlefieldInner, cleanerMob)
                    invaderXim.limbus.spawnFrom(cleanerMob, ID.NE_APOLLYON.npc.ITEM_CRATES[3])
                end,
            }

            local cleanersSmall =
            {
                -- Apollyon Cleaners (Small)
                mobIds     = {},
                stationary = false,
            }

            -- Every 6 players we add another group of mobs (1 Sweeper and 4 Cleaners)
            table.insert(sweepers.mobIds, ID.mob.NE_APOLLYON_SWEEPER_OFFSET)
            table.insert(cleanersLarge.mobIds, ID.mob.NE_APOLLYON_SWEEPER_OFFSET + 1)
            table.insert(cleanersSmall.mobIds, ID.mob.NE_APOLLYON_SWEEPER_OFFSET + 2)
            table.insert(cleanersSmall.mobIds, ID.mob.NE_APOLLYON_SWEEPER_OFFSET + 3)
            table.insert(cleanersSmall.mobIds, ID.mob.NE_APOLLYON_SWEEPER_OFFSET + 4)

            local playerCount = #battlefield:getPlayers()

            if playerCount > 6 then
                table.insert(sweepers.mobIds, ID.mob.NE_APOLLYON_SWEEPER_OFFSET + 5)
                table.insert(cleanersLarge.mobIds, ID.mob.NE_APOLLYON_SWEEPER_OFFSET + 6)
                table.insert(cleanersSmall.mobIds, ID.mob.NE_APOLLYON_SWEEPER_OFFSET + 7)
                table.insert(cleanersSmall.mobIds, ID.mob.NE_APOLLYON_SWEEPER_OFFSET + 8)
                table.insert(cleanersSmall.mobIds, ID.mob.NE_APOLLYON_SWEEPER_OFFSET + 9)

                if playerCount > 12 then
                    table.insert(sweepers.mobIds, ID.mob.NE_APOLLYON_SWEEPER_OFFSET + 10)
                    table.insert(cleanersLarge.mobIds, ID.mob.NE_APOLLYON_SWEEPER_OFFSET + 11)
                    table.insert(cleanersSmall.mobIds, ID.mob.NE_APOLLYON_SWEEPER_OFFSET + 12)
                    table.insert(cleanersSmall.mobIds, ID.mob.NE_APOLLYON_SWEEPER_OFFSET + 13)
                    table.insert(cleanersSmall.mobIds, ID.mob.NE_APOLLYON_SWEEPER_OFFSET + 14)
                end
            end

            battlefield:addGroups({ sweepers, cleanersLarge, cleanersSmall }, false)
        end,
    },

    -- Floor 3
    -- These mobs are added in the above group when the floor door opens

    -- Floor 4
    {
        mobs        = { 'Hyperion', 'Okeanos', 'Cronos' },
        stationary  = false,
        randomDeath = function(battlefield, mob)
            content:openDoor(mob:getBattlefield(), 4)
        end,
    },

    {
        mobs = { 'Hyperion' },
        mods = { [invaderXim.mod.NULL_MAGICAL_DAMAGE] = 100 },
    },

    {
        mobs = { 'Okeanos' },
        mods = { [invaderXim.mod.NULL_RANGED_DAMAGE] = 100 },
    },

    {
        mobs = { 'Cronos' },
        mods = { [invaderXim.mod.NULL_PHYSICAL_DAMAGE] = 100 },
    },

    {
        mobs       = { 'Kerkopes_Boss' },
        stationary = false,
        death      = function(battlefield, mob, count)
            invaderXim.limbus.spawnFrom(mob, ID.NE_APOLLYON.npc.ITEM_CRATES[4])
        end,
    },

    {
        mobs       = { 'Kerkopes' },
        stationary = false,
    },

    -- Floor 5
    {
        mobs     = { 'Troglodyte_Dhalmel' },
        allDeath = function(battlefield, mob)
            npcUtil.showCrate(GetNPCByID(ID.npc.NE_LOOT_CRATE))
        end,
    },

    {
        mobs = { 'Criosphinx', 'Hieracosphinx' },
        mods =
        {
            [invaderXim.mod.GRAVITY_MEVA] = 75,
            [invaderXim.mod.BIND_MEVA   ] = 75,
            [invaderXim.mod.SLEEP_MEVA  ] = 75,
        },
    }
}

content.loot =
{
    [ID.NE_APOLLYON.npc.ITEM_CRATES[1]] =
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
            { item = invaderXim.item.SQUARE_OF_CARDINAL_CLOTH,  weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_CHARCOAL_COTTON, weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_ASTRAL_LEATHER,  weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.GOLD_STUD,                 weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,               weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.BLACK_RIVET,        weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.FETID_LANOLIN_CUBE, weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SHEET_OF_KUROGANE,  weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.ELECTRUM_STUD,      weight = invaderXim.loot.weight.LOW       },
        },

        {
            { item = invaderXim.item.NONE,              weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },
    },

    [ID.NE_APOLLYON.npc.ITEM_CRATES[2]] =
    {
        {
            quantity = 3,
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,              weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.ARGYRO_RIVET,              weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.FETID_LANOLIN_CUBE,        weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SHEET_OF_KUROGANE,         weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_FLAMESHUN_CLOTH, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,                      weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.ANCIENT_BRASS_INGOT,       weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SQUARE_OF_CHARCOAL_COTTON, weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SQUARE_OF_BROWN_DOESKIN,   weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SQUARE_OF_CANVAS_TOILE,    weight = invaderXim.loot.weight.LOW       },
        },

        {
            { item = invaderXim.item.NONE,              weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },
    },

    [ID.NE_APOLLYON.npc.ITEM_CRATES[3]] =
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
            { item = invaderXim.item.SPOOL_OF_BENEDICT_YARN,  weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SPOOL_OF_LIGHT_FILAMENT, weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.BLUE_RIVET,              weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.ELECTRUM_STUD,           weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,                     weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.SQUARE_OF_CARDINAL_CLOTH, weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.WHITE_RIVET,              weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SQUARE_OF_ASTRAL_LEATHER, weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SQUARE_OF_CORDUROY_CLOTH, weight = invaderXim.loot.weight.LOW       },
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
    },

    [ID.NE_APOLLYON.npc.ITEM_CRATES[4]] =
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
            { item = invaderXim.item.SPOOL_OF_DIABOLIC_YARN,   weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.BLACK_RIVET,              weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.POT_OF_EBONY_LACQUER,     weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_CORDUROY_CLOTH, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,                    weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.ARGYRO_RIVET,            weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SPOOL_OF_LIGHT_FILAMENT, weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.BLUE_RIVET,              weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.GOLD_STUD,               weight = invaderXim.loot.weight.LOW       },
        },
    },

    [ID.npc.NE_LOOT_CRATE] =
    {
        {
            quantity = 6,
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.ANCIENT_BRASS_INGOT,     weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.WHITE_RIVET,             weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_BROWN_DOESKIN, weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_CANVAS_TOILE,  weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,                      weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.SPOOL_OF_BENEDICT_YARN,    weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SPOOL_OF_DIABOLIC_YARN,    weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.POT_OF_EBONY_LACQUER,      weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SQUARE_OF_FLAMESHUN_CLOTH, weight = invaderXim.loot.weight.LOW       },
        },

        {
            { item = invaderXim.item.SMOKY_CHIP, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,       weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.METAL_CHIP, weight = invaderXim.loot.weight.VERY_LOW  },
        },
    },
}

return content:register()
