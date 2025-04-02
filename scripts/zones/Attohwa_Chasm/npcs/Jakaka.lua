-----------------------------------
-- Area: Attohwa Chasm
--  NPC: Jakaka
-- Type: ENM
-- !pos -144.711 6.246 -250.309 7
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    -- Trade Parradamo Stones
    if
        trade:hasItemQty(invaderXim.item.POUCH_OF_PARRADAMO_STONES, 1) and
        trade:getItemCount() == 1
    then
        player:tradeComplete()
        player:startEvent(12)
    end
end

entity.onTrigger = function(player, npc)
    local miasmaFilterCD = player:getCharVar('[ENM]MiasmaFilter')

    if player:hasKeyItem(invaderXim.ki.MIASMA_FILTER) then
        player:startEvent(11)
    else
        if miasmaFilterCD >= os.time() then
            -- Both Vanadiel time and unix timestamps are based on seconds. Add the difference to the event.
            player:startEvent(14, VanadielTime() + (miasmaFilterCD - os.time()))
        else
            if
                player:hasItem(invaderXim.item.POUCH_OF_PARRADAMO_STONES) or
                player:hasItem(invaderXim.item.FLAXEN_POUCH)
            then
                player:startEvent(15)
            else
                player:startEvent(13)
            end
        end
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 12 then
        npcUtil.giveKeyItem(player, invaderXim.ki.MIASMA_FILTER)
        player:setCharVar('[ENM]MiasmaFilter', os.time() + (invaderXim.settings.main.ENM_COOLDOWN * 3600)) -- Current time + (ENM_COOLDOWN*1hr in seconds)
    elseif csid == 13 then
        npcUtil.giveItem(player, invaderXim.item.FLAXEN_POUCH)
    end
end

return entity
