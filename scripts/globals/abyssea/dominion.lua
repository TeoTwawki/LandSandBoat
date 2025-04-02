-----------------------------------
-- Dominion Sergeant Global
-----------------------------------
require('scripts/globals/quests')
-----------------------------------
xi = xi or {}
invaderXim.abyssea = invaderXim.abyssea or {}

local sergeantData =
{
--  NPC Name                Zone                        CSID OpMask
    ['DSgt_Excenmille'] = { invaderXim.zone.ABYSSEA_ALTEPA,     500, 30846 }, -- !pos -330.655 -2.120 -612.885 218
    ['DSgt_Nanaa']      = { invaderXim.zone.ABYSSEA_ALTEPA,     501,  8176 }, -- !pos -848.093 -9.813 -605.970 218
    ['DSgt_Volker']     = { invaderXim.zone.ABYSSEA_ALTEPA,     502, 26510 }, -- !pos -319.894 -0.736 -167.842 218
    ['DSgt_Maat']       = { invaderXim.zone.ABYSSEA_ULEGUERAND, 500, 32270 },
    ['DSgt_Romaa']      = { invaderXim.zone.ABYSSEA_ULEGUERAND, 501,  6654 },
    ['DSgt_Zazarg']     = { invaderXim.zone.ABYSSEA_ULEGUERAND, 502, 26608 },
    ['DSgt_Wolfgang']   = { invaderXim.zone.ABYSSEA_GRAUBERG,   500, 32688 },
    ['DSgt_Cornelia']   = { invaderXim.zone.ABYSSEA_GRAUBERG,   501,  6606 }, -- !pos -15.513 0.64 -482.04 254
    ['DSgt_Tosuka']     = { invaderXim.zone.ABYSSEA_GRAUBERG,   502, 26238 },
}

local opZone =
{
    [invaderXim.zone.ABYSSEA_ALTEPA    ] = 0,
    [invaderXim.zone.ABYSSEA_ULEGUERAND] = 1,
    [invaderXim.zone.ABYSSEA_GRAUBERG  ] = 2,
}

-- Dominion Op XP Range is listed as 600~4950, which is up to an 8x even multiplier
-- Set bonus to (float)basexp * (1 + (influencePct/12.5)) ? TODO: Research amounts vs influence
-- Low chance of valid seals, seals by zone or quest?

local baseRewardValue = 1000
local dominionOpQuests =
{
    -- Abyssea - Altepa
    [560] = { invaderXim.quest.id.abyssea.DOMINION_OP_01_ALTEPA, 5, baseRewardValue },
    [561] = { invaderXim.quest.id.abyssea.DOMINION_OP_02_ALTEPA, 5, baseRewardValue },
    [562] = { invaderXim.quest.id.abyssea.DOMINION_OP_03_ALTEPA, 5, baseRewardValue },
    [563] = { invaderXim.quest.id.abyssea.DOMINION_OP_04_ALTEPA, 5, baseRewardValue },
    [564] = { invaderXim.quest.id.abyssea.DOMINION_OP_05_ALTEPA, 5, baseRewardValue },
    [565] = { invaderXim.quest.id.abyssea.DOMINION_OP_06_ALTEPA, 5, baseRewardValue },
    [566] = { invaderXim.quest.id.abyssea.DOMINION_OP_07_ALTEPA, 5, baseRewardValue },
    [567] = { invaderXim.quest.id.abyssea.DOMINION_OP_08_ALTEPA, 5, baseRewardValue },
    [568] = { invaderXim.quest.id.abyssea.DOMINION_OP_09_ALTEPA, 5, baseRewardValue },
    [569] = { invaderXim.quest.id.abyssea.DOMINION_OP_10_ALTEPA, 5, baseRewardValue },
    [570] = { invaderXim.quest.id.abyssea.DOMINION_OP_11_ALTEPA, 5, baseRewardValue },
    [571] = { invaderXim.quest.id.abyssea.DOMINION_OP_12_ALTEPA, 5, baseRewardValue },
    [572] = { invaderXim.quest.id.abyssea.DOMINION_OP_13_ALTEPA, 5, baseRewardValue },
    [573] = { invaderXim.quest.id.abyssea.DOMINION_OP_14_ALTEPA, 5, baseRewardValue },

    -- Abyssea - Uleguerand
    [574] = { invaderXim.quest.id.abyssea.DOMINION_OP_01_ULEGUERAND, 5, baseRewardValue },
    [575] = { invaderXim.quest.id.abyssea.DOMINION_OP_02_ULEGUERAND, 5, baseRewardValue },
    [576] = { invaderXim.quest.id.abyssea.DOMINION_OP_03_ULEGUERAND, 5, baseRewardValue },
    [577] = { invaderXim.quest.id.abyssea.DOMINION_OP_04_ULEGUERAND, 5, baseRewardValue },
    [578] = { invaderXim.quest.id.abyssea.DOMINION_OP_05_ULEGUERAND, 5, baseRewardValue },
    [579] = { invaderXim.quest.id.abyssea.DOMINION_OP_06_ULEGUERAND, 5, baseRewardValue },
    [580] = { invaderXim.quest.id.abyssea.DOMINION_OP_07_ULEGUERAND, 5, baseRewardValue },
    [581] = { invaderXim.quest.id.abyssea.DOMINION_OP_08_ULEGUERAND, 5, baseRewardValue },
    [582] = { invaderXim.quest.id.abyssea.DOMINION_OP_09_ULEGUERAND, 5, baseRewardValue },
    [583] = { invaderXim.quest.id.abyssea.DOMINION_OP_10_ULEGUERAND, 5, baseRewardValue },
    [584] = { invaderXim.quest.id.abyssea.DOMINION_OP_11_ULEGUERAND, 5, baseRewardValue },
    [585] = { invaderXim.quest.id.abyssea.DOMINION_OP_12_ULEGUERAND, 5, baseRewardValue },
    [586] = { invaderXim.quest.id.abyssea.DOMINION_OP_13_ULEGUERAND, 5, baseRewardValue },
    [587] = { invaderXim.quest.id.abyssea.DOMINION_OP_14_ULEGUERAND, 5, baseRewardValue },

    -- Abyssea - Grauberg
    [588] = { invaderXim.quest.id.abyssea.DOMINION_OP_01_GRAUBERG, 5, baseRewardValue },
    [589] = { invaderXim.quest.id.abyssea.DOMINION_OP_02_GRAUBERG, 5, baseRewardValue },
    [590] = { invaderXim.quest.id.abyssea.DOMINION_OP_03_GRAUBERG, 5, baseRewardValue },
    [591] = { invaderXim.quest.id.abyssea.DOMINION_OP_04_GRAUBERG, 5, baseRewardValue },
    [592] = { invaderXim.quest.id.abyssea.DOMINION_OP_05_GRAUBERG, 5, baseRewardValue },
    [593] = { invaderXim.quest.id.abyssea.DOMINION_OP_06_GRAUBERG, 5, baseRewardValue },
    [594] = { invaderXim.quest.id.abyssea.DOMINION_OP_07_GRAUBERG, 5, baseRewardValue },
    [595] = { invaderXim.quest.id.abyssea.DOMINION_OP_08_GRAUBERG, 5, baseRewardValue },
    [596] = { invaderXim.quest.id.abyssea.DOMINION_OP_09_GRAUBERG, 5, baseRewardValue },
    [597] = { invaderXim.quest.id.abyssea.DOMINION_OP_10_GRAUBERG, 5, baseRewardValue },
    [598] = { invaderXim.quest.id.abyssea.DOMINION_OP_11_GRAUBERG, 5, baseRewardValue },
    [599] = { invaderXim.quest.id.abyssea.DOMINION_OP_12_GRAUBERG, 5, baseRewardValue },
    [600] = { invaderXim.quest.id.abyssea.DOMINION_OP_13_GRAUBERG, 5, baseRewardValue },
    [601] = { invaderXim.quest.id.abyssea.DOMINION_OP_14_GRAUBERG, 5, baseRewardValue },
}

local function getPackedInfluenceList(zoneID)
    local packedInfluence = { 0, 0, 0, 0 }

    for serverVarID = 1, 4 do
        packedInfluence[serverVarID] = GetServerVariable('dOpInfluence[' .. zoneID .. '][' .. serverVarID .. ']')
    end

    return packedInfluence
end

local function savePackedInfluenceList(zoneID, influenceList)
    local packedInfluenceData = { 0, 0, 0, 0 }

    for opNumber = 1, 14 do
        local serverVarID = math.floor((opNumber - 1) / 4) + 1
        local bitOffset = ((opNumber - 1) % 4) * 8

        packedInfluenceData[serverVarID] = packedInfluenceData[serverVarID] + bit.lshift(influenceList[opNumber], bitOffset)
    end

    for serverVarID = 1, 4 do
        SetServerVariable('dOpInfluence[' .. zoneID .. '][' .. serverVarID .. ']', packedInfluenceData[serverVarID])
    end
end

local function getOpInfluenceList(zoneID)
    local influenceTable = { }

    for serverVarID = 1, 4 do
        local packedData = GetServerVariable('dOpInfluence[' .. zoneID .. '][' .. serverVarID .. ']')

        local startIndex = (serverVarID - 1) * 4 + 1
        for opNumber = startIndex, startIndex + 3 do
            if opNumber > 14 then
                break
            end

            influenceTable[opNumber] = bit.band(bit.rshift(packedData, 8 * (opNumber - 1)), 0xFF)
        end
    end

    return influenceTable
end

local function getProgressVar(opID)
    return 'Quest[8][' .. dominionOpQuests[opID][1] .. ']Prog'
end

local function clearOpVars(player, opID)
    player:setCharVar('activeDominionOp', 0)
    player:setCharVar(getProgressVar(opID), 0)
end

local function completeDominionOp(player, opID)
    local ID = zones[player:getZoneID()]

    local xpMultiplier = 1
    if player:getMainLvl() < 75 then
        xpMultiplier = xpMultiplier - (75 - player:getMainLvl()) * .02
    end

    player:completeQuest(invaderXim.questLog.ABYSSEA, dominionOpQuests[opID][1])
    player:addExp(dominionOpQuests[opID][3] * xpMultiplier)
    player:addCurrency('cruor', dominionOpQuests[opID][3] / 5)
    player:messageSpecial(ID.text.CRUOR_TOTAL, dominionOpQuests[opID][3] / 5, player:getCurrency('cruor'))
    player:addCurrency('dominion_note', dominionOpQuests[opID][3] / 10)
    player:messageSpecial(ID.text.OBTAINS_DOMINION_NOTES, dominionOpQuests[opID][3] / 10, player:getCurrency('dominion_note'))

    clearOpVars(player, opID)
end

invaderXim.abyssea.dominionOnMobDeath = function(mob, player, dominionOpID)
    local progVarName = getProgressVar(dominionOpID)
    local numDefeated = player:getCharVar(progVarName)

    if numDefeated < dominionOpQuests[dominionOpID][2] then
        numDefeated = numDefeated + 1
        player:messageBasic(invaderXim.msg.basic.FOV_DEFEATED_TARGET, numDefeated, dominionOpQuests[dominionOpID][2])
        player:setCharVar(progVarName, numDefeated)
    end
end

invaderXim.abyssea.sergeantOnTrigger = function(player, npc)
    local sergeantInfo  = sergeantData[npc:getName()]
    local activeOp      = player:getCharVar('activeDominionOp')
    local dominionNotes = player:getCurrency('dominion_note')

    if activeOp == 0 then
        local packedInfluence = getPackedInfluenceList(player:getZoneID())

        player:startEvent(sergeantInfo[2], packedInfluence[1], packedInfluence[2], packedInfluence[3], packedInfluence[4], sergeantInfo[3], 0, dominionNotes, 0)
    else
        local opProgress = player:getCharVar(getProgressVar(activeOp))
        local opStatus   = 1

        if player:getZoneID() ~= sergeantInfo[1] then
            opStatus = 3
        elseif opProgress >= dominionOpQuests[activeOp][2] then
            opStatus = 2
        end

        player:startEvent(sergeantInfo[2], activeOp, dominionOpQuests[activeOp][2], opProgress, 0, 0, 0, 0, opStatus)
    end
end

invaderXim.abyssea.sergeantOnEventUpdate = function(player, csid, option, npc)
    local updateType = bit.band(option, 0xF)

    if updateType == 2 then
        local selectedOp = bit.rshift(option, 4)
        local opID = 559 + opZone[player:getZoneID()] * 14 + selectedOp

        player:updateEvent(dominionOpQuests[opID][2], 0, 0, 0, 0, 0, 0, opID)

    elseif updateType == 6 then
        player:updateEvent(1) -- Difficulty (0..4)

    -- Show sphere of influence bonuses
    -- TODO: player:updateEvent(2, 2, 2, 2, 2, 2, 1, 256)
    elseif updateType == 9 then
        player:updateEvent(0, 0, 0, 0, 0, 0, 0, 0)
    end
end

invaderXim.abyssea.sergeantOnEventFinish = function(player, csid, option, npc)
    local finishType    = bit.band(option, 0xF)
    local zoneID        = player:getZoneID()
    local ID            = zones[zoneID]
    local influenceList = getOpInfluenceList(zoneID)

    -- Activate OP
    if finishType == 2 then
        local selectedOp = bit.rshift(option, 4)
        local opID       = 559 + opZone[player:getZoneID()] * 14 + selectedOp

        player:addQuest(invaderXim.questLog.ABYSSEA, dominionOpQuests[opID][1])
        player:setCharVar('activeDominionOp', opID)
        player:messageSpecial(ID.text.DOMINION_SIGNED_ON)

    -- Cancel OP
    elseif finishType == 3 then
        local activeOp = player:getCharVar('activeDominionOp')

        player:delQuest(invaderXim.questLog.ABYSSEA, dominionOpQuests[activeOp][1])
        clearOpVars(player, activeOp)
        player:messageSpecial(ID.text.CANCELED_OBJECTIVE)

    -- Complete OP
    elseif finishType == 8 then
        local activeOp = player:getCharVar('activeDominionOp')

        completeDominionOp(player, activeOp)
    end

    savePackedInfluenceList(zoneID, influenceList)
end
