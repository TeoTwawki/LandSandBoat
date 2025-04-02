-----------------------------------
-- Petrifying Pair
-- Ghelsba Outpost BCNM30, Sky Orb
-- !additem 1552
-----------------------------------
local ghelsbaID = zones[invaderXim.zone.GHEIXIMA_OUTPOST]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.GHEIXIMA_OUTPOST,
    battlefieldId    = invaderXim.battlefield.id.PETRIFYING_PAIR,
    maxPlayers       = 3,
    levelCap         = 30,
    timeLimit        = utils.minutes(15),
    index            = 3,
    area             = 1,
    entryNpc         = 'Hut_Door',
    requiredItems    = { invaderXim.item.SKY_ORB, wearMessage = ghelsbaID.text.A_CRACK_HAS_FORMED, wornMessage = ghelsbaID.text.ORB_IS_CRACKED },
    armouryCrates    =
    {
        ghelsbaID.mob.KALAMAINU + 2,
    },
})

content:addEssentialMobs({ 'Kalamainu', 'Kilioa' })

content.loot =
{
    {
        { item = invaderXim.item.LIZARD_SKIN, weight = 1000 }, -- Lizard Skin
    },

    {
        { item = invaderXim.item.NONE,          weight = 900 }, -- nothing
        { item = invaderXim.item.LEAPING_BOOTS, weight = 100 }, -- leaping_boots
    },

    {
        { item = invaderXim.item.KATANA_OBI,   weight =  50 }, -- Katana Obi
        { item = invaderXim.item.RAPIER_BELT,  weight =  75 }, -- Rapier Belt
        { item = invaderXim.item.SCYTHE_BELT,  weight = 175 }, -- Scythe Belt
        { item = invaderXim.item.CHESTNUT_LOG, weight = 175 }, -- Chestnut Log
        { item = invaderXim.item.ELM_LOG,      weight = 350 }, -- Elm Log
        { item = invaderXim.item.STEEL_INGOT,  weight = 100 }, -- Steel Ingot
    },

    {
        { item = invaderXim.item.NONE,         weight = 925 }, -- nothing (50%)
        { item = invaderXim.item.KATANA_OBI,   weight =  50 }, -- Katana Obi
        { item = invaderXim.item.RAPIER_BELT,  weight =  75 }, -- Rapier Belt
        { item = invaderXim.item.SCYTHE_BELT,  weight = 175 }, -- Scythe Belt
        { item = invaderXim.item.CHESTNUT_LOG, weight = 175 }, -- Chestnut Log
        { item = invaderXim.item.ELM_LOG,      weight = 350 }, -- Elm Log
        { item = invaderXim.item.STEEL_INGOT,  weight = 100 }, -- Steel Ingot
    },

    {
        { item = invaderXim.item.AVATAR_BELT,          weight = 105 }, -- Avatar Belt
        { item = invaderXim.item.PICK_BELT,            weight = 105 }, -- Pick Belt
        { item = invaderXim.item.IRON_INGOT,           weight = 131 }, -- Iron Ingot
        { item = invaderXim.item.CHUNK_OF_IRON_ORE,    weight = 131 }, -- Chunk Of Iron Ore
        { item = invaderXim.item.CHUNK_OF_MYTHRIL_ORE, weight =  79 }, -- Chunk Of Mythril Ore
        { item = invaderXim.item.CHUNK_OF_SILVER_ORE,  weight =  79 }, -- Chunk Of Silver Ore
        { item = invaderXim.item.LAPIS_LAZULI,         weight = 131 }, -- Lapis Lazuli
    },

    {
        { item = invaderXim.item.JUG_OF_COLD_CARRION_BROTH, weight = 552 }, -- Jug Of Cold Carrion Broth
        { item = invaderXim.item.SCROLL_OF_ABSORB_AGI,      weight = 263 }, -- Scroll Of Absorb-agi
        { item = invaderXim.item.SCROLL_OF_ABSORB_INT,      weight = 210 }, -- Scroll Of Absorb-int
        { item = invaderXim.item.SCROLL_OF_ABSORB_VIT,      weight = 289 }, -- Scroll Of Absorb-vit
        { item = invaderXim.item.SCROLL_OF_DISPEL,          weight = 105 }, -- Scroll Of Dispel
        { item = invaderXim.item.SCROLL_OF_ERASE,           weight =  79 }, -- Scroll Of Erase
        { item = invaderXim.item.SCROLL_OF_MAGIC_FINALE,    weight = 421 }, -- Scroll Of Magic Finale
        { item = invaderXim.item.SCROLL_OF_UTSUSEMI_NI,     weight =  79 }, -- Scroll Of Utsusemi Ni
    },

    {
        quantity = 2,
        { item = invaderXim.item.NONE,                   weight = 736 }, -- nothing (25%)
        { item = invaderXim.item.AXE_BELT,               weight = 200 }, -- Axe Belt
        { item = invaderXim.item.CESTUS_BELT,            weight = 125 }, -- Cestus Belt
        { item = invaderXim.item.CLEAR_TOPAZ,            weight =  10 }, -- Clear Topaz
        { item = invaderXim.item.DAGGER_BELT,            weight =  75 }, -- Dagger Belt
        { item = invaderXim.item.CHUNK_OF_DARKSTEEL_ORE, weight = 100 }, -- Darksteel Ore
        { item = invaderXim.item.GUN_BELT,               weight =  25 }, -- Gun Belt
        { item = invaderXim.item.HI_ETHER,               weight = 175 }, -- Hi-ether
        { item = invaderXim.item.LANCE_BELT,             weight = 200 }, -- Lance Belt
        { item = invaderXim.item.LIGHT_OPAL,             weight =  75 }, -- Light Opal
        { item = invaderXim.item.MACE_BELT,              weight = 175 }, -- Mace Belt
        { item = invaderXim.item.MYTHRIL_INGOT,          weight = 200 }, -- Mythril Ingot
        { item = invaderXim.item.ONYX,                   weight =  25 }, -- Onyx
        { item = invaderXim.item.SARASHI,                weight = 250 }, -- Sarashi
        { item = invaderXim.item.SHIELD_BELT,            weight = 100 }, -- Shield Belt
        { item = invaderXim.item.SONG_BELT,              weight = 100 }, -- Song Belt
        { item = invaderXim.item.STAFF_BELT,             weight = 150 }, -- Staff Belt
        { item = invaderXim.item.SILVER_INGOT,           weight = 100 }, -- Silver Ingot
        { item = invaderXim.item.TOURMALINE,             weight = 125 }, -- Tourmaline
    },
}

return content:register()
