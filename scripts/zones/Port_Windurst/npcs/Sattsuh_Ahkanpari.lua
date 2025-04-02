-----------------------------------
-- Area: Port Windurst
--  NPC: Sattsuh Ahkanpari
-- Elshimo Uplands Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.PORT_WINDURST]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.ELSHIMOUPLANDS) ~= invaderXim.nation.WINDURST then
        player:showText(npc, ID.text.SATTSUHAHKANPARI_CLOSED_DIALOG)
    else
        local stock =
        {
            1413, 1656,    -- Cattleya
            628,   239,    -- Cinnamon
            4468,   73,    -- Pamamas
            721,   147,    -- Rattan Lumber
        }

        player:showText(npc, ID.text.SATTSUHAHKANPARI_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.WINDURST)
    end
end

return entity
