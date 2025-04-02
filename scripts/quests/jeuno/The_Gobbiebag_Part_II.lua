-----------------------------------
-- The Gobbiebag Part II
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
    questId            = invaderXim.quest.id.jeuno.THE_GOBBIEBAG_PART_II,
    prerequisite       = invaderXim.quest.id.jeuno.THE_GOBBIEBAG_PART_I,
    message            = lowerJeunoID.text.INVENTORY_INCREASED,
    startInventorySize = 35,
    fame               = 1,
    tradeStew          = invaderXim.item.BOWL_OF_GOBLIN_STEW_880,

    tradeItems =
    {
        invaderXim.item.SQUARE_OF_RAM_LEATHER,
        invaderXim.item.MYTHRIL_INGOT,
        invaderXim.item.SQUARE_OF_WOOL_CLOTH,
        invaderXim.item.TURQUOISE,
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
