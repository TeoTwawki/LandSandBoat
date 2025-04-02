-----------------------------------
-- Celery
-- Qu'Bia Arena BCNM60, Moon Orb
-- !additem 1130
-----------------------------------
local qubiaID = zones[invaderXim.zone.QUBIA_ARENA]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.QUBIA_ARENA,
    battlefieldId    = invaderXim.battlefield.id.CELERY,
    maxPlayers       = 3,
    levelCap         = 60,
    timeLimit        = utils.minutes(15),
    index            = 16,
    entryNpc         = 'BC_Entrance',
    exitNpc          = 'Burning_Circle',
    requiredItems    = { invaderXim.item.MOON_ORB, wearMessage = qubiaID.text.A_CRACK_HAS_FORMED, wornMessage = qubiaID.text.ORB_IS_CRACKED },

    experimental = true,
})

content:addEssentialMobs({
    'Annihilated_Anthony',
    'Shredded_Samson',
    'Mauled_Murdock',
    'Punctured_Percy'
})

-- All but the engaged mob despawns on engage, so they are not tracked
-- for the allDeath value.  Override allDeath with death, and trigger
-- win on a single defeated mob.
content.groups[1].death = function(battlefield, mob)
    content:handleAllMonstersDefeated(battlefield, mob)
end

content.loot =
{
    {
        { item = invaderXim.item.LIBATION_ABJURATION, weight = 1000 }, -- libation_abjuration
    },

    {
        { item = invaderXim.item.OBLATION_ABJURATION, weight = 1000 }, -- oblation_abjuration
    },

    {
        { item = invaderXim.item.SQUARE_OF_RAINBOW_CLOTH, weight = 1000 }, -- square_of_rainbow_cloth
    },

    {
        quantity = 3,
        { item = invaderXim.item.SQUARE_OF_SILK_CLOTH, weight = 1000 }, -- square_of_silk_cloth
    },

    {
        { item = invaderXim.item.TELEPORT_RING_DEM, weight = 250 }, -- teleport_ring_dem
        { item = invaderXim.item.TELEPORT_RING_MEA, weight = 250 }, -- teleport_ring_mea
        { item = invaderXim.item.NURSEMAIDS_HARP,   weight = 250 }, -- nursemaids_harp
        { item = invaderXim.item.TRAILERS_KUKRI,    weight = 250 }, -- trailers_kukri
    },

    {
        { item = invaderXim.item.ELUSIVE_EARRING, weight = 250 }, -- elusive_earring
        { item = invaderXim.item.KNIGHTLY_MANTLE, weight = 250 }, -- knightly_mantle
        { item = invaderXim.item.HI_ETHER_TANK,   weight = 250 }, -- hi-ether_tank
        { item = invaderXim.item.HI_POTION_TANK,  weight = 250 }, -- hi-potion_tank
    },

    {
        { item = invaderXim.item.NONE,         weight = 950 }, -- nothing
        { item = invaderXim.item.WALKURE_MASK, weight =  50 }, -- walkure_mask
    },

    {
        { item = invaderXim.item.AQUAMARINE,       weight =  50 }, -- aquamarine
        { item = invaderXim.item.CHRYSOBERYL,      weight =  50 }, -- chrysoberyl
        { item = invaderXim.item.DARKSTEEL_INGOT,  weight = 100 }, -- darksteel_ingot
        { item = invaderXim.item.EBONY_LOG,        weight =  50 }, -- ebony_log
        { item = invaderXim.item.FLUORITE,         weight =  50 }, -- fluorite
        { item = invaderXim.item.GOLD_INGOT,       weight =  50 }, -- gold_ingot
        { item = invaderXim.item.HI_RERAISER,      weight =  50 }, -- hi-reraiser
        { item = invaderXim.item.JADEITE,          weight =  50 }, -- jadeite
        { item = invaderXim.item.MAHOGANY_LOG,     weight =  50 }, -- mahogany_log
        { item = invaderXim.item.MOONSTONE,        weight =  50 }, -- moonstone
        { item = invaderXim.item.MYTHRIL_INGOT,    weight =  50 }, -- mythril_ingot
        { item = invaderXim.item.PAINITE,          weight =  50 }, -- painite
        { item = invaderXim.item.RED_ROCK,         weight =  50 }, -- red_rock
        { item = invaderXim.item.STEEL_INGOT,      weight =  50 }, -- steel_ingot
        { item = invaderXim.item.SUNSTONE,         weight =  50 }, -- sunstone
        { item = invaderXim.item.TRANSLUCENT_ROCK, weight =  50 }, -- translucent_rock
        { item = invaderXim.item.WHITE_ROCK,       weight =  50 }, -- white_rock
        { item = invaderXim.item.VILE_ELIXIR_P1,   weight =  50 }, -- vile_elixir_+1
        { item = invaderXim.item.ZIRCON,           weight =  50 }, -- zircon
    },
}

return content:register()
