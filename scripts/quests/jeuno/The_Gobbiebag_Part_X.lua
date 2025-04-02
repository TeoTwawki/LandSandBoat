-----------------------------------
-- The Gobbiebag Part X
-----------------------------------
--  Log ID: 3, Quest ID: 27
--  NPC: Bluffnix:  !pos -43 6 -115 245
-----------------------------------
require('scripts/quests/jeuno/helpers')
-----------------------------------
local lowerJeunoID = zones[invaderXim.zone.LOWER_JEUNO]
-----------------------------------

local params =
{
    questId            = invaderXim.quest.id.jeuno.THE_GOBBIEBAG_PART_X,
    prerequisite       = invaderXim.quest.id.jeuno.THE_GOBBIEBAG_PART_IX,
    message            = lowerJeunoID.text.INVENTORY_INCREASED,
    startInventorySize = 75,
    fame               = 5,
    tradeStew          = invaderXim.item.BOWL_OF_GOBLIN_STEW_880,

    tradeItems =
    {
        invaderXim.item.MOLYBDENUM_INGOT,
        invaderXim.item.SQUARE_OF_GRIFFON_LEATHER,
        invaderXim.item.SQUARE_OF_FOULARD,
        invaderXim.item.ANGEL_SKIN_ORB,
    },

    reward =
    {
        fame = 30,
        fameArea = invaderXim.fameArea.JEUNO,
        title = invaderXim.title.GRAND_GREEDALOX,
    },
}

local quest = invaderXim.jeuno.helpers.GobbiebagQuest:new(params)

return quest
