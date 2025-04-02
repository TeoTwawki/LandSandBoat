-----------------------------------
-- Area: Windurst Woods
--  NPC: Samigo-Pormigo
-- Type: Guildworker's Union Representative
-- !pos -9.782 -5.249 -134.432 241
-----------------------------------
local ID = zones[invaderXim.zone.WINDURST_WOODS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.crafting.guildPointOnTrade(player, npc, trade, 10023, invaderXim.guild.BONECRAFT)
end

entity.onTrigger = function(player, npc)
    invaderXim.crafting.guildPointOnTrigger(player, 10022, invaderXim.guild.BONECRAFT)
end

entity.onEventUpdate = function(player, csid, option, npc)
    if csid == 10022 then
        invaderXim.crafting.guildPointOnEventUpdate(player, option, npc, invaderXim.guild.BONECRAFT)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 10022 then
        invaderXim.crafting.guildPointOnEventFinish(player, option, invaderXim.guild.BONECRAFT)
    elseif csid == 10023 then
        player:messageSpecial(ID.text.GP_OBTAINED, option)
    end
end

return entity
