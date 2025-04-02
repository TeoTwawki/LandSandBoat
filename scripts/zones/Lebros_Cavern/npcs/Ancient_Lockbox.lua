-----------------------------------
-- Area: Lebros Cavern
-- Ancient Lockbox
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local qItem =
    {
        [invaderXim.assault.mission.EXCAVATION_DUTY] =
        {
            {
                { itemid = invaderXim.item.UNAPPRAISED_BOX,     droprate = 300 },
                { itemid = invaderXim.item.UNAPPRAISED_EARRING, droprate = 700 },
            },
        },

        [invaderXim.assault.mission.LEBROS_SUPPLIES] =
        {
            {
                { itemid = invaderXim.item.UNAPPRAISED_BOX,  droprate = 300 },
                { itemid = invaderXim.item.UNAPPRAISED_CAPE, droprate = 700 },
            },
        },

        [invaderXim.assault.mission.TROLL_FUGITIVES] =
        {
            {
                { itemid = invaderXim.item.UNAPPRAISED_AXE,       droprate = 300 },
                { itemid = invaderXim.item.UNAPPRAISED_POLEARM,   droprate = 200 },
                { itemid = invaderXim.item.UNAPPRAISED_HEADPIECE, droprate = 100 },
                { itemid = invaderXim.item.UNAPPRAISED_BOX,       droprate = 400 },
            },
        },
    }

    local regItem =
    {
        [invaderXim.assault.mission.EXCAVATION_DUTY] =
        {
            {
                { itemid = invaderXim.item.REMEDY, droprate = 900 },
                { itemid = 0,               droprate = 100 },
            },

            {
                { itemid = invaderXim.item.REMEDY, droprate = 200 },
                { itemid = 0,               droprate = 800 },
            },

            {
                { itemid = invaderXim.item.HI_POTION_P3, droprate = 400 },
                { itemid = 0,                    droprate = 600 },
            },

            {
                { itemid = invaderXim.item.HI_POTION_P3, droprate = 200 },
                { itemid = 0,                      droprate = 800 },
            },
        },

        [invaderXim.assault.mission.LEBROS_SUPPLIES] =
        {
            {
                { itemid = invaderXim.item.REMEDY, droprate = 800 },
                { itemid = 0,               droprate = 200 },
            },

            {
                { itemid = invaderXim.item.RERAISER, droprate = 200 },
                { itemid = 0,                 droprate = 800 },
            },

            {
                { itemid = invaderXim.item.HI_POTION_TANK, droprate = 100 },
                { itemid = 0,                       droprate = 900 },
            },
        },

        [invaderXim.assault.mission.TROLL_FUGITIVES] =
        {
            {
                { itemid = invaderXim.item.HI_POTION_P3, droprate = 800 },
                { itemid = 0,                      droprate = 200 },
            },

            {
                { itemid = invaderXim.item.RERAISER, droprate = 200 },
                { itemid = 0,                 droprate = 800 },
            },

            {
                { itemid = invaderXim.item.HI_POTION_TANK, droprate = 100 },
                { itemid = 0,                       droprate = 900 },
            },

            {
                { itemid = invaderXim.item.HI_ETHER_TANK, droprate = 100 },
                { itemid = 0,                      droprate = 900 },
            },
        },
    }

    local area = player:getCurrentAssault()
    invaderXim.appraisal.assaultChestTrigger(player, npc, qItem[area], regItem[area])
end

return entity
