-----------------------------------
-- Area: Periqia
-- Ancient Lockbox
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local qItem =
    {
        [invaderXim.assault.mission.SEAGULL_GROUNDED] =
        {
            {
                { itemid = invaderXim.item.UNAPPRAISED_BOX,     droprate = 400 },
                { itemid = invaderXim.item.UNAPPRAISED_SWORD,   droprate = 200 },
                { itemid = invaderXim.item.UNAPPRAISED_POLEARM, droprate = 200 },
                { itemid = invaderXim.item.UNAPPRAISED_GLOVES,  droprate = 200 },
            },
        },

        [invaderXim.assault.mission.REQUIEM] =
        {
            {
                { itemid = invaderXim.item.UNAPPRAISED_BOX,     droprate = 400 },
                { itemid = invaderXim.item.UNAPPRAISED_GLOVES,  droprate = 200 },
                { itemid = invaderXim.item.UNAPPRAISED_POLEARM, droprate = 200 },
                { itemid = invaderXim.item.UNAPPRAISED_AXE,     droprate = 200 },
            },
        },

        [invaderXim.assault.mission.SHOOTING_DOWN_THE_BARON] =
        {
            {
                { itemid = invaderXim.item.UNAPPRAISED_BOW,   droprate = 600 },
                { itemid = invaderXim.item.UNAPPRAISED_BOX,   droprate = 400 },
            },
        },
    }

    local regItem =
    {
        [invaderXim.assault.mission.SEAGULL_GROUNDED] =
        {
            {
                { itemid = invaderXim.item.HI_RERAISER,       droprate = 700 },
                { itemid = 0,                         droprate = 300 },
            },

            {
                { itemid = invaderXim.item.HI_POTION_TANK,    droprate = 100 },
                { itemid = invaderXim.item.HI_ETHER_TANK,     droprate = 100 },
                { itemid = 0,                         droprate = 800 },
            },

            {
                { itemid = invaderXim.item.HI_POTION_P3,      droprate = 530 },
                { itemid = 0,                         droprate = 470 },
            },
        },

        [invaderXim.assault.mission.REQUIEM] =
        {
            {
                { itemid = invaderXim.item.HI_POTION_P3,      droprate = 500 },
                { itemid = 0,                         droprate = 500 },
            },

            {
                { itemid = invaderXim.item.HI_ETHER_TANK,     droprate = 100 },
                { itemid = 0,                         droprate = 900 },
            },

            {
                { itemid = invaderXim.item.HI_RERAISER,       droprate = 500 },
                { itemid = 0,                         droprate = 500 },
            },
        },

        [invaderXim.assault.mission.SHOOTING_DOWN_THE_BARON] =
        {
            {
                { itemid = invaderXim.item.HI_POTION_P2,      droprate = 850 },
                { itemid = 0,                         droprate = 150 },
            },
            {
                { itemid = invaderXim.item.HI_POTION_P3,      droprate = 50 },
                { itemid = 0,                         droprate = 950 },
            },
            {
                { itemid = invaderXim.item.HI_POTION_TANK,    droprate = 400 },
                { itemid = 0,                         droprate = 600 },
            },
            {
                { itemid = invaderXim.item.HI_RERAISER,       droprate = 200 },
                { itemid = 0,                         droprate = 800 },
            },
        },
    }

    local area = player:getCurrentAssault()
    invaderXim.appraisal.assaultChestTrigger(player, npc, qItem[area], regItem[area])
end

return entity
