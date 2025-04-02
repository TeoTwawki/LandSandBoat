-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Macuillie
-- Type: Guildworker's Union Representative
-- !pos -191.738 11.001 138.656 231
-----------------------------------
local ID = zones[invaderXim.zone.NORTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.crafting.guildPointOnTrade(player, npc, trade, 730, invaderXim.guild.SMITHING)
end

entity.onTrigger = function(player, npc)
    invaderXim.crafting.guildPointOnTrigger(player, 729, invaderXim.guild.SMITHING)
end

entity.onEventUpdate = function(player, csid, option, npc)
    if csid == 729 then
        invaderXim.crafting.guildPointOnEventUpdate(player, option, npc, invaderXim.guild.SMITHING)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 729 then
        invaderXim.crafting.guildPointOnEventFinish(player, option, invaderXim.guild.SMITHING)
    elseif csid == 730 then
        player:messageSpecial(ID.text.GP_OBTAINED, option)
    end
end

return entity
