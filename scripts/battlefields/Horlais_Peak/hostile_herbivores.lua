-----------------------------------
-- Hostile Herbivores
-- Horlais Peak BCNM50, Comet Orb
-- !additem 1177
-----------------------------------
local horlaisID = zones[invaderXim.zone.HORLAIS_PEAK]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.HORLAIS_PEAK,
    battlefieldId    = invaderXim.battlefield.id.HOSTILE_HERBIVORES,
    maxPlayers       = 6,
    levelCap         = 50,
    timeLimit        = utils.minutes(30),
    index            = 4,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.COMET_ORB, wearMessage = horlaisID.text.A_CRACK_HAS_FORMED, wornMessage = horlaisID.text.ORB_IS_CRACKED },
})

content:addEssentialMobs({ 'Fighting_Sheep' })

content.loot =
{
    {
        { item = invaderXim.item.NONE,         weight = 50 }, -- Nothing
        { item = invaderXim.item.OCEAN_BELT,   weight = 95 }, -- Ocean Belt
        { item = invaderXim.item.JUNGLE_BELT,  weight = 95 }, -- Jungle Belt
        { item = invaderXim.item.STEPPE_BELT,  weight = 95 }, -- Steppe Belt
        { item = invaderXim.item.DESERT_BELT,  weight = 95 }, -- Desert Belt
        { item = invaderXim.item.FOREST_BELT,  weight = 95 }, -- Forest Belt
        { item = invaderXim.item.OCEAN_STONE,  weight = 95 }, -- Ocean Stone
        { item = invaderXim.item.JUNGLE_STONE, weight = 95 }, -- Jungle Stone
        { item = invaderXim.item.STEPPE_STONE, weight = 95 }, -- Steppe Stone
        { item = invaderXim.item.DESERT_STONE, weight = 95 }, -- Desert Stone
        { item = invaderXim.item.FOREST_STONE, weight = 95 }, -- Forest Stone
    },

    {
        { item = invaderXim.item.GUARDIANS_RING, weight = 64 }, -- Guardians Ring
        { item = invaderXim.item.KAMPFER_RING,   weight = 65 }, -- Kampfer Ring
        { item = invaderXim.item.CONJURERS_RING, weight = 65 }, -- Conjurers Ring
        { item = invaderXim.item.SHINOBI_RING,   weight = 65 }, -- Shinobi Ring
        { item = invaderXim.item.SLAYERS_RING,   weight = 65 }, -- Slayers Ring
        { item = invaderXim.item.SORCERERS_RING, weight = 65 }, -- Sorcerers Ring
        { item = invaderXim.item.SOLDIERS_RING,  weight = 64 }, -- Soldiers Ring
        { item = invaderXim.item.TAMERS_RING,    weight = 65 }, -- Tamers Ring
        { item = invaderXim.item.TRACKERS_RING,  weight = 64 }, -- Trackers Ring
        { item = invaderXim.item.DRAKE_RING,     weight = 65 }, -- Drake Ring
        { item = invaderXim.item.FENCERS_RING,   weight = 65 }, -- Fencers Ring
        { item = invaderXim.item.MINSTRELS_RING, weight = 65 }, -- Minstrels Ring
        { item = invaderXim.item.MEDICINE_RING,  weight = 64 }, -- Medicine Ring
        { item = invaderXim.item.ROGUES_RING,    weight = 65 }, -- Rogues Ring
        { item = invaderXim.item.RONIN_RING,     weight = 64 }, -- Ronin Ring
        { item = invaderXim.item.PLATINUM_RING,  weight = 30 }, -- Platinum Ring
    },

    {
        quantity = 2,
        { item = invaderXim.item.NONE,                weight = 100 }, -- Nothing
        { item = invaderXim.item.SCROLL_OF_QUAKE,     weight = 176 }, -- Scroll Of Quake
        { item = invaderXim.item.LIGHT_SPIRIT_PACT,   weight =  10 }, -- Light Spirit Pact
        { item = invaderXim.item.SCROLL_OF_FREEZE,    weight = 176 }, -- Scroll Of Freeze
        { item = invaderXim.item.SCROLL_OF_REGEN_III, weight = 176 }, -- Scroll Of Regen Iii
        { item = invaderXim.item.RERAISER,            weight =  60 }, -- Reraiser
        { item = invaderXim.item.VILE_ELIXIR,         weight =  60 }, -- Vile Elixir
        { item = invaderXim.item.SCROLL_OF_RAISE_II,  weight = 176 }, -- Scroll Of Raise Ii
    },

    {
        quantity = 2,
        { item = invaderXim.item.RAM_HORN,                 weight =  59 }, -- Ram Horn
        { item = invaderXim.item.MAHOGANY_LOG,             weight =  59 }, -- Mahogany Log
        { item = invaderXim.item.MYTHRIL_INGOT,            weight = 200 }, -- Mythril Ingot
        { item = invaderXim.item.MANTICORE_HIDE,           weight =  59 }, -- Manticore Hide
        { item = invaderXim.item.HANDFUL_OF_WYVERN_SCALES, weight =  90 }, -- Handful Of Wyvern Scales
        { item = invaderXim.item.WYVERN_SKIN,              weight =  90 }, -- Wyvern Skin
        { item = invaderXim.item.PETRIFIED_LOG,            weight = 176 }, -- Petrified Log
        { item = invaderXim.item.DARKSTEEL_INGOT,          weight =  59 }, -- Darksteel Ingot
        { item = invaderXim.item.RAM_SKIN,                 weight =  59 }, -- Ram Skin
        { item = invaderXim.item.PLATINUM_INGOT,           weight =  90 }, -- Platinum Ingot
    },
}

return content:register()
