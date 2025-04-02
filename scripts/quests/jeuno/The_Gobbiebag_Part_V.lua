-----------------------------------
-- The Gobbiebag Part V
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
    questId            = invaderXim.quest.id.jeuno.THE_GOBBIEBAG_PART_V,
    prerequisite       = invaderXim.quest.id.jeuno.THE_GOBBIEBAG_PART_IV,
    message            = lowerJeunoID.text.INVENTORY_INCREASED,
    startInventorySize = 50,
    fame               = 3,
    tradeStew          = invaderXim.item.BOWL_OF_GOBLIN_STEW_880,

    tradeItems =
    {
        invaderXim.item.RHODONITE,
        invaderXim.item.PAKTONG_INGOT,
        invaderXim.item.SQUARE_OF_MOBLINWEAVE,
        invaderXim.item.SQUARE_OF_BUGARD_LEATHER,
    },

    reward =
    {
        fame = 30,
        fameArea = invaderXim.fameArea.JEUNO,
        title = invaderXim.title.GREEDALOX,
    },
}

local quest = invaderXim.jeuno.helpers.GobbiebagQuest:new(params)

return quest
