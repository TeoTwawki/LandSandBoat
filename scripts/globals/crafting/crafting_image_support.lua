-----------------------------------
-- Image Support NPCs
-----------------------------------
require('scripts/globals/crafting/crafting_utils')
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.crafting = invaderXim.crafting or {}

local npcTable =
{
    --    ['npc_name'] = { type, event, guild_id,           skill_id,              effect_id,                     },
    ['Panja-Nanja'   ] = { 0, 10011, invaderXim.guild.FISHING,      invaderXim.skill.FISHING,      invaderXim.effect.FISHING_IMAGERY      }, -- Advanced
    ['Erabu-Fumulubu'] = { 1, 10012, invaderXim.guild.FISHING,      invaderXim.skill.FISHING,      invaderXim.effect.FISHING_IMAGERY      }, -- Free
    ['Degong'        ] = { 2, 10013, invaderXim.guild.FISHING,      invaderXim.skill.FISHING,      invaderXim.effect.FISHING_IMAGERY      }, -- Free
    ['Ulycille'      ] = { 0,   623, invaderXim.guild.WOODWORKING,  invaderXim.skill.WOODWORKING,  invaderXim.effect.WOODWORKING_IMAGERY  }, -- Advanced
    ['Amarefice'     ] = { 1,   624, invaderXim.guild.WOODWORKING,  invaderXim.skill.WOODWORKING,  invaderXim.effect.WOODWORKING_IMAGERY  }, -- Free
    ['Ramua'         ] = { 2,   625, invaderXim.guild.WOODWORKING,  invaderXim.skill.WOODWORKING,  invaderXim.effect.WOODWORKING_IMAGERY  }, -- Free
    ['Wise_Owl'      ] = { 0,   103, invaderXim.guild.SMITHING,     invaderXim.skill.SMITHING,     invaderXim.effect.SMITHING_IMAGERY     }, -- Advanced
    ['Hugues'        ] = { 1,   104, invaderXim.guild.SMITHING,     invaderXim.skill.SMITHING,     invaderXim.effect.SMITHING_IMAGERY     }, -- Free
    ['Romero'        ] = { 2,   105, invaderXim.guild.SMITHING,     invaderXim.skill.SMITHING,     invaderXim.effect.SMITHING_IMAGERY     }, -- Free
    ['Greubaque'     ] = { 0,   628, invaderXim.guild.SMITHING,     invaderXim.skill.SMITHING,     invaderXim.effect.SMITHING_IMAGERY     }, -- Advanced
    ['Pinok-Morok'   ] = { 1,   629, invaderXim.guild.SMITHING,     invaderXim.skill.SMITHING,     invaderXim.effect.SMITHING_IMAGERY     }, -- Free
    ['Beadurinc'     ] = { 2,   630, invaderXim.guild.SMITHING,     invaderXim.skill.SMITHING,     invaderXim.effect.SMITHING_IMAGERY     }, -- Free
    ['Fatimah'       ] = { 0,   302, invaderXim.guild.GOLDSMITHING, invaderXim.skill.GOLDSMITHING, invaderXim.effect.GOLDSMITHING_IMAGERY }, -- Advanced
    ['Wulfnoth'      ] = { 1,   303, invaderXim.guild.GOLDSMITHING, invaderXim.skill.GOLDSMITHING, invaderXim.effect.GOLDSMITHING_IMAGERY }, -- Free
    ['Ulrike'        ] = { 2,   304, invaderXim.guild.GOLDSMITHING, invaderXim.skill.GOLDSMITHING, invaderXim.effect.GOLDSMITHING_IMAGERY }, -- Free
    ['Terude-Harude' ] = { 0, 10013, invaderXim.guild.CLOTHCRAFT,   invaderXim.skill.CLOTHCRAFT,   invaderXim.effect.CLOTHCRAFT_IMAGERY   }, -- Advanced
    ['Nikkoko'       ] = { 1, 10014, invaderXim.guild.CLOTHCRAFT,   invaderXim.skill.CLOTHCRAFT,   invaderXim.effect.CLOTHCRAFT_IMAGERY   }, -- Free
    ['Anillah'       ] = { 2, 10015, invaderXim.guild.CLOTHCRAFT,   invaderXim.skill.CLOTHCRAFT,   invaderXim.effect.CLOTHCRAFT_IMAGERY   }, -- Free
    ['Orechiniel'    ] = { 0,   650, invaderXim.guild.LEATHERCRAFT, invaderXim.skill.LEATHERCRAFT, invaderXim.effect.LEATHERCRAFT_IMAGERY }, -- Advanced
    ['Kipopo'        ] = { 1,   651, invaderXim.guild.LEATHERCRAFT, invaderXim.skill.LEATHERCRAFT, invaderXim.effect.LEATHERCRAFT_IMAGERY }, -- Free
    ['Tek_Lengyon'   ] = { 2,   652, invaderXim.guild.LEATHERCRAFT, invaderXim.skill.LEATHERCRAFT, invaderXim.effect.LEATHERCRAFT_IMAGERY }, -- Free
    ['Lih_Pituu'     ] = { 0, 10018, invaderXim.guild.BONECRAFT,    invaderXim.skill.BONECRAFT,    invaderXim.effect.BONECRAFT_IMAGERY    }, -- Advanced
    ['Ronana'        ] = { 1, 10019, invaderXim.guild.BONECRAFT,    invaderXim.skill.BONECRAFT,    invaderXim.effect.BONECRAFT_IMAGERY    }, -- Free
    ['Kyaa_Taali'    ] = { 2, 10020, invaderXim.guild.BONECRAFT,    invaderXim.skill.BONECRAFT,    invaderXim.effect.BONECRAFT_IMAGERY    }, -- Free
    ['Azima'         ] = { 0,   122, invaderXim.guild.ALCHEMY,      invaderXim.skill.ALCHEMY,      invaderXim.effect.ALCHEMY_IMAGERY      }, -- Advanced
    ['Titus'         ] = { 1,   123, invaderXim.guild.ALCHEMY,      invaderXim.skill.ALCHEMY,      invaderXim.effect.ALCHEMY_IMAGERY      }, -- Free
    ['Sieglinde'     ] = { 2,   124, invaderXim.guild.ALCHEMY,      invaderXim.skill.ALCHEMY,      invaderXim.effect.ALCHEMY_IMAGERY      }, -- Free
    ['Kipo-Opo'      ] = { 0, 10015, invaderXim.guild.COOKING,      invaderXim.skill.COOKING,      invaderXim.effect.COOKING_IMAGERY      }, -- Advanced
    ['Jacodaut'      ] = { 1, 10016, invaderXim.guild.COOKING,      invaderXim.skill.COOKING,      invaderXim.effect.COOKING_IMAGERY      }, -- Free
    ['Hakeem'        ] = { 2, 10017, invaderXim.guild.COOKING,      invaderXim.skill.COOKING,      invaderXim.effect.COOKING_IMAGERY      }, -- Free
    ['Kemha_Flasehp' ] = { 0,   642, invaderXim.guild.FISHING,      invaderXim.skill.FISHING,      invaderXim.effect.FISHING_IMAGERY      }, -- Dual
    ['Yudi_Yolhbi'   ] = { 0,   234, invaderXim.guild.WOODWORKING,  invaderXim.skill.WOODWORKING,  invaderXim.effect.WOODWORKING_IMAGERY  }, -- Dual
    ['Macici'        ] = { 0,   232, invaderXim.guild.SMITHING,     invaderXim.skill.SMITHING,     invaderXim.effect.SMITHING_IMAGERY     }, -- Dual
    ['Rajaaha'       ] = { 0,   230, invaderXim.guild.GOLDSMITHING, invaderXim.skill.GOLDSMITHING, invaderXim.effect.GOLDSMITHING_IMAGERY }, -- Dual
    ['Gidappa'       ] = { 0,   228, invaderXim.guild.CLOTHCRAFT,   invaderXim.skill.CLOTHCRAFT,   invaderXim.effect.CLOTHCRAFT_IMAGERY   }, -- Dual
    ['Zwaluh'        ] = { 0,   226, invaderXim.guild.LEATHERCRAFT, invaderXim.skill.LEATHERCRAFT, invaderXim.effect.LEATHERCRAFT_IMAGERY }, -- Dual
    ['Nudahaal'      ] = { 0,   224, invaderXim.guild.BONECRAFT,    invaderXim.skill.BONECRAFT,    invaderXim.effect.BONECRAFT_IMAGERY    }, -- Dual
    ['Sulbahn'       ] = { 0,   636, invaderXim.guild.ALCHEMY,      invaderXim.skill.ALCHEMY,      invaderXim.effect.ALCHEMY_IMAGERY      }, -- Advanced
    ['Hadayah'       ] = { 1,   638, invaderXim.guild.ALCHEMY,      invaderXim.skill.ALCHEMY,      invaderXim.effect.ALCHEMY_IMAGERY      }, -- Free
    ['Shahau'        ] = { 2,   640, invaderXim.guild.ALCHEMY,      invaderXim.skill.ALCHEMY,      invaderXim.effect.ALCHEMY_IMAGERY      }, -- Free
    ['Numaaf'        ] = { 0,   222, invaderXim.guild.COOKING,      invaderXim.skill.COOKING,      invaderXim.effect.COOKING_IMAGERY      }, -- Dual
}

-- Give proper free image support power and duration.
local function freeImageSupport(player, effectId)
    player:delStatusEffectsByFlag(invaderXim.effectFlag.SYNTH_SUPPORT, true)

    if effectId == invaderXim.effect.FISHING_IMAGERY then
        player:addStatusEffect(effectId, 1, 0, 3600)
    else
        player:addStatusEffect(effectId, 1, 0, 120)
    end
end

-- Give proper advanced image support power and duration.
local function advancedImageSupport(player, effectId)
    player:delStatusEffectsByFlag(invaderXim.effectFlag.SYNTH_SUPPORT, true)

    if effectId == invaderXim.effect.FISHING_IMAGERY then
        player:addStatusEffect(effectId, 2, 0, 7200)
    else
        player:addStatusEffect(effectId, 3, 0, 480)
    end
end

-----------------------------------
-- Old Image Support NPCs
-----------------------------------
invaderXim.crafting.oldImageSupportOnTrigger = function(player, npc)
    local npcName  = npc:getName()
    local skillId  = npcTable[npcName][4]
    local effectId = npcTable[npcName][5]

    -- Calculate parameters
    local eventId          = npcTable[npcName][2]
    local paramOne         = invaderXim.crafting.getCraftSkillCap(player, skillId) -- Param 1 (Skill cap OR Gil Cost)
    local skillLevel       = invaderXim.crafting.getRealSkill(player, skillId)     -- Param 2
    local messageParameter = npcTable[npcName][1]                          -- Param 3
    local guildsJoined     = player:getCharVar('Guild_Member')             -- Param 4
    local playerGil        = player:getGil()                               -- Param 5
    local imageDuration    = 0                                             -- Param 6

    -- Calculate gil cost if NPC gives advanced image support.
    if messageParameter == 0 then
        paramOne = (player:getSkillRank(skillId) + 1) * 30
    end

    -- Calculate effect Duration.
    if player:hasStatusEffect(effectId) then
        imageDuration = player:getStatusEffect(effectId):getDuration()
    end

    -- Event handles everything with correct params.
    player:startEvent(eventId, paramOne, skillLevel, messageParameter, guildsJoined, playerGil, imageDuration, 0, 0)
end

invaderXim.crafting.oldImageSupportOnEventFinish = function(player, csid, option, npc)
    local ID               = zones[player:getZoneID()]
    local npcName          = npc:getName()
    local messageParameter = npcTable[npcName][1]
    local eventId          = npcTable[npcName][2]
    local guildId          = npcTable[npcName][3]
    local skillId          = npcTable[npcName][4]
    local effectId         = npcTable[npcName][5]
    local gilCost          = 0
    local joinedGuildMask  = player:getCharVar('Guild_Member')

    -- Handle advance support.
    if messageParameter == 0 then
        -- Calculate Gil cost.
        gilCost = (player:getSkillRank(skillId) + 1) * 30

        -- Handle special initial messages.
        if
            guildId == invaderXim.guild.GOLDSMITHING and                          -- Goldsmithing guild.
            utils.mask.getBit(joinedGuildMask, invaderXim.guild.GOLDSMITHING) and -- Has joined goldsnmithing guild.
            not utils.mask.getBit(joinedGuildMask, 24)                    -- Has not spoken to npc after joining guild.
        then
            player:incrementCharVar('Guild_Member', bit.lshift(1, 24))
        elseif
            guildId == invaderXim.guild.ALCHEMY and                          -- Alchemy guild.
            utils.mask.getBit(joinedGuildMask, invaderXim.guild.ALCHEMY) and -- Has joined alchemy guild.
            not utils.mask.getBit(joinedGuildMask, 25)               -- Has not spoken to npc after joining guild.
        then
            player:incrementCharVar('Guild_Member', bit.lshift(1, 25))
        end
    end

    -- Give status effect if aplicable.
    if csid == eventId and option == 1 and player:getGil() >= gilCost then
        player:messageSpecial(ID.text.IMAGE_SUPPORT, 0, guildId, messageParameter)

        if gilCost > 0 then
            player:delGil(gilCost)
            advancedImageSupport(player, effectId)
        else
            freeImageSupport(player, effectId)
        end
    end
end

-----------------------------------
-- Aht Uhrgan Image Support NPCs
-----------------------------------
invaderXim.crafting.ahtUhrganImageSupportOnTrade = function(player, npc, trade)
    local ID       = zones[player:getZoneID()]
    local npcName  = npc:getName()
    local eventId  = npcTable[npcName][2] + 1 -- Trade event Id = Trigger event Id + 1
    local guildId  = npcTable[npcName][3]
    local effectId = npcTable[npcName][5]

    if invaderXim.crafting.hasJoinedGuild(player, guildId) then
        if
            trade:hasItemQty(invaderXim.item.IMPERIAL_BRONZE_PIECE, 1) and
            trade:getItemCount() == 1
        then
            if not player:hasStatusEffect(effectId) then
                player:tradeComplete()
                player:startEvent(eventId, 71, 0, 0, 0, 0, 0, guildId, invaderXim.item.IMPERIAL_BRONZE_PIECE)
            else
                npc:showText(npc, ID.text.IMAGE_SUPPORT_ACTIVE)
            end
        end
    end
end

invaderXim.crafting.ahtUhrganImageSupportOnTrigger = function(player, npc)
    local npcName  = npc:getName()
    local skillId  = npcTable[npcName][4]
    local effectId = npcTable[npcName][5]

    -- Calculate parameters
    local eventId          = npcTable[npcName][2]
    local dialogueOptions  = 8
    local skillLevel       = 0
    local messageParameter = npcTable[npcName][1]
    local guildsJoined     = player:getCharVar('Guild_Member')
    local imageDuration    = 0
    local guildId          = npcTable[npcName][3]

    -- Calculate dialogue options.
    if messageParameter > 0 then
        dialogueOptions = 4
    end

    -- Calculate skill level
    if invaderXim.crafting.hasJoinedGuild(player, guildId) then
        skillLevel = invaderXim.crafting.getRealSkill(player, skillId)
    end

    -- Calculate image support duration.
    if player:hasStatusEffect(effectId) then
        imageDuration = player:getStatusEffect(effectId):getDuration()
    end

    -- Event handles everything with correct params.
    player:startEvent(eventId, dialogueOptions, skillLevel, messageParameter, guildsJoined, 0, imageDuration, guildId, invaderXim.item.IMPERIAL_BRONZE_PIECE)
end

invaderXim.crafting.ahtUhrganImageSupportOnEventFinish = function(player, csid, option, npc)
    local ID       = zones[player:getZoneID()]
    local npcName  = npc:getName()
    local eventId  = npcTable[npcName][2]
    local guildId  = npcTable[npcName][3]
    local effectId = npcTable[npcName][5]

    -- Regular Image support.
    if csid == eventId and option == 1 then
        freeImageSupport(player, effectId)
        player:messageSpecial(ID.text.IMAGE_SUPPORT, 0, guildId, 0)

    -- Advanced Image Support
    elseif csid == eventId + 1 then
        advancedImageSupport(player, effectId)
        player:messageSpecial(ID.text.IMAGE_SUPPORT, 0, guildId, 1)
    end
end
