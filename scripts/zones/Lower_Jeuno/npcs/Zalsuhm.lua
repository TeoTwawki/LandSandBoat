-----------------------------------
-- Area: Lower Jeuno
--  NPC: Zalsuhm
-----------------------------------
local ID = zones[invaderXim.zone.LOWER_JEUNO]
-----------------------------------
---@type TNpcEntity
local entity = {}

local function getQuestId(mainJobId)
    return invaderXim.quest.id.jeuno.UNLOCKING_A_MYTH_WARRIOR - 1 + mainJobId
end

entity.onTrade = function(player, npc, trade)
    for i, wepId in pairs(invaderXim.equipment.baseNyzulWeapons) do
        if npcUtil.tradeHasExactly(trade, wepId) then
            local unlockingAMyth = player:getQuestStatus(invaderXim.questLog.JEUNO, getQuestId(i))
            if unlockingAMyth == invaderXim.questStatus.QUEST_ACCEPTED then
                local wsPoints = trade:getItem(0):getWeaponskillPoints()
                if wsPoints <= 49 then
                    player:startEvent(10091)
                elseif wsPoints <= 200 then
                    player:startEvent(10092)
                elseif wsPoints <= 249 then
                    player:startEvent(10093)
                elseif wsPoints >= 250 then
                    player:startEvent(10088, i)
                end
            end

            return
        end
    end
end

entity.onTrigger = function(player, npc)
    local mainJobId         = player:getMainJob()
    local unlockingAMyth    = player:getQuestStatus(invaderXim.questLog.JEUNO, getQuestId(mainJobId))
    local nyzulWeaponMain   = invaderXim.equip.isBaseNyzulWeapon(player:getEquipID(invaderXim.slot.MAIN))
    local nyzulWeaponRanged = invaderXim.equip.isBaseNyzulWeapon(player:getEquipID(invaderXim.slot.RANGED))

    if unlockingAMyth == invaderXim.questStatus.QUEST_AVAILABLE then
        if player:needToZone() and player:getCharVar('Upset_Zalsuhm') > 0 then
            player:startEvent(10090)
        else
            if player:getCharVar('Upset_Zalsuhm') > 0 then
                player:setCharVar('Upset_Zalsuhm', 0)
            end

            if nyzulWeaponMain or nyzulWeaponRanged then
                player:startEvent(10086, mainJobId)
            else
                player:startEvent(10085)
            end
        end
    elseif unlockingAMyth == invaderXim.questStatus.QUEST_ACCEPTED then
        player:startEvent(10087)
    else
        player:startEvent(10089)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    local questId = getQuestId(option)
    if csid == 10086 then
        if option == 53 then
            player:setCharVar('Upset_Zalsuhm', 1)
            player:needToZone(true)
        elseif option <= invaderXim.job.SCH then
            player:addQuest(invaderXim.questLog.JEUNO, questId)
        end
    elseif csid == 10088 and option <= invaderXim.job.SCH then
        local jobs =
        {
            [invaderXim.job.WAR] = invaderXim.wsUnlock.KINGS_JUSTICE,
            [invaderXim.job.MNK] = invaderXim.wsUnlock.ASCETICS_FURY,
            [invaderXim.job.WHM] = invaderXim.wsUnlock.MYSTIC_BOON,
            [invaderXim.job.BLM] = invaderXim.wsUnlock.VIDOHUNIR,
            [invaderXim.job.RDM] = invaderXim.wsUnlock.DEATH_BLOSSOM,
            [invaderXim.job.THF] = invaderXim.wsUnlock.MANDALIC_STAB,
            [invaderXim.job.PLD] = invaderXim.wsUnlock.ATONEMENT,
            [invaderXim.job.DRK] = invaderXim.wsUnlock.INSURGENCY,
            [invaderXim.job.BST] = invaderXim.wsUnlock.PRIMAL_REND,
            [invaderXim.job.BRD] = invaderXim.wsUnlock.MORDANT_RIME,
            [invaderXim.job.RNG] = invaderXim.wsUnlock.TRUEFLIGHT,
            [invaderXim.job.SAM] = invaderXim.wsUnlock.TACHI_RANA,
            [invaderXim.job.NIN] = invaderXim.wsUnlock.BLADE_KAMU,
            [invaderXim.job.DRG] = invaderXim.wsUnlock.DRAKESBANE,
            [invaderXim.job.SMN] = invaderXim.wsUnlock.GARLAND_OF_BLISS,
            [invaderXim.job.BLU] = invaderXim.wsUnlock.EXPIACION,
            [invaderXim.job.COR] = invaderXim.wsUnlock.LEADEN_SALUTE,
            [invaderXim.job.PUP] = invaderXim.wsUnlock.STRINGING_PUMMEL,
            [invaderXim.job.DNC] = invaderXim.wsUnlock.PYRRHIC_KLEOS,
            [invaderXim.job.SCH] = invaderXim.wsUnlock.OMNISCIENCE,
        }
        local skill = jobs[option]

        player:completeQuest(invaderXim.questLog.JEUNO, questId)
        player:messageSpecial(ID.text.MYTHIC_LEARNED, player:getMainJob())
        player:addLearnedWeaponskill(skill)
    end
end

return entity
