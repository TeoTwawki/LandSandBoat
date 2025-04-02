-----------------------------------
-- Area: Bastok Markets
--  NPC: Ellard
-- Type: Guildworker's Union Representative
-- !pos -214.355 -7.814 -63.809 235
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MARKETS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.crafting.guildPointOnTrade(player, npc, trade, 341, invaderXim.guild.GOLDSMITHING)
end

entity.onTrigger = function(player, npc)
    invaderXim.crafting.guildPointOnTrigger(player, 340, invaderXim.guild.GOLDSMITHING)
end

entity.onEventUpdate = function(player, csid, option, npc)
    if csid == 340 then
        invaderXim.crafting.guildPointOnEventUpdate(player, option, npc, invaderXim.guild.GOLDSMITHING)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 340 then
        invaderXim.crafting.guildPointOnEventFinish(player, option, invaderXim.guild.GOLDSMITHING)
    elseif csid == 341 then
        player:messageSpecial(ID.text.GP_OBTAINED, option)
    end
end

return entity
