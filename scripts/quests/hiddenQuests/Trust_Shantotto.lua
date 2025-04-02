-----------------------------------
-- Trust: Shantotto
-----------------------------------
-- Shantotto : !pos 122 -2 112 239
-----------------------------------
local wallsID = zones[invaderXim.zone.WINDURST_WALLS]
-----------------------------------

local quest = HiddenQuest:new('TrustShantotto')

local requiredTrusts =
{
    invaderXim.magic.spell.KUPIPI,
    invaderXim.magic.spell.NANAA_MIHGO,
    invaderXim.magic.spell.AJIDO_MARUJIDO,
    invaderXim.magic.spell.EXCENMILLE,
    invaderXim.magic.spell.CURILLA,
    invaderXim.magic.spell.TRION,
    invaderXim.magic.spell.AYAME,
    invaderXim.magic.spell.NAJI,
    invaderXim.magic.spell.VOLKER,
}

local function hasRequiredTrusts(player)
    for _, trustSpellId in ipairs(requiredTrusts) do
        if not player:hasSpell(trustSpellId) then
            return false
        end
    end

    return true
end

local trustMemory = function(player)
    local memories = 0
    --[[ TODO
    -- 2 - The Three Kingdoms
    if player:hasCompletedMission(invaderXim.mission.log_id.SANDORIA, invaderXim.mission.id.sandoria.JOURNEY_TO_BASTOK2) or player:hasCompletedMission(invaderXim.mission.log_id.WINDURST, invaderXim.mission.id.windurst.THE_THREE_KINGDOMS_BASTOK2) then
        memories = memories + 2
    end
    -- 4 - Where Two Paths Converge
    if player:hasCompletedMission(invaderXim.mission.log_id.BASTOK, invaderXim.mission.id.bastok.WHERE_TWO_PATHS_CONVERGE) then
        memories = memories + 4
    end
    -- 8 - The Pirate's Cove
    if player:hasCompletedMission(invaderXim.mission.log_id.BASTOK, invaderXim.mission.id.bastok.THE_PIRATES_COVE) then
        memories = memories + 8
    end
    -- 16 - Ayame and Kaede
    if player:hasCompletedQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.AYAME_AND_KAEDE) then
        memories = memories + 16
    end
    -- 32 - Light of Judgement
    if player:hasCompletedMission(invaderXim.mission.log_id.TOAU, invaderXim.mission.id.toau.LIGHT_OF_JUDGMENT) then
        memories = memories + 32
    end
    -- 64 - True Strength
    if player:hasCompletedQuest(invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.TRUE_STRENGTH) then
        memories = memories + 64
    end
    ]]--

    -- Kill a Taru under the gun
    -- Defeated Shadowlord
    -- Saving Star Sibyl
    -- Grade, came up in spades
    -- Bring back Prishe
    -- Yoran Oran: No Heir
    -- Incident with Ragnarok
    -- Chocobo Races
    -- Markovich
    -- Puppet Twin battle
    -- Yoran-Oran and Koru-Moru
    -- Grimy Hat
    return memories
end

quest.sections =
{
    {
        check = function(player, questVars, vars)
            return not player:hasSpell(invaderXim.magic.spell.SHANTOTTO) and
                player:hasKeyItem(invaderXim.ki.WINDURST_TRUST_PERMIT)
        end,

        [invaderXim.zone.WINDURST_WALLS] =
        {
            ['Shantotto'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasCompletedQuest(invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CURSES_FOILED_A_GOLEM) and
                        hasRequiredTrusts(player)
                    then
                        return quest:progressEvent(529, { [3] = trustMemory(player), [7] = 1 })
                    else
                        return quest:event(529):importantEvent()
                    end
                end,
            },

            onEventFinish =
            {
                [529] = function(player, csid, option, npc)
                    if option == 2 then
                        player:addSpell(invaderXim.magic.spell.SHANTOTTO, true, true)
                        player:messageSpecial(wallsID.text.YOU_LEARNED_TRUST, 0, invaderXim.magic.spell.SHANTOTTO)
                    end
                end,
            },
        },
    },
}

return quest
