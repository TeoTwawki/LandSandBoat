-----------------------------------
-- Area: Castle Oztroja
--  NPC: _479 (Brass Door)
-- Involved in Mission "Saintly Invitation"
-- !pos -99 -59 84 151
-----------------------------------
local ID = zones[invaderXim.zone.CASTLE_OZTROJA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    local zPos = player:getZPos()

    if
        npcUtil.tradeHas(trade, invaderXim.item.JUDGMENT_KEY) and
        player:hasKeyItem(invaderXim.ki.BALGA_CHAMPION_CERTIFICATE) and
        zPos >= 80 and zPos < 86
    then
        npc:openDoor(2.5)
        player:confirmTrade()
    else
        player:messageSpecial(ID.text.ITS_LOCKED)
    end
end

entity.onTrigger = function(player, npc)
    if npc:getAnimation() == invaderXim.anim.CLOSE_DOOR then
        player:messageSpecial(ID.text.ITS_LOCKED)
    end
end

return entity
