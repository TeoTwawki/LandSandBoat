-----------------------------------
-- Area: Temenos
-- Name: Central Temenos 1st Floor
-- !additem emerald_chip
-- !addkeyitem white_card
-- !addkeyitem cosmo_cleanse
-- !pos 580.000 -2.375 104.000 37
-----------------------------------
local ID = zones[invaderXim.zone.TEMENOS]
-----------------------------------

local content = Limbus:new({
    zoneId           = invaderXim.zone.TEMENOS,
    battlefieldId    = invaderXim.battlefield.id.CENTRAL_TEMENOS_1ST_FLOOR,
    maxPlayers       = 18,
    timeLimit        = utils.minutes(45),
    index            = 6,
    area             = 7,
    entryNpc         = 'Matter_Diffusion_Module',
    requiredKeyItems = { invaderXim.ki.COSMO_CLEANSE, invaderXim.ki.WHITE_CARD, message = ID.text.YOU_INSERT_THE_CARD_POLISHED },
    requiredItems    = { invaderXim.item.EMERALD_CHIP },
    name             = 'CENTRAL_TEMENOS_1ST_FLOOR',
    lootCrateId      = ID.npc.C1_LOOT_CRATE,
})

function content:handleMobPartnerDeath(mobs, battlefield, mob, count)
    if count > 1 then
        return
    end

    local zone   = mob:getZone()
    local target = zone:queryEntitiesByName(mobs[1])[1]

    if target and mob:getID() == target:getID() then
        target = zone:queryEntitiesByName(mobs[2])[1]
    end

    target:timer(15000, function(mobArg)
        if target:isAlive() then
            target:injectActionPacket(target:getID(), 11, 439, 0, 24, 0, 307, 0)
            target:addMod(invaderXim.mod.REGAIN, 150)
        end
    end)
end

content.groups =
{
    {
        mobs  = { 'Airi', 'Temenos_Cleaner' },
        death = utils.bind(content.handleMobPartnerDeath, content, { 'Airi', 'Temenos_Cleaner' }),
    },

    {
        mobs  = { 'Iruci', 'Temenos_Weapon' },
        death = utils.bind(content.handleMobPartnerDeath, content, { 'Iruci', 'Temenos_Weapon' }),
    },

    {
        mobs  = { 'Enhanced_Dragon', 'Enhanced_Ahriman' },
        death = utils.bind(content.handleMobPartnerDeath, content, { 'Enhanced_Dragon', 'Enhanced_Ahriman' }),
    },

    {
        mobs =
        {
            'Airi',
            'Temenos_Cleaner',
            'Iruci',
            'Temenos_Weapon',
            'Enhanced_Dragon',
            'Enhanced_Ahriman',
        },

        mods     = { [invaderXim.mod.REGEN] = 24 },
        allDeath = function(battlefield, mob)
            invaderXim.limbus.spawnFrom(mob, ID.npc.C1_LOOT_CRATE)
        end
    }
}

content.loot =
{
    [ID.npc.C1_LOOT_CRATE] =
    {
        {
            quantity = 6,
            { item = invaderXim.item.ANCIENT_BEASTCOIN, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.SQUARE_OF_BENEDICT_SILK, weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_DIABOLIC_SILK, weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SPOOL_OF_CHAMELEON_YARN, weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.PANTIN_WIRE,             weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.SPOOL_OF_RUBY_SILK_THREAD, weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_SUPPLE_SKIN,     weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SPOOL_OF_GLITTERING_YARN,  weight = invaderXim.loot.weight.NORMAL },
            { item = invaderXim.item.SQUARE_OF_BRILLIANTINE,    weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,                     weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.SQUARE_OF_ECARLATE_CLOTH, weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.CHUNK_OF_SNOWY_CERMET,    weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SQUARE_OF_SMALT_LEATHER,  weight = invaderXim.loot.weight.LOW       },
            { item = invaderXim.item.SQUARE_OF_FILET_LACE,     weight = invaderXim.loot.weight.LOW       },
        },

        {
            { item = invaderXim.item.ORCHID_CHIP, weight = invaderXim.loot.weight.NORMAL },
        },

        {
            { item = invaderXim.item.NONE,       weight = invaderXim.loot.weight.VERY_HIGH },
            { item = invaderXim.item.METAL_CHIP, weight = invaderXim.loot.weight.VERY_LOW  },
        },
    }
}

return content:register()
