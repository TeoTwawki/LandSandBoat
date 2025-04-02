-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Andreas
-- Type: Guildworker's Union Representative
-- !pos -189.282 10.999 262.626 231
-----------------------------------
local ID = zones[invaderXim.zone.NORTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.crafting.guildPointOnTrade(player, npc, trade, 732, invaderXim.guild.WOODWORKING)
end

entity.onTrigger = function(player, npc)
    invaderXim.crafting.guildPointOnTrigger(player, 731, invaderXim.guild.WOODWORKING)
end

entity.onEventUpdate = function(player, csid, option, npc)
    if csid == 731 then
        invaderXim.crafting.guildPointOnEventUpdate(player, option, npc, invaderXim.guild.WOODWORKING)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 731 then
        invaderXim.crafting.guildPointOnEventFinish(player, option, invaderXim.guild.WOODWORKING)
    elseif csid == 732 then
        player:messageSpecial(ID.text.GP_OBTAINED, option)
    end
end

return entity
