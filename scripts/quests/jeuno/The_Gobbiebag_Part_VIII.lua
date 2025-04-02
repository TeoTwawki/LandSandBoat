-----------------------------------
-- The Gobbiebag Part VIII
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
    questId            = invaderXim.quest.id.jeuno.THE_GOBBIEBAG_PART_VIII,
    prerequisite       = invaderXim.quest.id.jeuno.THE_GOBBIEBAG_PART_VII,
    message            = lowerJeunoID.text.INVENTORY_INCREASED,
    startInventorySize = 65,
    fame               = 4,
    tradeStew          = invaderXim.item.BOWL_OF_GOBLIN_STEW_880,

    tradeItems =
    {
        invaderXim.item.SQUARE_OF_SMILODON_LEATHER,
        invaderXim.item.ELECTRUM_INGOT,
        invaderXim.item.SQUARE_OF_CILICE,
        invaderXim.item.ANGELSTONE,
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
