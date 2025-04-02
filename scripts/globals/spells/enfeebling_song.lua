-----------------------------------
-- Enfeebling Song Utilities
-- Used for songs that deal negative status effects upon targets.
-----------------------------------
require('scripts/globals/combat/element_tables')
require('scripts/globals/combat/magic_hit_rate')
require('scripts/globals/combat/status_effect_tables')
require('scripts/globals/jobpoints')
require('scripts/globals/magicburst')
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
invaderXim.spells = invaderXim.spells or {}
invaderXim.spells.enfeebling = invaderXim.spells.enfeebling or {}
-----------------------------------
local column =
{
    SONG_EFFECT     = 1,
    SONG_POWER_BASE = 2,
    SONG_POWER_CAP  = 3,
    SONG_DURATION   = 4,
    SONG_MODIFIER   = 5,
}

local pTable =
{
    -- [Spell ID                         ] = { Effect,             Base,  Cap, Dur, Modifier               },
    -- Requiem: https://www.bg-wiki.com/ffxi/Category:Requiem
    [invaderXim.magic.spell.FOE_REQUIEM          ] = { invaderXim.effect.REQUIEM,     1,  300,  64, invaderXim.mod.REQUIEM_EFFECT  },
    [invaderXim.magic.spell.FOE_REQUIEM_II       ] = { invaderXim.effect.REQUIEM,     2,  300,  80, invaderXim.mod.REQUIEM_EFFECT  },
    [invaderXim.magic.spell.FOE_REQUIEM_III      ] = { invaderXim.effect.REQUIEM,     3,  300,  96, invaderXim.mod.REQUIEM_EFFECT  },
    [invaderXim.magic.spell.FOE_REQUIEM_IV       ] = { invaderXim.effect.REQUIEM,     4,  300, 112, invaderXim.mod.REQUIEM_EFFECT  },
    [invaderXim.magic.spell.FOE_REQUIEM_V        ] = { invaderXim.effect.REQUIEM,     5,  300, 128, invaderXim.mod.REQUIEM_EFFECT  },
    [invaderXim.magic.spell.FOE_REQUIEM_VI       ] = { invaderXim.effect.REQUIEM,     6,  300, 144, invaderXim.mod.REQUIEM_EFFECT  },
    [invaderXim.magic.spell.FOE_REQUIEM_VII      ] = { invaderXim.effect.REQUIEM,     8,  300, 160, invaderXim.mod.REQUIEM_EFFECT  },
    -- Lullaby: https://www.bg-wiki.com/ffxi/Category:Lullaby
    [invaderXim.magic.spell.FOE_LULLABY          ] = { invaderXim.effect.SLEEP_I,     1,    1,  30, invaderXim.mod.LULLABY_EFFECT  },
    [invaderXim.magic.spell.FOE_LULLABY_II       ] = { invaderXim.effect.SLEEP_I,     1,    1,  60, invaderXim.mod.LULLABY_EFFECT  },
    [invaderXim.magic.spell.HORDE_LULLABY        ] = { invaderXim.effect.SLEEP_I,     1,    1,  30, invaderXim.mod.LULLABY_EFFECT  },
    [invaderXim.magic.spell.HORDE_LULLABY_II     ] = { invaderXim.effect.SLEEP_I,     1,    1,  60, invaderXim.mod.LULLABY_EFFECT  },
    -- Finale: https://www.bg-wiki.com/ffxi/Category:Finale
    [invaderXim.magic.spell.MAGIC_FINALE         ] = { invaderXim.effect.NONE,        1,    1,   0, invaderXim.mod.FINALE_EFFECT   },
    -- Elegy: https://www.bg-wiki.com/ffxi/Category:Elegy
    [invaderXim.magic.spell.BATTLEFIELD_ELEGY    ] = { invaderXim.effect.ELEGY,    2500, 5000, 120, invaderXim.mod.ELEGY_EFFECT    },
    [invaderXim.magic.spell.CARNAGE_ELEGY        ] = { invaderXim.effect.ELEGY,    5000, 5000, 180, invaderXim.mod.ELEGY_EFFECT    },
    -- Threnody: https://www.bg-wiki.com/ffxi/Category:Threnody
    [invaderXim.magic.spell.FIRE_THRENODY        ] = { invaderXim.effect.THRENODY,   50,   95,  60, invaderXim.mod.THRENODY_EFFECT },
    [invaderXim.magic.spell.ICE_THRENODY         ] = { invaderXim.effect.THRENODY,   50,   95,  60, invaderXim.mod.THRENODY_EFFECT },
    [invaderXim.magic.spell.WIND_THRENODY        ] = { invaderXim.effect.THRENODY,   50,   95,  60, invaderXim.mod.THRENODY_EFFECT },
    [invaderXim.magic.spell.EARTH_THRENODY       ] = { invaderXim.effect.THRENODY,   50,   95,  60, invaderXim.mod.THRENODY_EFFECT },
    [invaderXim.magic.spell.LIGHTNING_THRENODY   ] = { invaderXim.effect.THRENODY,   50,   95,  60, invaderXim.mod.THRENODY_EFFECT },
    [invaderXim.magic.spell.WATER_THRENODY       ] = { invaderXim.effect.THRENODY,   50,   95,  60, invaderXim.mod.THRENODY_EFFECT },
    [invaderXim.magic.spell.LIGHT_THRENODY       ] = { invaderXim.effect.THRENODY,   50,   95,  60, invaderXim.mod.THRENODY_EFFECT },
    [invaderXim.magic.spell.DARK_THRENODY        ] = { invaderXim.effect.THRENODY,   50,   95,  60, invaderXim.mod.THRENODY_EFFECT },
    [invaderXim.magic.spell.FIRE_THRENODY_II     ] = { invaderXim.effect.THRENODY,  160,  205,  90, invaderXim.mod.THRENODY_EFFECT },
    [invaderXim.magic.spell.ICE_THRENODY_II      ] = { invaderXim.effect.THRENODY,  160,  205,  90, invaderXim.mod.THRENODY_EFFECT },
    [invaderXim.magic.spell.WIND_THRENODY_II     ] = { invaderXim.effect.THRENODY,  160,  205,  90, invaderXim.mod.THRENODY_EFFECT },
    [invaderXim.magic.spell.EARTH_THRENODY_II    ] = { invaderXim.effect.THRENODY,  160,  205,  90, invaderXim.mod.THRENODY_EFFECT },
    [invaderXim.magic.spell.LIGHTNING_THRENODY_II] = { invaderXim.effect.THRENODY,  160,  205,  90, invaderXim.mod.THRENODY_EFFECT },
    [invaderXim.magic.spell.WATER_THRENODY_II    ] = { invaderXim.effect.THRENODY,  160,  205,  90, invaderXim.mod.THRENODY_EFFECT },
    [invaderXim.magic.spell.LIGHT_THRENODY_II    ] = { invaderXim.effect.THRENODY,  160,  205,  90, invaderXim.mod.THRENODY_EFFECT },
    [invaderXim.magic.spell.DARK_THRENODY_II     ] = { invaderXim.effect.THRENODY,  160,  205,  90, invaderXim.mod.THRENODY_EFFECT },
    -- Virelai: https://www.bg-wiki.com/ffxi/Category:Virelai
    [invaderXim.magic.spell.MAIDENS_VIRELAI      ] = { invaderXim.effect.CHARM_I,     0,    0,  30, invaderXim.mod.VIRELAI_EFFECT  },
    -- Nocturne: https://www.bg-wiki.com/ffxi/Category:Nocturne
    [invaderXim.magic.spell.PINING_NOCTURNE      ] = { invaderXim.effect.NOCTURNE,   15,   25, 120, 0                      },
}

-----------------------------------
-- Calculates song power.
-----------------------------------
invaderXim.spells.enfeebling.calculateSongPower = function(caster, spellEffect, basePower, gearBoost)
    local power = basePower

    if spellEffect == invaderXim.effect.REQUIEM then
        power = power + utils.clamp(gearBoost - 1, 0, 20) + caster:getJobPointLevel(invaderXim.jp.REQUIEM_EFFECT) * 3
    elseif spellEffect == invaderXim.effect.ELEGY then
        power = power + gearBoost * 6375 / 256 -- Simplified numbers of: 25.5 * 10000/1024
    elseif spellEffect == invaderXim.effect.THRENODY then
        power = power + gearBoost * 5
    elseif spellEffect == invaderXim.effect.NOCTURNE then
        power = power + gearBoost * 1.5
    end

    -- Apply Soul Voice or Marcato if appropriate.
    local effectTable =
    set{
        invaderXim.effect.ELEGY,
        invaderXim.effect.NOCTURNE,
        invaderXim.effect.REQUIEM,
        invaderXim.effect.THRENODY
    }

    if effectTable[spellEffect] then
        if caster:hasStatusEffect(invaderXim.effect.SOUL_VOICE) then
            power = power * 2
        elseif caster:hasStatusEffect(invaderXim.effect.MARCATO) then
            power = power * 1.5
        end
    end

    return power
end

-----------------------------------
-- Calculates song duration.
-----------------------------------
invaderXim.spells.enfeebling.calculateSongDuration = function(caster, spellEffect, baseDuration, gearBoost)
    -- Duration boost of 10% per level of Song+ and All_Song+ gear plus song duration gear.
    local duration = baseDuration

    -- Virelai is not affected by song duration bonuses other than skill, BRD gifts or Troubadour
    -- https://www.bg-wiki.com/ffxi/Category:Virelai
    if spellEffect ~= invaderXim.effect.CHARM_I then
        duration = math.floor(duration * (1 + gearBoost / 10 + caster:getMod(invaderXim.mod.SONG_DURATION_BONUS) / 100))
    else
        duration = math.floor(duration * (1 + gearBoost / 10))

        return duration
    end

    -- Lullaby gets a duration boost from job points of 1 second per level.
    -- This is applied after skill+ duration bonuses
    -- https://www.bg-wiki.com/ffxi/Category:Lullaby
    if spellEffect == invaderXim.effect.SLEEP_I then
        duration = duration + caster:getJobPointLevel(invaderXim.jp.LULLABY_DURATION)
    end

    -- Duration from status effects.
    if caster:hasStatusEffect(invaderXim.effect.CLARION_CALL) then
        duration = duration + caster:getJobPointLevel(invaderXim.jp.CLARION_CALL_EFFECT) * 2
    end

    if caster:hasStatusEffect(invaderXim.effect.TENUTO) then
        duration = duration + caster:getJobPointLevel(invaderXim.jp.TENUTO_EFFECT) * 2
    end

    -- Unclear if Troubadour effects lullaby before or after JP
    if caster:hasStatusEffect(invaderXim.effect.TROUBADOUR) then
        duration = math.floor(duration * 2)
    end

    return duration
end

-----------------------------------
-- Casts an enfeebling song.
-----------------------------------
invaderXim.spells.enfeebling.useEnfeeblingSong = function(caster, target, spell)
    local spellId      = spell:getID()
    local spellElement = spell:getElement()
    local spellEffect  = pTable[spellId][column.SONG_EFFECT]

    ------------------------------
    -- STEP 1: Check spell nullification.
    ------------------------------
    if invaderXim.combat.statusEffect.isTargetImmune(target, spellEffect, spellElement) then
        spell:setMsg(invaderXim.msg.basic.MAGIC_COMPLETE_RESIST)
        return spellEffect
    end

    -- Check trait nullification trigger.
    if invaderXim.combat.statusEffect.isTargetResistant(caster, target, spellEffect) then
        spell:setModifier(invaderXim.msg.actionModifier.RESIST)
        spell:setMsg(invaderXim.msg.basic.MAGIC_RESIST)
        return spellEffect
    end

    -- Target already has an status effect that nullifies current.
    if invaderXim.combat.statusEffect.isEffectNullified(target, spellEffect) then
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
        return spellEffect
    end

    ------------------------------
    -- STEP 2: Check if spell resists.
    ------------------------------
    -- Check the amount of Song+ and All_Song+ gear.
    local gearBoost = caster:getMod(pTable[spellId][column.SONG_MODIFIER]) + caster:getMod(invaderXim.mod.ALL_SONGS_EFFECT)

    -- Finale has innate +175 to magic accuracy.
    local bonusMagicAcc = 0
    if spellEffect == invaderXim.effect.NONE then
        bonusMagicAcc = 175 + gearBoost * 5
    end

    local resistRate = invaderXim.combat.magicHitRate.calculateResistRate(caster, target, invaderXim.magic.spellGroup.SONG, invaderXim.skill.SINGING, 0, spellElement, invaderXim.mod.CHR, spellEffect, bonusMagicAcc)
    if
        resistRate <= 0.25 or
        (spellEffect == invaderXim.effect.CHARM_I and
        target:isMob() and
        target:getMobMod(invaderXim.mobMod.CHARMABLE) <= 0)
    then
        spell:setMsg(invaderXim.msg.basic.MAGIC_RESIST)
        return spellEffect
    end

    ------------------------------
    -- STEP 3: Calculate power, tick, duration and subEffect.
    ------------------------------
    local power     = invaderXim.spells.enfeebling.calculateSongPower(caster, spellEffect, pTable[spellId][column.SONG_POWER_BASE], gearBoost) or 0
    local tick      = spellEffect == invaderXim.effect.REQUIEM and 3 or 0
    local duration  = invaderXim.spells.enfeebling.calculateSongDuration(caster, spellEffect, pTable[spellId][column.SONG_DURATION], gearBoost) or 0
    local subEffect = spellEffect == invaderXim.effect.THRENODY and invaderXim.combat.element.getElementalMEVAModifier(spellElement) or 0

    -- FClamp and floor.
    power    = math.floor(utils.clamp(power, 0, pTable[spellId][column.SONG_POWER_CAP]))
    duration = math.floor(duration * resistRate)

    ------------------------------
    -- STEP 4: Special cases.
    ------------------------------
    -- Finale doesn't apply a debuff. Quit early.
    if spellEffect == invaderXim.effect.NONE then
        -- TODO: This is actually message 342 which doesn't exist currently. The wording is identical.
        spell:setMsg(invaderXim.msg.basic.MAGIC_ERASE)
        local dispelledEffect = target:dispelStatusEffect()
        if dispelledEffect == invaderXim.effect.NONE then
            spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
        end

        return dispelledEffect

    -- Virelai applies a charm. Quit early.
    elseif spellEffect == invaderXim.effect.CHARM_I then
        target:addStatusEffect(invaderXim.effect.CHARM_I, 0, 0, duration)
        caster:charm(target)
        if caster:isPC() then
            spell:setMsg(invaderXim.msg.basic.MAGIC_ENFEEB)
        else
            spell:setMsg(invaderXim.msg.basic.MAGIC_ENFEEB_IS)
        end

        return spellEffect
    end

    ------------------------------
    -- STEP 5: Attempt to apply the status effect. Check for magic burst.
    ------------------------------
    if target:addStatusEffect(spellEffect, power, tick, duration, 0, subEffect) then
        local _, skillchainCount = invaderXim.magicburst.formMagicBurst(spellElement, target)
        if skillchainCount > 0 then
            spell:setMsg(invaderXim.msg.basic.MAGIC_BURST_ENFEEB)
            caster:triggerRoeEvent(invaderXim.roeTrigger.MAGIC_BURST)
        else
            -- Lullaby has a different application message than the rest of the song debuffs.
            if spellEffect == invaderXim.effect.SLEEP_I then
                spell:setMsg(invaderXim.msg.basic.MAGIC_ENFEEB_IS)
            else
                spell:setMsg(invaderXim.msg.basic.MAGIC_ENFEEB)
            end
        end
    else
        spell:setMsg(invaderXim.msg.basic.MAGIC_NO_EFFECT)
    end

    return spellEffect
end
