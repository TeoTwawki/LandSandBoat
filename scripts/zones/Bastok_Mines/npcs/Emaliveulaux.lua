-----------------------------------
-- Area: Bastok Mines
--  NPC: Emaliveulaux
-- Tavnazian Archipelago Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MINES]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.events.harvestFestival.onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    if player:getCurrentMission(invaderXim.mission.log_id.COP) >= invaderXim.mission.id.cop.THE_SAVAGE then
        if GetRegionOwner(invaderXim.region.TAVNAZIANARCH) ~= invaderXim.nation.BASTOK then
            player:showText(npc, ID.text.EMALIVEULAUX_CLOSED_DIALOG)
        else
            local stock =
            {
                1523,  290, -- Apple Mint
                5164, 1945, -- Ground Wasabi
                17005,  99, -- Lufaise Fly
                5195,  233, -- Misareaux Parsley
                1695,  920, -- Habanero Peppers
            }

            player:showText(npc, ID.text.EMALIVEULAUX_OPEN_DIALOG)
            invaderXim.shop.general(player, stock, invaderXim.fameArea.BASTOK)
        end
    else
        player:showText(npc, ID.text.EMALIVEULAUX_COP_NOT_COMPLETED)
    end
end

return entity
