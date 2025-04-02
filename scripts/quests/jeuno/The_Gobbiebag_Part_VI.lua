-----------------------------------
-- The Gobbiebag Part VI
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
    questId            = invaderXim.quest.id.jeuno.THE_GOBBIEBAG_PART_VI,
    prerequisite       = invaderXim.quest.id.jeuno.THE_GOBBIEBAG_PART_V,
    message            = lowerJeunoID.text.INVENTORY_INCREASED,
    startInventorySize = 55,
    fame               = 3,
    tradeStew          = invaderXim.item.BOWL_OF_GOBLIN_STEW_880,

    tradeItems =
    {
        invaderXim.item.SHAKUDO_INGOT,
        invaderXim.item.SQUARE_OF_BALLON_CLOTH,
        invaderXim.item.IOLITE,
        invaderXim.item.HIGH_QUALITY_EFT_SKIN,
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
