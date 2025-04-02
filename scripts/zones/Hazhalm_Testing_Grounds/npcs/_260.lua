-----------------------------------
-- Area: Hazhalm_Testing_Grounds
-- NPC: Entry Gate (_260)
-----------------------------------
local ID = zones[invaderXim.zone.HAZHALM_TESTING_GROUNDS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if not invaderXim.einherjar.settings.EINHERJAR_ENABLED then
        return
    end

    if npcUtil.tradeHasExactly(trade, { invaderXim.item.SMOLDERING_LAMP }) then
        if not invaderXim.einherjar.meetsRequirementsForReservation(player) then
            return
        end

        player:startEvent(2,
                0,
                invaderXim.besieged.getMercenaryRank(player),
                invaderXim.einherjar.settings.EINHERJAR_KO_EXPEL_TIME,
                invaderXim.einherjar.settings.EINHERJAR_REENTRY_TIME,
                0, -- Unknown
                invaderXim.einherjar.getChambersMenu(player),
                invaderXim.item.SMOLDERING_LAMP,
                invaderXim.item.GLOWING_LAMP
        )
        -- Continued in onEventUpdate 2
    end

    if npcUtil.tradeHasExactly(trade, { invaderXim.item.GLOWING_LAMP }) then
        local lampObj = trade:getItem()
        local lampData = invaderXim.einherjar.decypherLamp(lampObj)

        if not invaderXim.einherjar.meetsRequirementsForEntry(player, lampData.chamber) then
            return
        end

        player:startEvent(3,
                0x1D + lampData.chamber,
                invaderXim.besieged.getMercenaryRank(player),
                invaderXim.einherjar.settings.EINHERJAR_KO_EXPEL_TIME,
                invaderXim.einherjar.settings.EINHERJAR_REENTRY_TIME,
                0, -- Unknown
                invaderXim.einherjar.getChambersMenu(player),
                invaderXim.item.SMOLDERING_LAMP,
                invaderXim.item.GLOWING_LAMP
        )
        -- Continued in onEventFinish 3,1
    end
end

entity.onTrigger = function(player, npc)
    -- TODO: Entry point for The Rider Cometh
    -- If The Rider Cometh is flagged, no lockout message will show
    -- but the battlefield selection menu will show up
    local lockout = invaderXim.einherjar.isLockedOut(player)
    if lockout ~= 0 then
        player:messageSpecial(ID.text.ENTRY_PROHIBITED, lockout)
        return
    end

    player:messageSpecial(ID.text.GATE_FIRMLY_CLOSED)
end

entity.onEventUpdate = function(player, csid, option, npc)
    if csid == 2 and (option >= 1 and option <= 10) then
        local mask = invaderXim.einherjar.getChambersMenu(player)
        local chamberEntry = invaderXim.einherjar.chambers[option]

        if not chamberEntry or bit.band(mask, chamberEntry.menu) ~= 0 then
            print(string.format("Einherjar: %s attempted to reserve a chamber they don't have access to.", player:getName()))
            player:messageSpecial(ID.text.COULD_NOT_GATHER_DATA)
            player:instanceEntry(npc, 3)
            return
        end

        player:updateEvent(0,
                10,
                invaderXim.settings.main.EINHERJAR_KO_EXPEL_TIME,
                invaderXim.settings.main.EINHERJAR_REENTRY_TIME,
                0,
                invaderXim.einherjar.getChambersMenu(player),
                invaderXim.item.SMOLDERING_LAMP,
                invaderXim.item.GLOWING_LAMP)
        if player:getFreeSlotsCount() ~= 0 then
            local chamberData = invaderXim.einherjar.getChamber(option)
            if chamberData then
                player:instanceEntry(npc, 3) -- 3 == chamber reservation failed
                player:messageSpecial(ID.text.CHAMBER_OCCUPIED, option)
                return
            else
                chamberData = invaderXim.einherjar.createNewChamber(option, player)
                if not chamberData then
                    player:messageSpecial(ID.text.COULD_NOT_GATHER_DATA)
                    player:instanceEntry(npc, 3)
                    return
                end
            end

            invaderXim.einherjar.makeLamp(player, chamberData.id, chamberData.startTime, chamberData.endTime)
            player:instanceEntry(npc, 4)
            -- Continued in onEventFinish 2
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, invaderXim.item.GLOWING_LAMP)
            player:instanceEntry(npc, 3)
        end
    end
end

entity.onEventFinish = function(player, csid, option)
    -- Player has registered their lamp
    if csid == 2 and option >= 65 and option <= 74 then -- > Rossweisse's Chamber < to < Odin's Chamber
        player:messageSpecial(ID.text.GLOWING_LAMP_OBTAINED, invaderXim.item.GLOWING_LAMP)
        player:messageSpecial(ID.text.CLAIM_RELINQUISH, invaderXim.item.GLOWING_LAMP, invaderXim.einherjar.settings.EINHERJAR_RESERVATION_TIMEOUT)
        player:messageSpecial(ID.text.ITEM_OBTAINED, invaderXim.item.GLOWING_LAMP)
        player:confirmTrade()
    elseif csid == 3 and option == 1 then -- player requested entry into chamber
        local tradeContainer = player:getTrade()
        if tradeContainer then
            local lampObj = tradeContainer:getItem()
            local lampData = invaderXim.einherjar.decypherLamp(lampObj)
            tradeContainer:clean() -- release the lamp
            if lampData then
                local chamberData = invaderXim.einherjar.getChamber(lampData.chamber)
                if chamberData and chamberData.startTime == lampData.startTime then
                    invaderXim.einherjar.onChamberEnter(chamberData, player)
                end
            end
        end
    end
end

return entity
