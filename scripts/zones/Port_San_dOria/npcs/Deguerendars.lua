-----------------------------------
-- Area: Port San d'Oria
--  NPC: Deguerendars
-- Tavnazian Archipelago Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.PORT_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    if player:getCurrentMission(invaderXim.mission.log_id.COP) >= invaderXim.mission.id.cop.THE_SAVAGE then
        if GetRegionOwner(invaderXim.region.TAVNAZIANARCH) ~= invaderXim.nation.SANDORIA then
            player:showText(npc, ID.text.DEGUERENDARS_CLOSED_DIALOG)
        else
            local stock =
            {
                1523,  290,    -- Apple Mint
                5164, 1945,    -- Ground Wasabi
                17005,  99,    -- Lufaise Fly
                5195,  233,    -- Misareaux Parsley
                1695,  920,    -- Habanero Peppers
            }

            player:showText(npc, ID.text.DEGUERENDARS_OPEN_DIALOG)
            invaderXim.shop.general(player, stock, invaderXim.fameArea.SANDORIA)
        end
    else
        player:showText(npc, ID.text.DEGUERENDARS_COP_NOT_COMPLETED)
    end
end

return entity
