-----------------------------------
-- Area: Western Altepa Desert
--  NPC: <this space intentionally left blank>
-- !pos -152 -16 20 125
-----------------------------------
local ID = zones[invaderXim.zone.WESTERN_ALTEPA_DESERT]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getCharVar('RELIC_IN_PROGRESS') == invaderXim.item.OGRE_KILLER and
        npcUtil.tradeHas(trade, { invaderXim.item.RIMILALA_STRIPESHELL, invaderXim.item.RUNAEIC_FRAGMENT, invaderXim.item.SHARD_OF_NECROPSYCHE, invaderXim.item.OGRE_KILLER })
    then
        player:startEvent(205, invaderXim.item.GUTTLER_75)
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
end

entity.onEventFinish = function(player, csid, option, npc)
    if
        csid == 205 and
        npcUtil.giveItem(player, { invaderXim.item.GUTTLER_75, { invaderXim.item.LUNGO_NANGO_JADESHELL, 30 } })
    then
        player:confirmTrade()
        player:setCharVar('RELIC_IN_PROGRESS', 0)
    end
end

return entity
