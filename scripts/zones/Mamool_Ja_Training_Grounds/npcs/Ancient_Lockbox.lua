-----------------------------------
-- Area: Mamool Ja Training Grounds
-- Ancient Lockbox
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local qItem =
    {
        [invaderXim.assault.mission.IMPERIAL_AGENT_RESCUE] =
        {
            {
                { itemid = invaderXim.item.UNAPPRAISED_BOX,  droprate = 300 },
                { itemid = invaderXim.item.UNAPPRAISED_RING, droprate = 700 },
            },
        },

        [invaderXim.assault.mission.PREEMPTIVE_STRIKE] =
        {
            {
                { itemid = invaderXim.item.UNAPPRAISED_BOX,      droprate = 300 },
                { itemid = invaderXim.item.UNAPPRAISED_NECKLACE, droprate = 700 },
            },
        },
    }

    local regItem =
    {
        [invaderXim.assault.mission.IMPERIAL_AGENT_RESCUE] =
        {
            {
                { itemid = invaderXim.item.HI_POTION_P2, droprate = 900 },
                { itemid =    0,                 droprate = 100 },
            },

            {
                { itemid = invaderXim.item.HI_POTION_TANK, droprate = 100 },
                { itemid =     0,                  droprate = 900 },
            },

            {
                { itemid = invaderXim.item.RERAISER, droprate = 530 },
                { itemid =    0,             droprate = 470 },
            },
        },

        [invaderXim.assault.mission.PREEMPTIVE_STRIKE] =
        {
            {
                { itemid = invaderXim.item.HI_POTION_TANK, droprate = 100 },
                { itemid =     0,                   droprate = 900 },
            },

            {
                { itemid = invaderXim.item.RERAISER, droprate = 300 },
                { itemid =    0,              droprate = 700 },
            },

            {
                { itemid = invaderXim.item.HI_RERAISER, droprate = 500 },
                { itemid =    0,                 droprate = 500 },
            },
        },
    }

    local area = player:getCurrentAssault()
    invaderXim.appraisal.assaultChestTrigger(player, npc, qItem[area], regItem[area])
end

return entity
