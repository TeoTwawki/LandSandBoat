-----------------------------------
-- Toadal Recall
-- Ghelsba Outpost BCNM30, Sky Orb
-- !additem 1552
-----------------------------------
local ghelsbaID = zones[invaderXim.zone.GHEIXIMA_OUTPOST]
-----------------------------------

local content = Battlefield:new({
    zoneId           = invaderXim.zone.GHEIXIMA_OUTPOST,
    battlefieldId    = invaderXim.battlefield.id.TOADAL_RECALL,
    maxPlayers       = 6,
    levelCap         = 30,
    timeLimit        = utils.minutes(30),
    index            = 4,
    area             = 1,
    entryNpc         = 'Hut_Door',
    requiredItems    = { invaderXim.item.SKY_ORB, wearMessage = ghelsbaID.text.A_CRACK_HAS_FORMED, wornMessage = ghelsbaID.text.ORB_IS_CRACKED },
    armouryCrates    =
    {
        ghelsbaID.mob.TOADPILLOW + 4,
    },
})

-- TODO: Shroom-in-Cap Mechanic
content:addEssentialMobs({ 'Toadpillow', 'Toadsquab', 'Toadbolster', 'Toadcushion' })

content.loot =
{
    {
        { item = invaderXim.item.KING_TRUFFLE, weight = 1000 }, -- king_truffle
    },

    {
        { item = invaderXim.item.JUG_OF_SEEDBED_SOIL, weight = 1000 }, -- jug_of_seedbed_soil
    },

    {
        { item = invaderXim.item.NONE,             weight = 200 }, -- nothing
        { item = invaderXim.item.MAGICIANS_SHIELD, weight = 200 }, -- magicians_shield
        { item = invaderXim.item.MERCENARYS_TARGE, weight = 200 }, -- mercenarys_targe
        { item = invaderXim.item.BEATERS_ASPIS,    weight = 200 }, -- beaters_aspis
        { item = invaderXim.item.PILFERERS_ASPIS,  weight = 200 }, -- pilferers_aspis
    },

    {
        { item = invaderXim.item.NONE,            weight = 250 }, -- nothing
        { item = invaderXim.item.TRIMMERS_MANTLE, weight = 250 }, -- trimmers_mantle
        { item = invaderXim.item.GENIN_MANTLE,    weight = 250 }, -- genin_mantle
        { item = invaderXim.item.WARLOCKS_MANTLE, weight = 250 }, -- warlocks_mantle
    },

    {
        { item = invaderXim.item.NONE,                  weight = 625 }, -- nothing
        { item = invaderXim.item.SCROLL_OF_UTSUSEMI_NI, weight = 125 }, -- scroll_of_utsusemi_ni
        { item = invaderXim.item.SCROLL_OF_PHALANX,     weight = 125 }, -- scroll_of_phalanx
        { item = invaderXim.item.SCROLL_OF_ERASE,       weight = 125 }, -- scroll_of_erase
    },

    {
        { item = invaderXim.item.NONE,            weight = 250 }, -- nothing
        { item = invaderXim.item.MANNEQUIN_HEAD,  weight = 250 }, -- mannequin_head
        { item = invaderXim.item.MANNEQUIN_BODY,  weight = 250 }, -- mannequin_body
        { item = invaderXim.item.MANNEQUIN_HANDS, weight = 250 }, -- mannequin_hands
    },
}

return content:register()
