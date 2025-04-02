-----------------------------------
-- Area: Windurst Woods
--  NPC: Nya Labiccio
-- Only sells when Windurst controlls Gustaberg Region
-- Confirmed shop stock, August 2013
-----------------------------------
local ID = zones[invaderXim.zone.WINDURST_WOODS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local regionOwner = GetRegionOwner(invaderXim.region.GUSTABERG)

    if regionOwner ~= invaderXim.nation.WINDURST then
        player:showText(npc, ID.text.NYALABICCIO_CLOSED_DIALOG)
    else
        player:showText(npc, ID.text.NYALABICCIO_OPEN_DIALOG)

        local stock =
        {
            1108,  703, -- Sulfur
            619,    43, -- Popoto
            611,    36, -- Rye Flour
            4388,   40  -- Eggplant
        }
        invaderXim.shop.general(player, stock, invaderXim.fameArea.WINDURST)
    end
end

return entity
