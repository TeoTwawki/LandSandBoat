-----------------------------------
-- Area: Attohwa Chasm
--  NPC: ???
-- !pos -402.574 3.999 -202.750 7
-----------------------------------
local ID = zones[invaderXim.zone.ATTOHWA_CHASM]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    local nm = GetMobByID(ID.mob.FEELER_ANTLION)
    if
        nm and
        not nm:isSpawned() and
        trade:hasItemQty(invaderXim.item.ANTLION_TRAP, 1) and
        trade:getItemCount() == 1
    then
        player:tradeComplete()
        nm:setSpawn(npc:getXPos() - 3, npc:getYPos() - 2, npc:getZPos() - 1)
        SpawnMob(ID.mob.FEELER_ANTLION):updateClaim(player)
        npc:setStatus(invaderXim.status.DISAPPEAR)
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.OCCASIONAL_LUMPS)
end

return entity
