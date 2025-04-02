-----------------------------------
-- Area: Halvung
--  NPC: Decorative Bronze Gate (_1qp)
-----------------------------------
local ID = zones[invaderXim.zone.HALVUNG]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        npcUtil.tradeHasExactly(trade,
        {
            invaderXim.item.HALVUNG_SHAKUDO_KEY,
            invaderXim.item.HALVUNG_BRONZE_KEY,
            invaderXim.item.HALVUNG_BRASS_KEY
        })
    then
        player:confirmTrade()
        npc:openDoor()
        player:messageSpecial(ID.text.KEY_BREAKS,
            invaderXim.item.HALVUNG_SHAKUDO_KEY,
            invaderXim.item.HALVUNG_BRONZE_KEY,
            invaderXim.item.HALVUNG_BRASS_KEY
        )
    end
end

entity.onTrigger = function(player, npc)
    if player:getZPos() <= 79.75 and npc:getAnimation() == invaderXim.anim.CLOSE_DOOR then -- from inside the door
        npc:openDoor()
    else
        player:messageSpecial(ID.text.WIDE_TRENCH)
    end
end

return entity
