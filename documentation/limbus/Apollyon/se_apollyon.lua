-----------------------------------
-- Area: Apollyon
-- Name: SE Apollyon
-- !addkeyitem black_card
-- !addkeyitem cosmo_cleanse
-- !pos 600 -0.5 -600 38
-----------------------------------
local ID = zones[invaderXim.zone.APOLLYON]
-----------------------------------

local content = Limbus:new({
    zoneId           = invaderXim.zone.APOLLYON,
    battlefieldId    = invaderXim.battlefield.id.SE_APOLLYON,
    maxPlayers       = 18,
    timeLimit        = utils.minutes(30),
    index            = 2,
    area             = 3,
    entryNpc         = '_12i',
    requiredKeyItems = { invaderXim.ki.COSMO_CLEANSE, invaderXim.ki.BLACK_CARD, message = ID.text.YOU_INSERT_THE_CARD_POLISHED },
    lossEventParams  = { [5] = 1 },
    name             = 'SE_APOLLYON',
    lootCrateId      = ID.npc.SE_LOOT_CRATE,
    exitLocation     = 1,
    timeExtension    = 10,
})

content.paths =
{
    [ID.mob.SE_TIEHOLTSODI] =
    {
        { x = 151.0, y = 0.0, z = -528.0,  wait = 10000 },
        { x = 147.0, y = 0.0, z = -468.05, wait = 10000 },
    },

    [ID.mob.SE_ADAMANTSHELL_OFFSET] =
    {
        { x = 138.0, y = -2.0,  z = -496.0, wait = 2500 },
        { x = 142.0, y = -1.11, z = -500.0, wait = 2500 },
    },

    [ID.mob.SE_ADAMANTSHELL_OFFSET + 1] =
    {
        { x = 139.0, y = -2.0, z = -496.0, wait = 2500 },
        { x = 138.0, y =  0.0, z = -485.0, wait = 2500 },
    },

    [ID.mob.SE_ADAMANTSHELL_OFFSET + 2] =
    {
        { x = 129.0, y =  0.0, z = -504.0, wait = 2500 },
        { x = 138.0, y = -2.0, z = -497.0, wait = 2500 },
    },

    [ID.mob.SE_ADAMANTSHELL_OFFSET + 3] =
    {
        { x = 183.0, y = 0.0, z = -554.0, wait = 2500 },
        { x = 185.0, y = 0.0, z = -535.0, wait = 2500 },
    },

    [ID.mob.SE_ADAMANTSHELL_OFFSET + 4] =
    {
        { x = 185.0, y = 0.0, z = -535.0, wait = 2500 },
        { x = 183.0, y = 0.0, z = -554.0, wait = 2500 },
    },

    [ID.mob.SE_ADAMANTSHELL_OFFSET + 5] =
    {
        { x = 195.0, y = 0.0, z = -446.0, wait = 2500 },
        { x = 215.0, y = 0.0, z = -436.0, wait = 2500 },
    },

    [ID.mob.SE_ADAMANTSHELL_OFFSET + 6] =
    {
        { x = 212.0, y = 0.0, z = -441.0, wait = 2500 },
        { x = 192.0, y = 0.0, z = -441.0, wait = 2500 },
    },

    [ID.mob.SE_ADAMANTSHELL_OFFSET + 7] =
    {
        { x = 190.0, y = 0.0, z = -436.0, wait = 2500 },
        { x = 208.0, y = 0.0, z = -448.0, wait = 2500 },
    },

    [ID.mob.SE_FLYING_SPEAR_OFFSET] =
    {
        { x = 505.0, y = 0.0, z = -305.0, wait = 10000 },
        { x = 490.0, y = 0.0, z = -287.0, wait = 10000 },
    },

    [ID.mob.SE_FLYING_SPEAR_OFFSET + 1] =
    {
        { x = 558.0, y = 0.0, z = -348.0, wait = 10000 },
        { x = 540.0, y = 0.0, z = -347.0, wait = 10000 },
    },

    [ID.mob.SE_FLYING_SPEAR_OFFSET + 2] =
    {
        { x = 619.0, y = 0.0, z = -337.0, wait = 10000 },
        { x = 633.0, y = 0.0, z = -332.0, wait = 10000 },
    },

    [ID.mob.SE_FLYING_SPEAR_OFFSET + 3] =
    {
        { x = 600.0, y = 0.0, z = -381.0, wait = 10000 },
        { x = 599.0, y = 0.0, z = -365.0, wait = 10000 },
    },

    [ID.mob.SE_FLYING_SPEAR_OFFSET + 4] =
    {
        { x = 541.0, y = 0.0, z = -368.0, wait = 10000 },
        { x = 530.0, y = 0.0, z = -353.0, wait = 10000 },
    },

    [ID.mob.SE_FLYING_SPEAR_OFFSET + 5] =
    {
        { x = 560.0, y = 0.0, z = -346.0, wait = 10000 },
        { x = 538.0, y = 0.0, z = -353.0, wait = 10000 },
    },

    [ID.mob.SE_FLYING_SPEAR_OFFSET + 6] =
    {
        { x = 616.0, y = 0.0, z = -380.0, wait = 10000 },
        { x = 610.0, y = 0.0, z = -364.0, wait = 10000 },
    },

    [ID.mob.SE_FLYING_SPEAR_OFFSET + 7] =
    {
        { x = 577.0, y = 0.0, z = -367.0, wait = 10000 },
        { x = 560.0, y = 0.0, z = -314.0, wait = 10000 },
    },
}

local floorThreeCratePositions =
{
    { 366.000, -0.500, -313.000 },
    { 313.021,  0.000, -317.754 },
    { 376.097,  0.000, -259.382 },
    { 321.552,  0.000, -293.187 },
    { 337.399, -0.388, -313.442 },
    { 354.661, -0.072, -273.424 },
}

content.groups =
{
    -- Floor 1
    {
        -- Boss
        mobs       = { 'Ghost_Clot' },
        stationary = true,
        mods =
        {
            [invaderXim.mod.IMPACT_SDT] = 0,
            [invaderXim.mod.HTH_SDT   ] = 0,
            [invaderXim.mod.SLASH_SDT ] = 1250,
        },

        death = function(battlefield, mob, count)
            content:openDoor(mob:getBattlefield(), 1)
        end,
    },
    {
        mobs       = { 'Metalloid_Amoeba' },
        stationary = true,
        mods =
        {
            [invaderXim.mod.IMPACT_SDT] = 0,
            [invaderXim.mod.HTH_SDT   ] = 0,
            [invaderXim.mod.SLASH_SDT ] = 1250,
        },

        death = function(battlefield, mob, count)
            if count == 2 then
                invaderXim.limbus.spawnFrom(mob, ID.SE_APOLLYON.npc.TIME_CRATES[1])
            elseif count == 4 then
                invaderXim.limbus.spawnRecoverFrom(mob, ID.SE_APOLLYON.npc.RECOVER_CRATES[1])
            elseif count == 8 then
                invaderXim.limbus.spawnFrom(mob, ID.SE_APOLLYON.npc.ITEM_CRATES[1])
            end
        end,
    },

    -- Floor 2
    {
        mobs = { 'Tieholtsodi' },
        mods =
        {
            [invaderXim.mod.SLASH_SDT ] = 0,
            [invaderXim.mod.PIERCE_SDT] = 1250,
        },

        death = function(battlefield, mob, count)
            content:openDoor(mob:getBattlefield(), 2)
        end,
    },
    {
        mobs = { 'Adamantshell' },
        mods =
        {
            [invaderXim.mod.SLASH_SDT ] = 0,
            [invaderXim.mod.PIERCE_SDT] = 1250,
        },

        death = function(battlefield, mob, count)
            if count == 2 then
                npcUtil.showCrate(GetNPCByID(ID.SE_APOLLYON.npc.TIME_CRATES[2]))
            elseif count == 4 then
                invaderXim.limbus.showRecoverCrate(ID.SE_APOLLYON.npc.RECOVER_CRATES[2])
            elseif count == 8 then
                npcUtil.showCrate(GetNPCByID(ID.SE_APOLLYON.npc.ITEM_CRATES[2]))
            end
        end,
    },

    -- Floor 3
    {
        mobs       = { 'Grave_Digger' },
        stationary = true,
        mods =
        {
            [invaderXim.mod.PIERCE_SDT] = 0,
            [invaderXim.mod.IMPACT_SDT] = 1250,
            [invaderXim.mod.HTH_SDT   ] = 1250,
        },

        death = function(battlefield, mob, count)
            content:openDoor(mob:getBattlefield(), 3)
        end,
    },
    {
        mobs = { 'Inhumer' },
        mods =
        {
            [invaderXim.mod.PIERCE_SDT] = 0,
            [invaderXim.mod.IMPACT_SDT] = 1250,
            [invaderXim.mod.HTH_SDT   ] = 1250,
        },

        setup = function(battlefield, mobs)
            local timeCrateIndex, recoverCrateIndex, itemCrateIndex = unpack(utils.uniqueRandomTable(1, 6, 3))

            battlefield:setLocalVar('timeCrateIndex', timeCrateIndex)
            battlefield:setLocalVar('recoverCrateIndex', recoverCrateIndex)
            battlefield:setLocalVar('itemCrateIndex', itemCrateIndex)
        end,

        death = function(battlefield, mob, count)
            if count == 2 then
                local crate = GetNPCByID(ID.SE_APOLLYON.npc.TIME_CRATES[3])
                if crate then
                    crate:setPos(floorThreeCratePositions[battlefield:getLocalVar('timeCrateIndex')])
                    npcUtil.showCrate(GetNPCByID(ID.SE_APOLLYON.npc.TIME_CRATES[3]))
                end
            elseif count == 4 then
                local crate = GetMobByID(ID.SE_APOLLYON.npc.RECOVER_CRATES[3])
                if crate then
                    crate:setPos(floorThreeCratePositions[battlefield:getLocalVar('recoverCrateIndex')])
                    invaderXim.limbus.showRecoverCrate(ID.SE_APOLLYON.npc.RECOVER_CRATES[3])
                end
            elseif count == 8 then
                local crate = GetNPCByID(ID.SE_APOLLYON.npc.ITEM_CRATES[3])
                if crate then
                    crate:setPos(floorThreeCratePositions[battlefield:getLocalVar('itemCrateIndex')])
                    npcUtil.showCrate(GetNPCByID(ID.SE_APOLLYON.npc.ITEM_CRATES[3]))
                end
            end
        end,
    },

    -- Floor 4
    {
        mobs       = { 'Evil_Armory' },
        stationary = true,
        mods =
        {
            [invaderXim.mod.UDMGPHYS           ] = -8000,
            [invaderXim.mod.NULL_MAGICAL_DAMAGE] = 100,
        },

        setup = function(battlefield, mobs)
            for _, mob in ipairs(mobs) do
                -- Prevent boss from being targetable until first mob Flying_Spear is killed
                mob:setBattleID(1)
                mob:setStatus(invaderXim.status.NORMAL)
                mob:setMobMod(invaderXim.mobMod.NO_AGGRO, 1)
                mob:setMobMod(invaderXim.mobMod.NO_LINK, 1)
            end
        end,

        allDeath = function(battlefield, mob)
            npcUtil.showCrate(GetNPCByID(ID.npc.SE_LOOT_CRATE))
        end
    },
    {
        mobs = { 'Flying_Spear' },
        mods =
        {
            [invaderXim.mod.NULL_MAGICAL_DAMAGE] = 100,
        },

        death = function(battlefield, mob, count)
            local boss = mob:getZone():queryEntitiesByName('Evil_Armory')[1]
            boss:setMod(invaderXim.mod.UDMGPHYS, (8 - count) * -1000)

            if count == 1 then
                -- Make the boss become targetable after the first kill
                boss:setBattleID(0)
                boss:setStatus(invaderXim.status.UPDATE)
                boss:setMobMod(invaderXim.mobMod.NO_AGGRO, 0)
                boss:setMobMod(invaderXim.mobMod.NO_LINK, 0)
            end
        end,

        allDeath = function(battlefield, mob)
            local boss = mob:getZone():queryEntitiesByName('Evil_Armory')[1]
            boss:setMod(invaderXim.mod.NULL_MAGICAL_DAMAGE, 0)
        end,
    },
}

content.loot =
{
    [ID.SE_APOLLYON.npc.ITEM_CRATES[1]] =
    {
        {
            quantity = 5,
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,              weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.SPOOL_OF_BENEDICT_YARN,    weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SHEET_OF_KUROGANE,         weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.POT_OF_EBONY_LACQUER,      weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_FLAMESHUN_CLOTH, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,                    weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.ARGYRO_RIVET,            weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SPOOL_OF_BENEDICT_YARN,  weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SQUARE_OF_BROWN_DOESKIN, weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SQUARE_OF_CANVAS_TOILE,  weight = invaderXim.loot.weight.LOW       },
        },

        {
            { item = invaderXim.item.NONE,              weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },
    },

    [ID.SE_APOLLYON.npc.ITEM_CRATES[2]] =
    {
        {
            quantity = 5,
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,              weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.ANCIENT_BRASS_INGOT,      weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_CARDINAL_CLOTH, weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_BROWN_DOESKIN,  weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.ELECTRUM_STUD,            weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,                      weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.SQUARE_OF_CARDINAL_CLOTH,  weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.WHITE_RIVET,               weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.POT_OF_EBONY_LACQUER,      weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SQUARE_OF_FLAMESHUN_CLOTH, weight = invaderXim.loot.weight.LOW       },
        },

        {
            { item = invaderXim.item.NONE,              weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },
    },

    [ID.SE_APOLLYON.npc.ITEM_CRATES[3]] =
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
            { item = invaderXim.item.ARGYRO_RIVET,             weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SPOOL_OF_DIABOLIC_YARN,   weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_ASTRAL_LEATHER, weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.GOLD_STUD,                weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,                      weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.SPOOL_OF_LIGHT_FILAMENT,   weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.BLACK_RIVET,               weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SQUARE_OF_CHARCOAL_COTTON, weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SQUARE_OF_CORDUROY_CLOTH,  weight = invaderXim.loot.weight.LOW       },
        },

        {
            { item = invaderXim.item.NONE,                   weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.SPOOL_OF_DIABOLIC_YARN, weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.FETID_LANOLIN_CUBE,     weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.BLUE_RIVET,             weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.ELECTRUM_STUD,          weight = invaderXim.loot.weight.LOW       },
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

    [ID.npc.SE_LOOT_CRATE] =
    {
        {
            quantity = 5,
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.SPOOL_OF_LIGHT_FILAMENT,  weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.WHITE_RIVET,              weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.BLUE_RIVET,               weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_CORDUROY_CLOTH, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.BLACK_RIVET,               weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.FETID_LANOLIN_CUBE,        weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_CHARCOAL_COTTON, weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_CANVAS_TOILE,    weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,                     weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.ANCIENT_BRASS_INGOT,      weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SHEET_OF_KUROGANE,        weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SQUARE_OF_ASTRAL_LEATHER, weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.GOLD_STUD,                weight = invaderXim.loot.weight.LOW       },
        },

        {
            { item = invaderXim.item.SMALT_CHIP, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,       weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.METAL_CHIP, weight = invaderXim.loot.weight.VERY_LOW  },
        },
    },
}

return content:register()
