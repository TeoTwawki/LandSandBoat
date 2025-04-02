-----------------------------------
-- Area: Temenos
-- Name: Central Temenos 3rrd Floor
-- !addkeyitem white_card
-- !addkeyitem cosmo_cleanse
-- !additem ivory_chip
-- !pos 580.000 -2.375 104.000 37
-----------------------------------
local ID = zones[invaderXim.zone.TEMENOS]
-----------------------------------

local content = Limbus:new({
    zoneId           = invaderXim.zone.TEMENOS,
    battlefieldId    = invaderXim.battlefield.id.CENTRAL_TEMENOS_3RD_FLOOR,
    maxPlayers       = 18,
    timeLimit        = utils.minutes(45),
    index            = 4,
    area             = 5,
    entryNpc         = 'Matter_Diffusion_Module',
    requiredKeyItems = { invaderXim.ki.COSMO_CLEANSE, invaderXim.ki.WHITE_CARD, message = ID.text.YOU_INSERT_THE_CARD_POLISHED },
    requiredItems    = { invaderXim.item.IVORY_CHIP },
    name             = 'CENTRAL_TEMENOS_3RD_FLOOR',
    lootCrateId      = ID.npc.C3_LOOT_CRATE,
})

function content:handleWeakenBoss(name, battlefield, mob)
    local boss = mob:getZone():queryEntitiesByName(name)[1]
    boss:setMod(invaderXim.mod.REGAIN, 0)
end

function content:handleStrengthenBosses(bonusMod, amount, battlefield, mob, count)
    local bosses = { 'Abyssdweller_Jhabdebb', 'Orichalcum_Quadav', 'Pee_Qoho_the_Python' }

    for _, name in ipairs(bosses) do
        local boss = mob:getZone():queryEntitiesByName(name)[1]

        if boss:isAlive() then
            boss:injectActionPacket(boss:getID(), 11, 439, 0, 24, 0, 307, 0)
            boss:addMod(bonusMod, amount)
        end
    end
end

content.groups =
{
    {
        mobs =
        {
            'Abyssdweller_Jhabdebb',
            'Orichalcum_Quadav',
            'Pee_Qoho_the_Python',
            'Grognard_Mesmerizer',
            'Grognard_Footsoldier',
            'Grognard_Predator',
            'Grognard_Neckchopper',
            'Grognard_Grappler',
            'Grognard_Impaler',
            'Star_Ruby_Quadav',
            'Fossil_Quadav',
            'Whitegold_Quadav',
            'Wootz_Quadav',
            'Star_Sapphire_Quadav',
            'Lightsteel_Quadav',
            'Yagudo_Archpriest',
            'Yagudo_Disciplinant',
            'Yagudo_Kapellmeister',
            'Yagudo_Knight_Templar',
            'Yagudo_Prelatess',
            'Yagudo_Eradicator',
        },

        mixins = { require('scripts/mixins/job_special') }
    },

    {
        mobs    = { 'Yagudos_Avatar' },
        mixins  = { require('scripts/mixins/families/avatar') },
        spawned = false,
    },

    {
        mobs =
        {
            'Yagudos_Elemental',
            'Yagudos_Avatar',
            'Orcs_Wyvern',
        },
        spawned = false,
    },

    {
        mobs =
        {
            'Grognard_Mesmerizer',
            'Grognard_Footsoldier',
            'Grognard_Predator',
            'Grognard_Neckchopper',
            'Grognard_Grappler',
            'Grognard_Impaler',
        },

        allDeath = utils.bind(content.handleWeakenBoss, content, 'Abyssdweller_Jhabdebb'),
    },

    {
        mobs =
        {
            'Star_Ruby_Quadav',
            'Fossil_Quadav',
            'Whitegold_Quadav',
            'Wootz_Quadav',
            'Star_Sapphire_Quadav',
            'Lightsteel_Quadav',
        },

        allDeath = utils.bind(content.handleWeakenBoss, content, 'Orichalcum_Quadav'),
    },

    {
        mobs =
        {
            'Yagudo_Archpriest',
            'Yagudo_Disciplinant',
            'Yagudo_Kapellmeister',
            'Yagudo_Knight_Templar',
            'Yagudo_Prelatess',
            'Yagudo_Eradicator',
        },

        allDeath = utils.bind(content.handleWeakenBoss, content, 'Pee_Qoho_the_Python'),
    },

    {
        mobs  = { 'Abyssdweller_Jhabdebb' },
        death = utils.bind(content.handleStrengthenBosses, content, invaderXim.mod.ATTP, 50),
    },

    {
        mobs  = { 'Orichalcum_Quadav' },
        death = utils.bind(content.handleStrengthenBosses, content, invaderXim.mod.UDMGPHYS, 5000),
    },

    {
        mobs  = { 'Pee_Qoho_the_Python' },
        death = utils.bind(content.handleStrengthenBosses, content, invaderXim.mod.UDMGMAGIC, 5000),
    },

    {
        mobs =
        {
            'Abyssdweller_Jhabdebb',
            'Orichalcum_Quadav',
            'Pee_Qoho_the_Python',
        },

        mods =
        {
            [invaderXim.mod.REGAIN      ] = 150,
            [invaderXim.mobMod.DETECTION] = invaderXim.detects.HEARING,
        },

        isParty  = true,
        allDeath = function(battlefield, mob)
            npcUtil.showCrate(GetEntityByID(ID.npc.C3_LOOT_CRATE))
        end
    },

}

content.loot =
{
    [ID.npc.C3_LOOT_CRATE] =
    {
        {
            quantity = 4,
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.UTOPIAN_GOLD_THREAD,      weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.CHUNK_OF_SNOWY_CERMET,    weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SPOOL_OF_SCARLET_ODOSHI,  weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SPOOL_OF_SILKWORM_THREAD, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,                      weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.SQUARE_OF_BENEDICT_SILK,   weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SQUARE_OF_DIABOLIC_SILK,   weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SPOOL_OF_RUBY_SILK_THREAD, weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SQUARE_OF_BRILLIANTINE,    weight = invaderXim.loot.weight.LOW       },
        },

        {
            { item = invaderXim.item.NONE,                     weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.SPOOL_OF_COILED_YARN,     weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SPOOL_OF_CHAMELEON_YARN,  weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.PLAITED_CORD,             weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SPOOL_OF_LUMINIAN_THREAD, weight = invaderXim.loot.weight.LOW       },
        },

        {
            { item = invaderXim.item.NONE,                     weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.DARK_ORICHALCUM_INGOT,    weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SPOOL_OF_GLITTERING_YARN, weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SHEET_OF_COBALT_MYTHRIL,  weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.PANTIN_WIRE,              weight = invaderXim.loot.weight.LOW       },
        },

        {
            { item = invaderXim.item.SILVER_CHIP, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,       weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.METAL_CHIP, weight = invaderXim.loot.weight.VERY_LOW  },
        },
    }
}

return content:register()
