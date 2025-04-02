-----------------------------------
-- The Gobbiebag Part VII
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
    questId            = invaderXim.quest.id.jeuno.THE_GOBBIEBAG_PART_VII,
    prerequisite       = invaderXim.quest.id.jeuno.THE_GOBBIEBAG_PART_VI,
    message            = lowerJeunoID.text.INVENTORY_INCREASED,
    startInventorySize = 60,
    fame               = 4,
    tradeStew          = invaderXim.item.BOWL_OF_GOBLIN_STEW_880,

    tradeItems =
    {
        invaderXim.item.SQUARE_OF_LYNX_LEATHER,
        invaderXim.item.ADAMAN_INGOT,
        invaderXim.item.SQUARE_OF_RAINBOW_CLOTH,
        invaderXim.item.DEATHSTONE,
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
