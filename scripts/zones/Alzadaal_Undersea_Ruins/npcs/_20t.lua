-----------------------------------
-- Area: Alzadaal Undersea Ruins
-- Door: Gilded Gateway (Silver Sea)
-- !pos 580 -2 442 72
-----------------------------------
local ID = zones[invaderXim.zone.ALZADAAL_UNDERSEA_RUINS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
--    if not invaderXim.instance.onTrigger(player, npc, invaderXim.zone.SILVER_SEA_REMNANTS) then
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
--    end
end

entity.onEventUpdate = function(player, csid, option, npc)
    for _, players in pairs(player:getAlliance()) do
        if players:checkImbuedItems() then
            if players:getID() == player:getID() then
                player:messageText(player, ID.text.IMBUED_ITEM, false)
            else
                player:messageText(player, ID.text.MEMBER_IMBUED_ITEM, false)
            end

            player:instanceEntry(npc, 1)
            return
        end
    end

    invaderXim.instance.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.instance.onEventFinish(player, csid, option, npc)
end

return entity
