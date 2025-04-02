-----------------------------------
-- Area: Al'Taieu
--  HNM: Absolute Virtue
-- !pos 461.266 -1.643 -580.192 33
-- !exec SpawnMob(zones[invaderXim.zone.ALTAIEU].mob.ABSOLUTE_VIRTUE)
-----------------------------------
local ID = zones[invaderXim.zone.ALTAIEU]
-----------------------------------
--[[
    misc sources:
    http://rukenshin.livejournal.com/15173.html

    Post-nerf HP: 11k heal at 95% HP. 11000 / (1 - .95) = 220,000
    http://home.eyesonff.com/showthread.php/80870-Absolute-Virtue-Beaten

    Stats: +100 MDB, +132 MAB
    https://www.bluegartr.com/threads/81211-Absolute-Virtue-Information-(OP-Updated)

    - Near instant to instant fast cast
    - Enhanced Movement Speed (~150%)
    - Immune to all enfeebles except Shadowbind, Elemental DoTs, Dia, and Bio [?? - any other exceptions?]
    - Quickly gains resistance to Souleater damage (September '08 patch)
    - Resists Modus Veritas (October '09 patch)

    In addition to the magic defense bonus +100 outlined earlier, AV has a general all damage types reduced that gradually
    increases as its current HP decreases. This applies to all forms of damage - magic, physical, and even non-elemental
    such as Shield Bash. This damage reduction seems to increase proportionally to its remaining HP%
    (for instance, at 50% HP, it has roughly -50% damage taken on top of MDB). It is unknown how this modifier works at extremely
    low HP, since if this reduction remained linear, at 1% HP, it would have 99% damage reduction (virtually unkillable).

    TODO:
    - Remove magic numbers
    - Replace all var strings with table entries
    - Move 'JoL_Qn_xzomit_Killed' tracking onto invaderXim.av object instead of local vars
    - Move 'JoL_Qn_hpemde_Killed' tracking onto invaderXim.av object instead of local vars
    - Give all variables better names
    - Address all inline TODOs
    - Align and format file
]]

-----------------------------------
-- Helper Functions, Tables, etc.
-----------------------------------

-- instead of storing a bunch of numeric vars we will store a global object
xi = xi or {}
invaderXim.av = invaderXim.av or {}

-- While this flag is in place, AV's won't drop any loot. Sorry!
invaderXim.av.experimental = true

-- Set to true to get local debug prints about AV's behavior
local debugAV = false
local avdebug = utils.getDebugPlayerPrinter(debugAV)

local combos =
{
    [invaderXim.jsa.CHAINSPELL    ] = { invaderXim.jsa.CHAINSPELL,     invaderXim.jsa.MANAFONT,     { invaderXim.jsa.CHAINSPELL, invaderXim.jsa.SOUL_VOICE } },
    [invaderXim.jsa.MIGHTY_STRIKES] = { invaderXim.jsa.MIGHTY_STRIKES, invaderXim.jsa.HUNDRED_FISTS                                          },
    [invaderXim.jsa.MEIKYO_SHISUI ] = { invaderXim.jsa.MEIKYO_SHISUI,  invaderXim.jsa.EES_AERN,     invaderXim.jsa.EES_AERN,     invaderXim.jsa.EES_AERN     },
    [invaderXim.jsa.INVINCIBLE    ] = { invaderXim.jsa.INVINCIBLE,     invaderXim.jsa.BENEDICTION,  invaderXim.jsa.MIJIN_GAKURE                      },
    [invaderXim.jsa.CALL_WYVERN   ] = { invaderXim.jsa.CALL_WYVERN,    invaderXim.jsa.FAMILIAR,     invaderXim.jsa.ASTRAL_FLOW                       },
}

local handleDamageResists = function(mob)
    local nextThreehold = mob:getLocalVar('dmgThreshold')
    local currentHPP    = mob:getHPP()

    if currentHPP <= nextThreehold then
        local dmg = (100 - currentHPP) * -100 -- This modifiers are base 10000
        mob:setMod(invaderXim.mod.UDMGPHYS, dmg)
        mob:setMod(invaderXim.mod.UDMGRANGE, dmg)
        mob:setMod(invaderXim.mod.UDMGMAGIC, dmg)
        mob:setMod(invaderXim.mod.UDMGBREATH, dmg)
        mob:setLocalVar('dmgThreshold', nextThreehold - 10)
    end
end

local playerAbilityToMobSP =
{
    [invaderXim.ja.MIGHTY_STRIKES] = invaderXim.jsa.MIGHTY_STRIKES,
    [invaderXim.ja.HUNDRED_FISTS]  = invaderXim.jsa.HUNDRED_FISTS,
    [invaderXim.ja.BENEDICTION]    = invaderXim.jsa.BENEDICTION,
    [invaderXim.ja.MANAFONT]       = invaderXim.jsa.MANAFONT,
    [invaderXim.ja.CHAINSPELL]     = invaderXim.jsa.CHAINSPELL,
    [invaderXim.ja.PERFECT_DODGE]  = invaderXim.jsa.PERFECT_DODGE,
    [invaderXim.ja.INVINCIBLE]     = invaderXim.jsa.INVINCIBLE,
    [invaderXim.ja.BLOOD_WEAPON]   = invaderXim.jsa.BLOOD_WEAPON,
    [invaderXim.ja.FAMILIAR]       = invaderXim.jsa.FAMILIAR,
    [invaderXim.ja.SOUL_VOICE]     = invaderXim.jsa.SOUL_VOICE,
    [invaderXim.ja.EAGLE_EYE_SHOT] = invaderXim.jsa.EES_AERN,
    [invaderXim.ja.MEIKYO_SHISUI]  = invaderXim.jsa.MEIKYO_SHISUI,
    [invaderXim.ja.MIJIN_GAKURE]   = invaderXim.jsa.MIJIN_GAKURE,
    [invaderXim.ja.ASTRAL_FLOW]    = invaderXim.jsa.ASTRAL_FLOW,
    [invaderXim.ja.CALL_WYVERN]    = invaderXim.jsa.CALL_WYVERN,
}

local isLocked = function(sp)
    if #invaderXim.av.sps == 0 then
        return true
    end

    for _, jsa in ipairs(invaderXim.av.sps) do
        if sp == jsa then
            return false
        end
    end

    return true
end

local lock = function(sp)
    for i, jsa in ipairs(invaderXim.av.sps) do
        if jsa == sp then
            avdebug(string.format('locked: %d', sp))
            table.remove(invaderXim.av.sps, i)
            break
        end
    end

    for i, jsa in ipairs(invaderXim.av.braceletsps) do
        if jsa == sp then
            table.remove(invaderXim.av.braceletsps, i)
            break
        end
    end
end

-- TODO: handle pets and pet sp abilities
local handleSP = function(mob)
    local now = os.time()
    if now > invaderXim.av.nextsp then
        if invaderXim.av.bracelets and #invaderXim.av.braceletsps ~= 0 then
            local trigger = invaderXim.av.braceletsps[math.random(1, #invaderXim.av.braceletsps)]
            local combo = combos[trigger]
            if trigger == invaderXim.jsa.CHAINSPELL then
                combo = combos[math.random(1, 2)]
            end

            for _, jsa in ipairs(combo) do
                if not isLocked(jsa) then
                    mob:setLocalVar(string.format('sp_%u', jsa), os.time())
                    avdebug(string.format('%s using %d', mob:getName(), jsa))
                    mob:useMobAbility(jsa)
                end
            end
        elseif #invaderXim.av.sps ~= 0 then
            local sp = invaderXim.av.sps[math.random(1, #invaderXim.av.sps)]
            mob:setLocalVar(string.format('sp_%u', sp), os.time())
            avdebug(string.format('%s using %d', mob:getName(), sp))
            mob:useMobAbility(sp)
        end

        -- TODO: minimum should be max of 2hr combos length
        invaderXim.av.nextsp = now + math.random(45, 90)
    end
end

-----------------------------------
-- AV Entity Hooks
-----------------------------------

---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(invaderXim.mobMod.ABILITY_RESPONSE, 1)

    --[[
    mob:setMobMod(invaderXim.mobMod.MAGIC_COOL, 20)
    mob:setMobMod(invaderXim.mobMod.IDLE_DESPAWN, 180)
    mob:setMod(invaderXim.mod.SOULEATERRES, 4)
    mob:setMod(invaderXim.mod.UFASTCAST, 100)
    mob:setMod(invaderXim.mod.MAIN_DMG_RATING, 150)
    mob:setMod(invaderXim.mod.ATT, 300)
    mob:setMod(invaderXim.mod.DEF, 300)
    mob:setMod(invaderXim.mod.MATT, 132)
    mob:setMod(invaderXim.mod.MDEF, 200)
    mob:setMod(invaderXim.mod.REFRESH, 500)
    mob:setMod(invaderXim.mod.REGAIN, 200)

    mob:addImmunity(invaderXim.immunity.SLEEP)
    mob:addImmunity(invaderXim.immunity.GRAVITY)
    mob:addImmunity(invaderXim.immunity.BIND)
    mob:addImmunity(invaderXim.immunity.STUN)
    mob:addImmunity(invaderXim.immunity.SILENCE)
    mob:addImmunity(invaderXim.immunity.PARALYZE)
    mob:addImmunity(invaderXim.immunity.BLIND)
    mob:addImmunity(invaderXim.immunity.SLOW)
    mob:addImmunity(invaderXim.immunity.POISON)
    mob:addImmunity(invaderXim.immunity.ELEGY)
    mob:addImmunity(invaderXim.immunity.REQUIEM)

    mob:speed(60)
    ]]--
end

entity.onMobSpawn = function(mob)
    -- reset av
    mob:setAnimationSub(1)

    if invaderXim.av.experimental then
        mob:setDropID(0) -- No loot!
    end

    invaderXim.av.regen = 250
    invaderXim.av.bracelets = false
    invaderXim.av.locks = {}
    invaderXim.av.sps =
    {
        invaderXim.jsa.MIGHTY_STRIKES,
        invaderXim.jsa.BENEDICTION,
        invaderXim.jsa.HUNDRED_FISTS,
        invaderXim.jsa.MANAFONT,
        invaderXim.jsa.CHAINSPELL,
        invaderXim.jsa.PERFECT_DODGE, -- no combo
        invaderXim.jsa.INVINCIBLE,
        invaderXim.jsa.BLOOD_WEAPON, -- no combo
        invaderXim.jsa.SOUL_VOICE,
        invaderXim.jsa.MEIKYO_SHISUI,
        invaderXim.jsa.MIJIN_GAKURE,
        invaderXim.jsa.EES_AERN,
        invaderXim.jsa.CALL_WYVERN,
        invaderXim.jsa.FAMILIAR,
        invaderXim.jsa.ASTRAL_FLOW,
    }

    invaderXim.av.braceletsps =
    {
        invaderXim.jsa.CHAINSPELL,
        invaderXim.jsa.MIGHTY_STRIKES,
        invaderXim.jsa.MEIKYO_SHISUI,
        invaderXim.jsa.INVINCIBLE,
        invaderXim.jsa.CALL_WYVERN,
    }

    -- Special check for regen modification by JoL pets killed
    local jol = GetMobByID(ID.mob.JAILER_OF_LOVE)
    if jol ~= nil then
        if jol:getLocalVar('JoL_Qn_xzomit_Killed') == 9 then
            mob:addMod(invaderXim.mod.REGEN, 125)
        end

        if jol:getLocalVar('JoL_Qn_hpemde_Killed') == 9 then
            mob:addMod(invaderXim.mod.REGEN, 125)
        end
    end

    -- base regen by day/element
    mob:addMod(invaderXim.mod.REGEN, 250)

    --[[
    mob:setMod(invaderXim.mod.UDMGPHYS, 0)
    mob:setMod(invaderXim.mod.UDMGRANGE, 0)
    mob:setMod(invaderXim.mod.UDMGMAGIC, 0)
    mob:setMod(invaderXim.mod.UDMGBREATH, 0)
    mob:setLocalVar('dmgThreshold', 90)
    ]]--
end

entity.onMobRoam = function(mob)
end

entity.onMobEngage = function(mob, target)
    invaderXim.av.nextsp = os.time() + math.random(45, 90)
end

entity.onPlayerAbilityUse = function(mob, player, ability)
    avdebug(string.format('%s used ability: %s', player:getName(), ability:getName()))
    local abilityID = ability:getID()
    local sp = playerAbilityToMobSP[abilityID]
    if sp ~= nil and player:checkDistance(mob) <= 15 then
        local now = os.time()
        local used = mob:getLocalVar(string.format('sp_%u', sp))
        local lockWindowTime = 3 -- Just over 1x game tick
        if used ~= 0 and now < used + lockWindowTime then
            avdebug(string.format('%s used within lock window, trying to lock!', ability:getName()))
            lock(sp)
        end
    end
end

-- TODO: make AV and JoL pets link to mobs current target when idle
entity.onMobFight = function(mob)
    handleDamageResists(mob) -- damage taken scales with HP
    handleSP(mob) -- AV has complex special ability logic

    if not invaderXim.av.bracelets and mob:getHPP() <= 60 then
        mob:queue(0, function(mobArg)
            mobArg:setAnimationSub(2)
            mobArg:stun(2000)

            mobArg:addMod(invaderXim.mod.STR, 50)
            mobArg:addMod(invaderXim.mod.DEX, 50)
            mobArg:addMod(invaderXim.mod.VIT, 50)
            mobArg:addMod(invaderXim.mod.AGI, 50)
            mobArg:addMod(invaderXim.mod.INT, 50)
            mobArg:addMod(invaderXim.mod.MND, 50)
            mobArg:addMod(invaderXim.mod.CHR, 50)
            mobArg:addMod(invaderXim.mod.ATT, 300)
            mobArg:addMod(invaderXim.mod.MATT, 50)

            invaderXim.av.bracelets = true
        end)
    end
end

entity.onSpellPrecast = function(mob, spell)
    if spell:getID() == invaderXim.magic.spell.METEOR then
        spell:setAoE(invaderXim.magic.aoe.RADIAL)
        spell:setFlag(invaderXim.magic.spellFlag.HIT_ALL)
        spell:setRadius(30)
        spell:setAnimation(280) -- AoE Meteor Animation
    end
end

entity.onMagicHit = function(caster, target, spell)
    if
        spell:getSkillType() == invaderXim.skill.ELEMENTAL_MAGIC and
        invaderXim.av.regen >= 2 and invaderXim.av.regen <= 48
    then
        local isCasterPCOrPet = caster:isPC() or caster:isPet()
        if
            VanadielDayElement() == spell:getElement() and
            isCasterPCOrPet
        then
            invaderXim.av.regen = invaderXim.av.regen - 2
            target:delMod(invaderXim.mod.REGEN, 2)
        else
            invaderXim.av.regen = invaderXim.av.regen + 2
            target:addMod(invaderXim.mod.REGEN, 2)
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
    if player then
        player:addTitle(invaderXim.title.VIRTUOUS_SAINT)
    end

    local firstCall = optParams.isKiller or optParams.noKiller
    if firstCall then
        local mobid = mob:getID()
        for i = 1, 6 do
            DespawnMob(mobid + i)
        end
    end
end

entity.onMobDespawn = function(mob)
    local mobid = mob:getID()
    for i = 1, 6 do
        DespawnMob(mobid + i)
    end
end

return entity
