-----------------------------------
-- Area: Norg
--  NPC: Quntsu-Nointsu
-- Title Change NPC
-- !pos -67 -1 34 252
-----------------------------------
---@type TNpcEntity
local entity = {}

local eventId = 1011
local titleInfo =
{
    {
        cost = 200,
        title =
        {
            invaderXim.title.HONORARY_DOCTORATE_MAJORING_IN_TONBERRIES,
            invaderXim.title.BUSHIDO_BLADE,
            invaderXim.title.BLACK_MARKETEER,
            invaderXim.title.CRACKER_OF_THE_SECRET_CODE,
            invaderXim.title.LOOKS_SUBLIME_IN_A_SUBLIGAR,
            invaderXim.title.LOOKS_GOOD_IN_LEGGINGS,
        },
    },
    {
        cost = 300,
        title =
        {
            invaderXim.title.APPRENTICE_SOMMELIER,
            invaderXim.title.TREASURE_HOUSE_RANSACKER,
            invaderXim.title.HEIR_OF_THE_GREAT_WATER,
            invaderXim.title.PARAGON_OF_SAMURAI_EXCELLENCE,
            invaderXim.title.PARAGON_OF_NINJA_EXCELLENCE,
            invaderXim.title.GUIDER_OF_SOULS_TO_THE_SANCTUARY,
            invaderXim.title.BEARER_OF_BONDS_BEYOND_TIME,
            invaderXim.title.FRIEND_OF_THE_OPO_OPOS,
            invaderXim.title.PENTACIDE_PERPETRATOR,
        },
    },
    {
        cost = 400,
        title =
        {
            invaderXim.title.BEARER_OF_THE_WISEWOMANS_HOPE,
            invaderXim.title.BEARER_OF_THE_EIGHT_PRAYERS,
            invaderXim.title.LIGHTWEAVER,
            invaderXim.title.DESTROYER_OF_ANTIQUITY,
            invaderXim.title.SEALER_OF_THE_PORTAL_OF_THE_GODS,
            invaderXim.title.BURIER_OF_THE_ILLUSION,
        },
    },
}

entity.onTrigger = function(player, npc)
    invaderXim.titleChanger.onTrigger(player, eventId, titleInfo)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.titleChanger.onEventFinish(player, csid, option, eventId, titleInfo)
end

return entity
