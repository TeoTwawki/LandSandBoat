-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Runic Portal
-- Aht Urhgan Teleporter to Other Areas
-----------------------------------
local ID = zones[invaderXim.zone.AHT_URHGAN_WHITEGATE]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local runicPortals  = player:getTeleport(invaderXim.teleport.type.RUNIC_PORTAL)
    local assaultOrders =
    {
        [0] = { KI = invaderXim.ki.LEUJAOAM_ASSAULT_ORDERS,   tele = 0x02, valid = 2,  event = 120 },
        [1] = { KI = invaderXim.ki.MAMOOL_JA_ASSAULT_ORDERS,  tele = 0x08, valid = 8,  event = 121 },
        [2] = { KI = invaderXim.ki.LEBROS_ASSAULT_ORDERS,     tele = 0x10, valid = 16, event = 122 },
        [3] = { KI = invaderXim.ki.PERIQIA_ASSAULT_ORDERS,    tele = 0x04, valid = 4,  event = 123 },
        [4] = { KI = invaderXim.ki.ILRUSI_ASSAULT_ORDERS,     tele = 0x20, valid = 32, event = 124 },
        [5] = { KI = invaderXim.ki.NYZUL_ISLE_ASSAULT_ORDERS, tele = 0x40, valid = 64, event = 125 },
    }

    if invaderXim.assault.hasOrders(player) then
        for k, v in pairs(assaultOrders) do
            if player:hasKeyItem(v.KI) then
                local validTeleport = bit.band(runicPortals, v.tele)
                player:messageSpecial(ID.text.CONFIRMING, v.KI)

                if validTeleport == v.valid then
                    player:startEvent(v.event)
                else
                    player:messageSpecial(ID.text.RUNIC_DENIED_ASSAULT_OFFSET + k)
                end

                break
            end
        end
    else
        local hasPermit = player:hasKeyItem(invaderXim.ki.RUNIC_PORTAL_USE_PERMIT)
        local mercRank  = invaderXim.besieged.getMercenaryRank(player)
        local points    = player:getCurrency('imperial_standing')
        local hasAstral = invaderXim.besieged.getAstralCandescence()
        local isCaptain = player:hasKeyItem(invaderXim.ki.CAPTAIN_WILDCAT_BADGE)

        if isCaptain then
            player:messageSpecial(ID.text.IMPERIAL_AUTHORIZATION) -- TODO: This may show in other cases
            hasPermit = false -- #1 and  #7 are always set to 0 for Captains
        end

        player:startEvent(101, hasPermit and invaderXim.ki.RUNIC_PORTAL_USE_PERMIT or 0, runicPortals, mercRank, points, isCaptain and 1 or 0, hasAstral, hasPermit and 1 or 0, 0)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    local portalPick =
    {
        [1]    = invaderXim.teleport.id.AZOUPH_SP,
        [2]    = invaderXim.teleport.id.DVUCCA_SP,
        [3]    = invaderXim.teleport.id.MAMOOL_SP,
        [4]    = invaderXim.teleport.id.HALVUNG_SP,
        [5]    = invaderXim.teleport.id.ILRUSI_SP,
        [6]    = invaderXim.teleport.id.NYZUL_SP,
        [101]  = invaderXim.teleport.id.AZOUPH_SP,
        [102]  = invaderXim.teleport.id.DVUCCA_SP,
        [103]  = invaderXim.teleport.id.MAMOOL_SP,
        [104]  = invaderXim.teleport.id.HALVUNG_SP,
        [105]  = invaderXim.teleport.id.ILRUSI_SP,
        [106]  = invaderXim.teleport.id.NYZUL_SP,
        [120]  = invaderXim.teleport.id.AZOUPH_SP,
        [121]  = invaderXim.teleport.id.MAMOOL_SP,
        [122]  = invaderXim.teleport.id.HALVUNG_SP,
        [123]  = invaderXim.teleport.id.DVUCCA_SP,
        [124]  = invaderXim.teleport.id.ILRUSI_SP,
        [125]  = invaderXim.teleport.id.NYZUL_SP,
        [1001] = invaderXim.teleport.id.AZOUPH_SP,
        [1002] = invaderXim.teleport.id.DVUCCA_SP,
        [1003] = invaderXim.teleport.id.MAMOOL_SP,
        [1004] = invaderXim.teleport.id.HALVUNG_SP,
        [1005] = invaderXim.teleport.id.ILRUSI_SP,
        [1006] = invaderXim.teleport.id.NYZUL_SP,
    }

    if csid == 101 and option > 100 and option < 1007 then
        if option >= 101 and option <= 106 then
            player:delKeyItem(invaderXim.ki.RUNIC_PORTAL_USE_PERMIT)
            invaderXim.teleport.to(player, portalPick[option])
        elseif option >= 1001 and option <= 1006 then
            if player:getCurrency('imperial_standing') >= 200 then
                player:delCurrency('imperial_standing', 200)
                invaderXim.teleport.to(player, portalPick[option])
            else
                player:messageSpecial(ID.text.SUFFICIENT_IMPERIAL_STANDING)
            end
        end
    elseif csid == 101 and option >= 1 and option <= 6 then -- Captains dont lose permit
        invaderXim.teleport.to(player, portalPick[option])
    elseif csid >= 120 and csid <= 125 and option == 1 then
        invaderXim.teleport.to(player, portalPick[csid])
    end
end

return entity
