-----------------------------------
-- Area: Mhaura
--  NPC: Celestina
-- Finish Quest: The Sand Charm
-- Involved in Quest: Riding on the Clouds
-- Guild Merchant NPC: Goldsmithing Guild
-- !pos -37.624 -16.050 75.681 249
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local guildSkillId = invaderXim.skill.GOLDSMITHING
    local stock = invaderXim.shop.generalGuildStock[guildSkillId]
    invaderXim.shop.generalGuild(player, stock, guildSkillId)
end

return entity
