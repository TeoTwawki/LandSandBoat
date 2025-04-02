-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: qm_itzpapalotl_3 (???)
-- Spawns Itzpapalotl
-- !pos 439.940 21.020 -179.227 215
-----------------------------------
local ID = zones[invaderXim.zone.ABYSSEA_ATTOHWA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    invaderXim.abyssea.qmOnTrigger(player, npc, ID.mob.ITZPAPALOTL_OFFSET + 8, { invaderXim.ki.VENOMOUS_WAMOURA_FEELER, invaderXim.ki.BULBOUS_CRAWLER_COCOON, invaderXim.ki.DISTENDED_CHIGOE_ABDOMEN })
end

entity.onEventUpdate = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    invaderXim.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
