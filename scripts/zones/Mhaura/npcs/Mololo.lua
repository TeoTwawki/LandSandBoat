-----------------------------------
-- Area: Mhaura
--  NPC: Mololo
-- Guild Merchant NPC: Blacksmithing Guild
-- !pos -64.278 -16.624 34.120 249
-----------------------------------
local ID = zones[invaderXim.zone.MHAURA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local guildSkillId = invaderXim.skill.SMITHING
    local stock = invaderXim.shop.generalGuildStock[guildSkillId]
    invaderXim.shop.generalGuild(player, stock, guildSkillId)
    player:showText(npc, ID.text.SMITHING_GUILD)
end

return entity
