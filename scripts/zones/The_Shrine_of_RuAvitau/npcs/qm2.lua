-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  NPC: ??? (Spawns Kirin)
-- !pos -81 32 2 178
-----------------------------------
local ID = zones[invaderXim.zone.THE_SHRINE_OF_RUAVITAU]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if npcUtil.tradeHas(trade, { invaderXim.item.SEAL_OF_GENBU, invaderXim.item.SEAL_OF_BYAKKO, invaderXim.item.SEAL_OF_SEIRYU, invaderXim.item.SEAL_OF_SUZAKU }) then
        player:startEvent(101)
    end
end

entity.onTrigger = function(player, npc)
    player:startEvent(100)
end

entity.onEventFinish = function(player, csid, option)
    local npc = GetNPCByID(ID.npc.KIRIN_QM)
    if
        npc and
        csid == 101 and
        npcUtil.popFromQM(player, npc, ID.mob.KIRIN, { claim = true })
    then
        player:confirmTrade()
    end
end

return entity
