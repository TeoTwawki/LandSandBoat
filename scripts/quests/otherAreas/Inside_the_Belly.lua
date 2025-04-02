-----------------------------------
-- Inside the Belly
-----------------------------------
-- Log ID: 4, Quest ID: 26
-- !addquest 4 26
-- Zaldon  : !pos -11.810 -7.287 -6.742 248
-----------------------------------

local quest = Quest:new(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.INSIDE_THE_BELLY)

quest.reward = {}

-- data from http://wiki.ffxiclopedia.org/wiki/Inside_the_Belly
local fishRewards =
{
    [invaderXim.item.GRIMMONITE] = -- Grimmonite
    {
        gil = 350,
        items =
        {
            { chance = 5, itemId = invaderXim.item.GOLD_RING }, -- guessing 5%. Wiki unknown
            { chance = 5, itemId = invaderXim.item.MYTHRIL_RING }, -- guessing 5%. Wiki unknown
            { chance = 5, itemId = invaderXim.item.SILVER_RING }, -- guessing 5%. Wiki unknown
        }
    },

    [invaderXim.item.RYUGU_TITAN] =
    {
        gil = 800,
        items =
        {
            { chance = 1.3, itemId = invaderXim.item.MERCURIAL_SWORD },
        }
    },

    [invaderXim.item.GIANT_DONKO] =
    {
        gil = 96,
        items =
        {
            { chance = 4.7, itemId = invaderXim.item.BROKEN_HALCYON_FISHING_ROD },
        }
    },

    [invaderXim.item.JUNGLE_CATFISH] =
    {
        gil = 300,
        items =
        {
            { chance = 3, itemId = invaderXim.item.BROKEN_HUME_FISHING_ROD },
        }
    },

    [invaderXim.item.GIANT_CHIRAI] =
    {
        gil = 550,
        items =
        {
            { chance = 1.2, itemId = invaderXim.item.SPOOL_OF_TWINTHREAD },
        }
    },

    [invaderXim.item.CAVE_CHERAX] =
    {
        gil = 800,
        items =
        {
            { chance = 26.2, itemId = invaderXim.item.DWARF_PUGIL },
        }
    },

    [invaderXim.item.ARMORED_PISCES] =
    {
        gil = 475,
        items =
        {
            { chance = 0.4, itemId = invaderXim.item.STOLID_BREASTPLATE },
        }
    },

    [invaderXim.item.TRICORN] =
    {
        gil = 810,
        items =
        {
            { chance = 4, itemId = invaderXim.item.CHUNK_OF_DARKSTEEL_ORE }, -- guessing 4%. Wiki unknown
        }
    },

    [invaderXim.item.ZAFMLUG_BASS] =
    {
        gil = 15,
        items =
        {
            { chance = 1.4, itemId = invaderXim.item.BLUE_ROCK },
        }
    },

    [invaderXim.item.MONKE_ONKE] =
    {
        gil = 150,
        items =
        {
            { chance = 10, itemId = invaderXim.item.PINCH_OF_POISON_DUST, min = 1, max = 6 }, -- guessing 10%. Wiki unknown
        }
    },

    [invaderXim.item.DARK_BASS] =
    {
        gil = 10,
        items =
        {
            { chance = 4.6, itemId = invaderXim.item.GREEN_ROCK },
        }
    },

    [invaderXim.item.SILVER_SHARK] =
    {
        gil = 250,
        title = invaderXim.title.ACE_ANGLER,
        items =
        {
            { chance = 1.4, itemId = invaderXim.item.TRIDENT },
        }
    },

    [invaderXim.item.EMPEROR_FISH] =
    {
        gil = 300,
        items =
        {
            { chance = 1, itemId = invaderXim.item.CUIR_HIGHBOOTS }, -- guessing 1%. Wiki says 0%
        }
    },

    [invaderXim.item.TAKITARO] =
    {
        gil = 350,
        items =
        {
            { chance = 2.4, itemId = invaderXim.item.PHILOSOPHERS_STONE },
        }
    },

    [invaderXim.item.BLADEFISH] =
    {
        gil = 200,
        items =
        {
            { chance = 11.7, itemId = invaderXim.item.ROBBER_RIG },
        }
    },

    [invaderXim.item.GIGANT_SQUID] =
    {
        gil = 300,
        items =
        {
            { chance = 2.5, itemId = invaderXim.item.FLAME_SHIELD }, -- guessing 2.5%. Wiki unknown
        }
    },

    [invaderXim.item.SEA_ZOMBIE] =
    {
        gil = 350,
        items =
        {
            { chance = 26.1, itemId = invaderXim.item.DRILL_CALAMARY },
        }
    },

    [invaderXim.item.TITANICTUS] =
    {
        gil = 350,
        title = invaderXim.title.LU_SHANG_LIKE_FISHER_KING,
        items =
        {
            { chance = 1.3, itemId = invaderXim.item.ANCIENT_SWORD },
            { chance =   5, itemId = invaderXim.item.SEASHELL }, -- guessing 5%. Wiki unknown
        }
    },

    [invaderXim.item.GAVIAL_FISH] =
    {
        gil = 250,
        items =
        {
            { chance = 4.9, itemId = invaderXim.item.DRONE_EARRING },
        }
    },

    [invaderXim.item.THREE_EYED_FISH] =
    {
        gil = 250,
        items =
        {
            { chance = 10, itemId = invaderXim.item.PINCH_OF_PARALYSIS_DUST, min = 1, max = 10 }, -- guessing 10%. Wiki unknown
        }
    },

    [invaderXim.item.BHEFHEL_MARLIN] =
    {
        gil = 150,
        items =
        {
            { chance = 14.3, itemId = invaderXim.item.BRIGANDS_CHART },
            { chance =  4.4, itemId = invaderXim.item.PIRATES_CHART },
        }
    },

    [invaderXim.item.GUGRU_TUNA] =
    {
        gil = 50,
        items =
        {
            { chance = 2.5, itemId = invaderXim.item.TINY_TATHLUM },
        }
    },

    [invaderXim.item.OGRE_EEL] =
    {
        gil = 16,
        title = invaderXim.title.CORDON_BLEU_FISHER,
        items =
        {
            { chance = 2.5, itemId = invaderXim.item.TURQUOISE_RING },
        }
    },

    [invaderXim.item.TITANIC_SAWFISH] =
    {
        gil = 810,
        items =
        {
            { chance = 0.7, itemId = invaderXim.item.AIZENKUNITOSHI },
        }
    },

    [invaderXim.item.GUGRUSAURUS] =
    {
        gil = 880,
        items =
        {
            { chance = 0.4, itemId = invaderXim.item.SABER_SHOOT },
        }
    },

    [invaderXim.item.LIK] =
    {
        gil = 880,
        items =
        {
            { chance = 0.5, itemId = invaderXim.item.SPOOL_OF_OPAL_SILK },
        }
    },

    [invaderXim.item.PTERYGOTUS] =
    {
        gil = 390,
        items =
        {
            { chance = 6.7, itemId = invaderXim.item.LAPIS_LAZULI },
        }
    },

    [invaderXim.item.MOLA_MOLA] =
    {
        gil = 487,
        items =
        {
            { chance = 1.8, itemId = invaderXim.item.MERCURIAL_SPEAR },
        }
    },

    [invaderXim.item.RHINOCHIMERA] =
    {
        gil = 300,
        items =
        {
            { chance = 3.2, itemId = invaderXim.item.SOLON_TORQUE },
        }
    },

    [invaderXim.item.ISTAVRIT] =
    {
        gil = 50,
        items =
        {
            { chance = 10, itemId = invaderXim.item.PINCH_OF_VENOM_DUST, min = 1, max = 6 }, -- guessing 10%. Wiki unknown
        }
    },

    [invaderXim.item.TURNABALIGI] =
    {
        gil = 340,
        items =
        {
            { chance =   1, itemId = invaderXim.item.CHUNK_OF_DARK_ORE },
            { chance = 1.4, itemId = invaderXim.item.CHUNK_OF_ICE_ORE },
            { chance = 1.4, itemId = invaderXim.item.CHUNK_OF_WATER_ORE },
        }
    },

    [invaderXim.item.KALKANBALIGI] =
    {
        gil = 390,
        items =
        {
            { chance = 3.3, itemId = invaderXim.item.FLAT_SHIELD },
        }
    },

    [invaderXim.item.VEYDAL_WRASSE] =
    {
        gil = 225,
        items =
        {
            { chance = 5, itemId = invaderXim.item.NEBIMONITE }, -- guessing 5%. Wiki unknown
            { chance = 5, itemId = invaderXim.item.SEASHELL }, -- guessing 5%. Wiki unknown
        }
    },

    [invaderXim.item.LAKERDA] =
    {
        gil = 51,
        items =
        {
            { chance =   6, itemId = invaderXim.item.PEARL },
            { chance = 1.9, itemId = invaderXim.item.BLACK_PEARL },
        }
    },

    [invaderXim.item.KILICBALIGI] =
    {
        gil = 150,
        items =
        {
            { chance = 2.5, itemId = invaderXim.item.RUSTY_GREATSWORD }, -- guessing 2.5%. Wiki unknown
        }
    },

    [invaderXim.item.AHTAPOT] =
    {
        gil = 350,
        items =
        {
            { chance = 18.5, itemId = invaderXim.item.MILDEWY_INGOT },
            { chance = 10.2, itemId = invaderXim.item.DECAYED_INGOT },
        }
    },

    [invaderXim.item.MORINABALIGI] =
    {
        gil = 300,
        items =
        {
            { chance = 5, itemId = invaderXim.item.CUIR_GLOVES }, -- guessing 5%. Wiki unknown
        }
    },

    [invaderXim.item.YAYINBALIGI] =
    {
        gil = 50,
        items =
        {
            { chance = 5, itemId = invaderXim.item.TELLURIC_RING }, -- guessing 5%. Wiki unknown
        }
    },

    [invaderXim.item.MEGALODON] =
    {
        gil = 532,
        items =
        {
            { chance = 3, itemId = invaderXim.item.BROKEN_MITHRAN_FISHING_ROD }, -- guessing 3%. Wiki unknown
            { chance = 3, itemId = invaderXim.item.MITHRAN_FISHING_ROD }, -- guessing 3%. Wiki unknown
        }
    },

    [invaderXim.item.MATSYA] =
    {
        gil = 12592,
        items =
        {
            { chance = 1.2, itemId = invaderXim.item.SHAPERS_SHAWL },
        }
    },

    [invaderXim.item.PIRARUCU] =
    {
        gil = 516,
        items =
        {
            { chance =   5, itemId = invaderXim.item.WYVERN_SKIN }, -- guessing 5%. Wiki unknown
            { chance = 2.5, itemId = invaderXim.item.PEISTE_SKIN }, -- guessing 2.5%. Wiki unknown
        }
    },

    [invaderXim.item.GERROTHORAX] =
    {
        gil = 423,
        items =
        {
            { chance = 1.2, itemId = invaderXim.item.RISKY_PATCH },
        }
    },

    [invaderXim.item.GIGANT_OCTOPUS] =
    {
        gil = 119,
        items =
        {
            { chance = 10, itemId = invaderXim.item.JAR_OF_BLACK_INK, min = 1, max = 6 }, --guessing 10%. Wiki unknown
        }
    },

    [invaderXim.item.ABAIA] = -- Abaia
    {
        gil = 690,
        items =
        {
            { chance =  1.5, itemId = invaderXim.item.AURORA_BASS, min = 1, max = 1 }, -- Aurora Bass x3
            { chance =  7.8, itemId = invaderXim.item.AURORA_BASS, min = 2, max = 2 }, -- Aurora Bass x2
            { chance = 12.5, itemId = invaderXim.item.AURORA_BASS, min = 3, max = 3 }, -- Aurora Bass x1
            { chance =  0.7, itemId = invaderXim.item.PLUMB_BOOTS },
        }
    },

    [invaderXim.item.SORYU] =
    {
        gil = 1512,
        items =
        {
            { chance = 46.8, itemId = invaderXim.item.SORYUS_LIVER },
        }
    },

    [invaderXim.item.SEKIRYU] =
    {
        gil = 1512,
        items =
        {
            { chance = 48.1, itemId = invaderXim.item.SEKIRYUS_LIVER }, -- guessing 48.1%. Wiki unknown
        }
    },

    [invaderXim.item.HAKURYU] =
    {
        gil = 1512,
        items =
        {
            { chance = 48.1, itemId = invaderXim.item.HAKURYUS_LIVER },
        }
    },

    [invaderXim.item.GIANT_CATFISH] =
    {
        gil = 50,
        title = invaderXim.title.CORDON_BLEU_FISHER,
        items =
        {
            { chance = 6.2, itemId = invaderXim.item.EARTH_WAND },
        }
    },

    [invaderXim.item.DORADO_GAR] =
    {
        gil = 568,
        items =
        {
            { chance = 5, itemId = invaderXim.item.GOLD_INGOT, min = 1, max = 4 }, -- guessing 5%. Wiki unknown
        }
    },

    [invaderXim.item.CROCODILOS] =
    {
        gil = 1763,
        items =
        {
            { chance = 2.3, itemId = invaderXim.item.PUFFIN_RING },
        }
    },

    [invaderXim.item.PELAZOEA] =
    {
        gil = 360,
        items =
        {
            { chance = 1.8, itemId = invaderXim.item.NODDY_RING },
        }
    },

    [invaderXim.item.FAR_EAST_PUFFER] =
    {
        gil = 735,
        items =
        {
            { chance = 5, itemId = invaderXim.item.STINKY_SUBLIGAR }, -- guessing 5%. Wiki unknown
        }
    },
}

local function tradeFish(player, fishId)
    quest:setLocalVar(player, 'fishId', fishId)
    quest:setLocalVar(player, 'itemIdx', 0)

    local rewards = fishRewards[fishId].items
    local roll    = math.random(1, 1000)
    local sum     = 0

    -- NOTE: We confirm the trade now, and not at the end of the cutscene as normal
    --     : because the cutscene gives away whether or not the trade was successful
    --     : or not, and it's possible for players to cheese this trade by force-dc-ing.
    player:confirmTrade()

    for idx = 1, #rewards do
        sum = sum + (rewards[idx].chance * 10)

        if roll <= sum then
            quest:setLocalVar(player, 'itemIdx', idx)

            return quest:event(166, 0, rewards[idx].itemId)
        end
    end

    return quest:event(167)
end

local function giveReward(player)
    local fishId  = quest:getLocalVar(player, 'fishId')
    local itemIdx = quest:getLocalVar(player, 'itemIdx')
    local reward  = fishRewards[fishId]

    if itemIdx > 0 then
        local rewardItem = reward.items[itemIdx]
        local itemId = rewardItem.itemId
        local itemQt = 1

        if rewardItem.min ~= nil and rewardItem.max ~= nil then
            itemQt = math.random(rewardItem.min, rewardItem.max)
        end

        npcUtil.giveItem(player, { { itemId, itemQt } })
    end

    npcUtil.giveCurrency(player, 'gil', reward.gil)
    quest:setLocalVar(player, 'fishId', 0)
    quest:setLocalVar(player, 'itemIdx', 0)

    if reward.title ~= nil then
        player:addTitle(reward.title)
    end
end

local function zaldonOnTrade(player, npc, trade)
    for itemSlot = 0, trade:getSlotCount() - 1 do
        local itemId = trade:getItemId(itemSlot)

        if
            fishRewards[itemId] ~= nil and
            npcUtil.tradeHasExactly(trade, itemId)
        then
            return tradeFish(player, itemId)
        end
    end
end

local function zaldonOnTrigger(player, npc)
    local fishingSkill = invaderXim.crafting.getTotalSkill(player, invaderXim.skill.FISHING)

    local tier = 4

    if fishingSkill < 40 then
        tier = 1
    elseif fishingSkill < 50 then
        tier = 2
    elseif fishingSkill < 75 then
        tier = 3
    end

    local csTier =
    {
        {
            162,
            invaderXim.item.GIANT_CATFISH,
            invaderXim.item.DARK_BASS,
            invaderXim.item.OGRE_EEL,
            invaderXim.item.ZAFMLUG_BASS,
        },

        {
            163,
            invaderXim.item.ZAFMLUG_BASS,
            invaderXim.item.GIANT_DONKO,
            invaderXim.item.BHEFHEL_MARLIN,
            invaderXim.item.BLADEFISH,
            invaderXim.item.SILVER_SHARK,
        },

        {
            164,
            invaderXim.item.JUNGLE_CATFISH,
            invaderXim.item.GAVIAL_FISH,
            invaderXim.item.PIRARUCU,
            invaderXim.item.EMPEROR_FISH,
            invaderXim.item.MEGALODON,
            invaderXim.item.MORINABALIGI,
        },

        {
            165,
            invaderXim.item.PTERYGOTUS,
            invaderXim.item.KALKANBALIGI,
            invaderXim.item.TAKITARO,
            invaderXim.item.SEA_ZOMBIE,
            invaderXim.item.TITANICTUS,
            invaderXim.item.TURNABALIGI,
            invaderXim.item.CAVE_CHERAX,
            invaderXim.item.TRICORN,
        },
    }

    return quest:event(unpack(csTier[tier]))
end

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_AVAILABLE and
                player:getQuestStatus(invaderXim.questLog.OTHER_AREAS, invaderXim.quest.id.otherAreas.THE_REAL_GIFT) == invaderXim.questStatus.QUEST_COMPLETED and
                invaderXim.crafting.getTotalSkill(player, invaderXim.skill.FISHING) >= 30 and
                invaderXim.settings.map.FISHING_ENABLE == true
        end,

        [invaderXim.zone.SELBINA] =
        {
            ['Zaldon'] = quest:progressEvent(161),

            onEventFinish =
            {
                [161] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_ACCEPTED and
                invaderXim.crafting.getTotalSkill(player, invaderXim.skill.FISHING) >= 30 and
                invaderXim.settings.map.FISHING_ENABLE == true
        end,

        [invaderXim.zone.SELBINA] =
        {
            ['Zaldon'] =
            {
                onTrade = function(player, npc, trade)
                    return zaldonOnTrade(player, npc, trade)
                end,

                onTrigger = function(player, npc)
                    return zaldonOnTrigger(player, npc)
                end,
            },

            onEventFinish =
            {
                [166] = function(player, csid, option, npc)
                    giveReward(player)

                    quest:complete(player)
                end,

                [167] = function(player, csid, option, npc)
                    giveReward(player)

                    quest:complete(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == invaderXim.questStatus.QUEST_COMPLETED and
                invaderXim.settings.map.FISHING_ENABLE == true
        end,

        [invaderXim.zone.SELBINA] =
        {
            ['Zaldon'] =
            {
                onTrade = function(player, npc, trade)
                    return zaldonOnTrade(player, npc, trade)
                end,

                onTrigger = function(player, npc)
                    return zaldonOnTrigger(player, npc)
                end,
            },

            onEventFinish =
            {
                [166] = function(player, csid, option, npc)
                    giveReward(player)
                end,

                [167] = function(player, csid, option, npc)
                    giveReward(player)
                end,
            },
        },
    },
}

return quest
