-----------------------------------
-- The Gobbiebag Part IX
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
    questId            = invaderXim.quest.id.jeuno.THE_GOBBIEBAG_PART_IX,
    prerequisite       = invaderXim.quest.id.jeuno.THE_GOBBIEBAG_PART_VIII,
    message            = lowerJeunoID.text.INVENTORY_INCREASED,
    startInventorySize = 70,
    fame               = 5,
    tradeStew          = invaderXim.item.BOWL_OF_GOBLIN_STEW_880,

    tradeItems =
    {
        invaderXim.item.ORICHALCUM_INGOT,
        invaderXim.item.SQUARE_OF_PEISTE_LEATHER,
        invaderXim.item.SQUARE_OF_OIL_SOAKED_CLOTH,
        invaderXim.item.OXBLOOD_ORB,
    },

    reward =
    {
        fame = 30,
        fameArea = invaderXim.fameArea.JEUNO,
        title = nil,
    },
}

local quest = invaderXim.jeuno.helpers.GobbiebagQuest:new(params)

return quest
