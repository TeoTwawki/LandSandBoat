-----------------------------------
-- Area: Leujaoam Sanctum
-- Ancient Lockbox
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local qItem =
    {
        [invaderXim.assault.mission.LEUJAOAM_CLEANSING] =
        {
            {
                { itemid = invaderXim.item.UNAPPRAISED_RING, droprate = 700 },
                { itemid = invaderXim.item.UNAPPRAISED_BOX,  droprate = 300 },
            },
        },

        [invaderXim.assault.mission.ORICHALCUM_SURVEY] =
        {
            {
                { itemid = invaderXim.item.UNAPPRAISED_NECKLACE, droprate = 300 },
                { itemid = invaderXim.item.UNAPPRAISED_BOX,      droprate = 400 },
                { itemid = invaderXim.item.UNAPPRAISED_GLOVES,   droprate = 300 },
            },
        },
    }

    local regItem =
    {
        [invaderXim.assault.mission.LEUJAOAM_CLEANSING] =
        {
            {
                { itemid = invaderXim.item.HI_POTION_P3, droprate = 1000 },
            },

            {
                { itemid = invaderXim.item.HI_POTION_P3, droprate = 100 },
                { itemid = 0,                    droprate = 900 },
            },

            {
                { itemid = invaderXim.item.REMEDY, droprate = 530 },
                { itemid = 0,               droprate = 470 },
            },
        },

        [invaderXim.assault.mission.ORICHALCUM_SURVEY] =
        {
            {
                { itemid = invaderXim.item.HI_POTION_P3, droprate = 1000 },
            },

            {
                { itemid = invaderXim.item.REMEDY, droprate = 530 },
                { itemid = 0,               droprate = 470 },
            },
        },
    }

    local area = player:getCurrentAssault()
    invaderXim.appraisal.assaultChestTrigger(player, npc, qItem[area], regItem[area])
end

return entity
