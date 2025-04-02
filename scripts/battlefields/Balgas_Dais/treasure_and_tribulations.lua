-----------------------------------
-- Treasure and Tribulations
-- Balga's Dais BCNM50, Comet Orb
-- !additem 1177
-----------------------------------
local balgasID = zones[invaderXim.zone.BALGAS_DAIS]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.BALGAS_DAIS,
    battlefieldId    = invaderXim.battlefield.id.TREASURE_AND_TRIBULATIONS,
    maxPlayers       = 6,
    levelCap         = 50,
    timeLimit        = utils.minutes(30),
    index            = 4,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.COMET_ORB, wearMessage = balgasID.text.A_CRACK_HAS_FORMED, wornMessage = balgasID.text.ORB_IS_CRACKED },
})

function content:handleCrateDefeated(battlefield, mob)
    local crateId = battlefield:getArmouryCrate()
    local crate   = GetNPCByID(crateId)

    if crate then
        crate:teleport(mob:getPos(), mob:getRotPos())
        npcUtil.showCrate(crate)
        crate:addListener('ON_TRIGGER', 'TRIGGER_CRATE', utils.bind(self.handleOpenArmouryCrate, self))
    end
end

content.groups =
{
    {
        mobs =
        {
            'Small_Box',
            'Medium_Box',
            'Large_Box',
        },

        death = utils.bind(content.handleCrateDefeated, content),
    },
}

content.loot =
{
    {
        { item = invaderXim.item.GUARDIANS_RING, weight =  75 }, -- Guardians Ring
        { item = invaderXim.item.KAMPFER_RING,   weight =  32 }, -- Kampfer Ring
        { item = invaderXim.item.CONJURERS_RING, weight =  54 }, -- Conjurers Ring
        { item = invaderXim.item.SHINOBI_RING,   weight =  32 }, -- Shinobi Ring
        { item = invaderXim.item.SLAYERS_RING,   weight =  97 }, -- Slayers Ring
        { item = invaderXim.item.SORCERERS_RING, weight =  75 }, -- Sorcerers Ring
        { item = invaderXim.item.SOLDIERS_RING,  weight = 108 }, -- Soldiers Ring
        { item = invaderXim.item.TAMERS_RING,    weight =  22 }, -- Tamers Ring
        { item = invaderXim.item.TRACKERS_RING,  weight =  65 }, -- Trackers Ring
        { item = invaderXim.item.DRAKE_RING,     weight =  32 }, -- Drake Ring
        { item = invaderXim.item.FENCERS_RING,   weight =  32 }, -- Fencers Ring
        { item = invaderXim.item.MINSTRELS_RING, weight =  86 }, -- Minstrels Ring
        { item = invaderXim.item.MEDICINE_RING,  weight =  86 }, -- Medicine Ring
        { item = invaderXim.item.ROGUES_RING,    weight =  75 }, -- Rogues Ring
        { item = invaderXim.item.RONIN_RING,     weight =  11 }, -- Ronin Ring
        { item = invaderXim.item.PLATINUM_RING,  weight =  32 }, -- Platinum Ring
    },

    {
        { item = invaderXim.item.ASTRAL_RING,              weight = 376 }, -- Astral Ring
        { item = invaderXim.item.PLATINUM_RING,            weight =  22 }, -- Platinum Ring
        { item = invaderXim.item.SCROLL_OF_QUAKE,          weight =  65 }, -- Scroll Of Quake
        { item = invaderXim.item.RAM_SKIN,                 weight =  10 }, -- Ram Skin
        { item = invaderXim.item.RERAISER,                 weight =  11 }, -- Reraiser
        { item = invaderXim.item.MYTHRIL_INGOT,            weight =  22 }, -- Mythril Ingot
        { item = invaderXim.item.LIGHT_SPIRIT_PACT,        weight =  10 }, -- Light Spirit Pact
        { item = invaderXim.item.SCROLL_OF_FREEZE,         weight =  32 }, -- Scroll Of Freeze
        { item = invaderXim.item.SCROLL_OF_REGEN_III,      weight =  43 }, -- Scroll Of Regen Iii
        { item = invaderXim.item.SCROLL_OF_RAISE_II,       weight =  32 }, -- Scroll Of Raise Ii
        { item = invaderXim.item.PETRIFIED_LOG,            weight =  11 }, -- Petrified Log
        { item = invaderXim.item.CORAL_FRAGMENT,           weight =  11 }, -- Coral Fragment
        { item = invaderXim.item.MAHOGANY_LOG,             weight =  11 }, -- Mahogany Log
        { item = invaderXim.item.CHUNK_OF_PLATINUM_ORE,    weight =  43 }, -- Chunk Of Platinum Ore
        { item = invaderXim.item.CHUNK_OF_GOLD_ORE,        weight = 108 }, -- Chunk Of Gold Ore
        { item = invaderXim.item.CHUNK_OF_DARKSTEEL_ORE,   weight =  32 }, -- Chunk Of Darksteel Ore
        { item = invaderXim.item.CHUNK_OF_MYTHRIL_ORE,     weight =  65 }, -- Chunk Of Mythril Ore
        { item = invaderXim.item.GOLD_INGOT,               weight =  10 }, -- Gold Ingot
        { item = invaderXim.item.DARKSTEEL_INGOT,          weight =  11 }, -- Darksteel Ingot
        { item = invaderXim.item.PLATINUM_INGOT,           weight =  11 }, -- Platinum Ingot
        { item = invaderXim.item.EBONY_LOG,                weight =  11 }, -- Ebony Log
        { item = invaderXim.item.RAM_HORN,                 weight =  11 }, -- Ram Horn
        { item = invaderXim.item.DEMON_HORN,               weight =  11 }, -- Demon Horn
        { item = invaderXim.item.MANTICORE_HIDE,           weight =   9 }, -- Manticore Hide
        { item = invaderXim.item.WYVERN_SKIN,              weight =  11 }, -- Wyvern Skin
        { item = invaderXim.item.HANDFUL_OF_WYVERN_SCALES, weight =  11 }, -- Handful Of Wyvern Scales
        },
}

return content:register()
