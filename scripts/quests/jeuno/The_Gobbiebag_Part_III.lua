-----------------------------------
-- The Gobbiebag Part III
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
    questId            = invaderXim.quest.id.jeuno.THE_GOBBIEBAG_PART_III,
    prerequisite       = invaderXim.quest.id.jeuno.THE_GOBBIEBAG_PART_II,
    message            = lowerJeunoID.text.INVENTORY_INCREASED,
    startInventorySize = 40,
    fame               = 1,
    tradeStew          = invaderXim.item.BOWL_OF_GOBLIN_STEW_880,

    tradeItems =
    {
        invaderXim.item.SQUARE_OF_BLACK_TIGER_LEATHER,
        invaderXim.item.GOLD_INGOT,
        invaderXim.item.SQUARE_OF_VELVET_CLOTH,
        invaderXim.item.PAINITE,
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
