-----------------------------------
-- Area: Abyssea - La Theine
--  NPC: Cruor Prospector
-- Type: Cruor NPC
-- !pos 132.000 -75.856 -822.000 15
-----------------------------------
---@type TNpcEntity
local entity = {}

local itemType = invaderXim.abyssea.itemType

local localProspectorItems =
{
    [itemType.ITEM] = invaderXim.abyssea.visionsCruorProspectorItems,

    [itemType.TEMP] = invaderXim.abyssea.visionsCruorProspectorTemps,

    [itemType.KEYITEM] =
    {
    --  Sel     Item                                Cost
        [1] = { invaderXim.ki.MAP_OF_ABYSSEA_LA_THEINE,     3500 },
        [2] = { invaderXim.ki.IVORY_ABYSSITE_OF_SOJOURN,    6000 },
        [3] = { invaderXim.ki.IVORY_ABYSSITE_OF_CONFLUENCE, 4800 },
        [4] = { invaderXim.ki.IVORY_ABYSSITE_OF_EXPERTISE,  4800 },
        [5] = { invaderXim.ki.CLEAR_DEMILUNE_ABYSSITE,       300 },
    },

    [itemType.ENHANCEMENT] = invaderXim.abyssea.visionsCruorProspectorBuffs,
}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.visionsCruorProspectorOnTrigger(player, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.visionsCruorProspectorOnEventFinish(player, csid, option, localProspectorItems)
end

return entity
