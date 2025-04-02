-----------------------------------
-- Area: Lower Jeuno
--  NPC: Vingijard
-----------------------------------
---@type TNpcEntity
local entity = {}

local jobGearTable =
{
    -- [job ID]     = { Weapon,             Head,                  Body,                    Hands,                     Legs,                     Feet                      },
    -- [invaderXim.job.WAR] = { invaderXim.item.RAZOR_AXE,  invaderXim.item.FIGHTERS_MASK, invaderXim.item.FIGHTERS_LORICA, invaderXim.item.FIGHTERS_MUFFLERS, invaderXim.item.FIGHTERS_CUISSES, invaderXim.item.FIGHTERS_CALLIGAE },
    -- [invaderXim.job.MNK] = { invaderXim.item.BEAT_CESTI, invaderXim.item.TEMPLE_CROWN,  invaderXim.item.TEMPLE_CYCLAS,   invaderXim.item.TEMPLE_GLOVES,     invaderXim.item.TEMPLE_HOSE,      invaderXim.item.TEMPLE_GAITERS    },
    -- [invaderXim.job.WHM] = {  },
    -- [invaderXim.job.BLM] = {  },
    -- [invaderXim.job.RDM] = {  },
    -- [invaderXim.job.THF] = {  },
    -- [invaderXim.job.PLD] = {  },
    -- [invaderXim.job.DRK] = {  },
    -- [invaderXim.job.BST] = {  },
    -- [invaderXim.job.BRD] = {  },
    -- [invaderXim.job.RNG] = {  },
    -- [invaderXim.job.SAM] = {  },
    -- [invaderXim.job.NIN] = {  },
    -- [invaderXim.job.DRG] = {  },
    -- [invaderXim.job.SMN] = {  },
    -- [invaderXim.job.BLU] = {  },
    -- [invaderXim.job.COR] = {  },
    -- [invaderXim.job.PUP] = {  },
    -- [invaderXim.job.DNC] = {  },
    -- [invaderXim.job.SCH] = {  },
    -- [invaderXim.job.GEO] = {  },
    -- [invaderXim.job.RUN] = {  },
}

local jobQuestsTable =
{

    [invaderXim.job.WAR] =
    {
        [1] = { invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.THE_DOORMAN             },
        [2] = { invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.THE_TALEKEEPERS_TRUTH   },
        [3] = { invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.THE_TALEKEEPERS_GIFT    },
        [4] = { invaderXim.questLog.JEUNO,  invaderXim.quest.id.jeuno.BORGHERTZS_WARRING_HANDS },
    },
    [invaderXim.job.MNK] =
    {
        [1] = { invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.GHOSTS_OF_THE_PAST       },
        [2] = { invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.THE_FIRST_MEETING        },
        [3] = { invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.TRUE_STRENGTH            },
        [4] = { invaderXim.questLog.JEUNO,  invaderXim.quest.id.jeuno.BORGHERTZS_STRIKING_HANDS },
    },
    [invaderXim.job.WHM] =
    {
        [1] = { invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.MESSENGER_FROM_BEYOND      },
        [2] = { invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.PRELUDE_OF_BLACK_AND_WHITE },
        [3] = { invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.PIEUJES_DECISION           },
        [4] = { invaderXim.questLog.JEUNO,    invaderXim.quest.id.jeuno.BORGHERTZS_HEALING_HANDS      },
    },
    [invaderXim.job.BLM] =
    {
        [1] = { invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_THREE_MAGI          },
        [2] = { invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.RECOLLECTIONS           },
        [3] = { invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_ROOT_OF_THE_PROBLEM },
        [4] = { invaderXim.questLog.JEUNO,    invaderXim.quest.id.jeuno.BORGHERTZS_SORCEROUS_HANDS },
    },
    [invaderXim.job.RDM] =
    {
        [1] = { invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.THE_CRIMSON_TRIAL        },
        [2] = { invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.ENVELOPED_IN_DARKNESS    },
        [3] = { invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.PEACE_FOR_THE_SPIRIT     },
        [4] = { invaderXim.questLog.JEUNO,    invaderXim.quest.id.jeuno.BORGHERTZS_VERMILLION_HANDS },
    },
    [invaderXim.job.THF] =
    {
        [1] = { invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_TENSHODO_SHOWDOWN  },
        [2] = { invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.AS_THICK_AS_THIEVES    },
        [3] = { invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.HITTING_THE_MARQUISATE },
        [4] = { invaderXim.questLog.JEUNO,    invaderXim.quest.id.jeuno.BORGHERTZS_SNEAKY_HANDS   },
    },
    [invaderXim.job.PLD] =
    {
        [1] = { invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.SHARPENING_THE_SWORD   },
        [2] = { invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.A_BOYS_DREAM           },
        [3] = { invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.UNDER_OATH             },
        [4] = { invaderXim.questLog.JEUNO,    invaderXim.quest.id.jeuno.BORGHERTZS_STALWART_HANDS },
    },
    [invaderXim.job.DRK] =
    {
        [1] = { invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.DARK_LEGACY             },
        [2] = { invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.DARK_PUPPET             },
        [3] = { invaderXim.questLog.BASTOK, invaderXim.quest.id.bastok.BLADE_OF_EVIL           },
        [4] = { invaderXim.questLog.JEUNO,  invaderXim.quest.id.jeuno.BORGHERTZS_SHADOWY_HANDS },
    },
    [invaderXim.job.BST] =
    {
        [1] = { invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.WINGS_OF_GOLD         },
        [2] = { invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.SCATTERED_INTO_SHADOW },
        [3] = { invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.A_NEW_DAWN            },
        [4] = { invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.BORGHERTZS_WILD_HANDS },
    },
    [invaderXim.job.BRD] =
    {
        [1] = { invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.PAINFUL_MEMORY              },
        [2] = { invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_REQUIEM                 },
        [3] = { invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_CIRCLE_OF_TIME          },
        [4] = { invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.BORGHERTZS_HARMONIOUS_HANDS },
    },
    [invaderXim.job.RNG] =
    {
        [1] = { invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.SIN_HUNTING           },
        [2] = { invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.FIRE_AND_BRIMSTONE    },
        [3] = { invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.UNBRIDLED_PASSION     },
        [4] = { invaderXim.questLog.JEUNO,    invaderXim.quest.id.jeuno.BORGHERTZS_CHASING_HANDS },
    },
    [invaderXim.job.SAM] =
    {
        [1] = { invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.THE_SACRED_KATANA   },
        [2] = { invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.YOMI_OKURI          },
        [3] = { invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.A_THIEF_IN_NORG     },
        [4] = { invaderXim.questLog.JEUNO,    invaderXim.quest.id.jeuno.BORGHERTZS_LOYAL_HANDS },
    },
    [invaderXim.job.NIN] =
    {
        [1] = { invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.TWENTY_IN_PIRATE_YEARS },
        [2] = { invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.I_LL_TAKE_THE_BIG_BOX  },
        [3] = { invaderXim.questLog.OUTLANDS, invaderXim.quest.id.outlands.TRUE_WILL              },
        [4] = { invaderXim.questLog.JEUNO,    invaderXim.quest.id.jeuno.BORGHERTZS_LURKING_HANDS  },
    },
    [invaderXim.job.DRG] =
    {
        [1] = { invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.A_CRAFTSMANS_WORK    },
        [2] = { invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.CHASING_QUOTAS       },
        [3] = { invaderXim.questLog.SANDORIA, invaderXim.quest.id.sandoria.KNIGHT_STALKER       },
        [4] = { invaderXim.questLog.JEUNO,    invaderXim.quest.id.jeuno.BORGHERTZS_DRAGON_HANDS },
    },
    [invaderXim.job.SMN] =
    {
        [1] = { invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.THE_PUPPET_MASTER     },
        [2] = { invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CLASS_REUNION         },
        [3] = { invaderXim.questLog.WINDURST, invaderXim.quest.id.windurst.CARBUNCLE_DEBACLE     },
        [4] = { invaderXim.questLog.JEUNO,    invaderXim.quest.id.jeuno.BORGHERTZS_CALLING_HANDS },
    },
    [invaderXim.job.BLU] =
    {
        [1] = { invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.BEGINNINGS      },
        [2] = { invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.OMENS           },
        [3] = { invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.TRANSFORMATIONS },
    },
    [invaderXim.job.COR] =
    {
        [1] = { invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.EQUIPPED_FOR_ALL_OCCASIONS     },
        [2] = { invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.NAVIGATING_THE_UNFRIENDLY_SEAS },
        [3] = { invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.AGAINST_ALL_ODDS               },
    },
    [invaderXim.job.PUP] =
    {
        [1] = { invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.THE_WAYWARD_AUTOMATION },
        [2] = { invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.OPERATION_TEATIME      },
        [3] = { invaderXim.questLog.AHT_URHGAN, invaderXim.quest.id.ahtUrhgan.PUPPETMASTER_BLUES     },
    },
    [invaderXim.job.DNC] =
    {
        [1] = { invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_UNFINISHED_WALTZ },
        [2] = { invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.THE_ROAD_TO_DIVADOM  },
        [3] = { invaderXim.questLog.JEUNO, invaderXim.quest.id.jeuno.COMEBACK_QUEEN       },
    },
    [invaderXim.job.SCH] =
    {
        [1] = { invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.ON_SABBATICAL    },
        [2] = { invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.DOWNWARD_HELIX   },
        [3] = { invaderXim.questLog.CRYSTAL_WAR, invaderXim.quest.id.crystalWar.SEEING_BLOOD_RED },
    },
    [invaderXim.job.GEO] =
    {
    },
    [invaderXim.job.RUN] =
    {
    },
}

local function isJobResetingEligible(player, jobId)
    -- Check for gear table job entry existence.
    if jobGearTable[jobId] == nil then
        return false
    end

    -- Check for quest table job entry existence.
    if jobQuestsTable[jobId] == nil then
        return false
    end

    -- Check if player still has any of the job AF pieces.
    for gearPiece = 1, #jobGearTable[jobId] do
        if player:hasItem(jobGearTable[jobId][gearPiece]) then
            return false
        end
    end

    -- Check if the player has completed all job AF quests.
    for questEntry = 1, #jobQuestsTable[jobId] do
        if not player:hasCompletedQuest(jobQuestsTable[jobId][questEntry][1], jobQuestsTable[jobId][questEntry][2]) then
            return false
        end
    end

    return true
end

local function performJobResetting(player, jobId)
    -- Safety check.
    if not isJobResetingEligible(player, jobId) then
        return
    end

    -- Delete all quests.
    for questEntry = 1, #jobQuestsTable[jobId] do
        player:delQuest(jobQuestsTable[jobId][questEntry][1], jobQuestsTable[jobId][questEntry][2])
    end
end

entity.onTrigger = function(player, npc)
    local currentGil    = player:getGil()
    local optionBitmask = 8388606 -- 23 bits. 1st = false. 2nd to 23th = true.

    -- Build option bitmask.
    for jobId = invaderXim.job.WAR, invaderXim.job.RUN do
        if isJobResetingEligible(player, jobId) then
            optionBitmask = optionBitmask - bit.lshift(1, jobId)
        end
    end

    player:startEvent(10034, optionBitmask, currentGil)
end

entity.onEventFinish = function(player, csid, option, npc)
    if
        csid == 10034 and
        option >= invaderXim.job.WAR and
        option <= invaderXim.job.RUN and
        player:getGil() >= 10000 -- Safety check.
    then
        performJobResetting(player, option)
    end
end

return entity
