AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_hlr/hlze/scientist.mdl"
ENT.StartHealth = 50
ENT.HullType = HULL_HUMAN
ENT.ControllerParams = {
	ThirdP_Offset = Vector(30, 20, -50),
	FirstP_Bone = "Bip01 Head",
	FirstP_Offset = Vector(5, 0, 5),
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_PLAYER_ALLY"}
ENT.AlliedWithPlayerAllies = true
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_hlr_blood_red"}
ENT.BloodDecal = {"VJ_HLR1_Blood_Red"}
ENT.HasBloodPool = false
ENT.BecomeEnemyToPlayer = true
ENT.HasOnPlayerSight = true
ENT.HasMeleeAttack = false

-- Weapon
//ENT.Weapon_IgnoreSpawnMenu = true
ENT.DisableWeaponFiringGesture = true
ENT.Weapon_Strafe = false

-- Medic
ENT.IsMedic = true
ENT.Medic_DisableAnimation = true
ENT.Medic_TimeUntilHeal = 4
ENT.Medic_SpawnPropOnHeal = false

ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = {ACT_DIEBACKWARD, ACT_DIEFORWARD, ACT_DIESIMPLE}
ENT.DropDeathLoot = false
ENT.DisableFootStepSoundTimer = true

-- Flinching
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.FlinchHitGroupMap = {{HitGroup = {HITGROUP_LEFTLEG}, Animation = {ACT_FLINCH_LEFTLEG}},{HitGroup = {HITGROUP_RIGHTLEG}, Animation = {ACT_FLINCH_RIGHTLEG}}}

-- Sounds
ENT.SoundTbl_FootStep = {"vj_hlr/gsrc/pl_step1.wav","vj_hlr/gsrc/pl_step2.wav","vj_hlr/gsrc/pl_step3.wav","vj_hlr/gsrc/pl_step4.wav"}
ENT.SoundTbl_Idle = {"vj_hlr/gsrc/npc/scientist/administrator.wav","vj_hlr/gsrc/npc/scientist/c1a0_sci_stall.wav","vj_hlr/gsrc/npc/scientist/c1a1_sci_3scan.wav","vj_hlr/gsrc/npc/scientist/c1a1_sci_2scan.wav","vj_hlr/gsrc/npc/scientist/c1a1_sci_1scan.wav","vj_hlr/gsrc/npc/scientist/c1a4_sci_trainend.wav","vj_hlr/gsrc/npc/scientist/containfail.wav","vj_hlr/gsrc/npc/scientist/cough.wav","vj_hlr/gsrc/npc/scientist/fusionshunt.wav","vj_hlr/gsrc/npc/scientist/hopenominal.wav","vj_hlr/gsrc/npc/scientist/hideglasses.wav","vj_hlr/gsrc/npc/scientist/howinteresting.wav","vj_hlr/gsrc/npc/scientist/ipredictedthis.wav","vj_hlr/gsrc/npc/scientist/needsleep.wav","vj_hlr/gsrc/npc/scientist/neverseen.wav","vj_hlr/gsrc/npc/scientist/nogrant.wav","vj_hlr/gsrc/npc/scientist/organicmatter.wav","vj_hlr/gsrc/npc/scientist/peculiarmarks.wav","vj_hlr/gsrc/npc/scientist/peculiarodor.wav","vj_hlr/gsrc/npc/scientist/reportflux.wav","vj_hlr/gsrc/npc/scientist/runtest.wav","vj_hlr/gsrc/npc/scientist/shutdownchart.wav","vj_hlr/gsrc/npc/scientist/somethingfoul.wav","vj_hlr/gsrc/npc/scientist/sneeze.wav","vj_hlr/gsrc/npc/scientist/sniffle.wav","vj_hlr/gsrc/npc/scientist/stench.wav","vj_hlr/gsrc/npc/scientist/thatsodd.wav","vj_hlr/gsrc/npc/scientist/thatsmell.wav","vj_hlr/gsrc/npc/scientist/allnominal.wav","vj_hlr/gsrc/npc/scientist/importantspecies.wav","vj_hlr/gsrc/npc/scientist/yawn.wav","vj_hlr/gsrc/npc/scientist/whoresponsible.wav","vj_hlr/gsrc/npc/scientist/uselessphd.wav"}
ENT.SoundTbl_IdleDialogue = {"vj_hlr/gsrc/npc/scientist/alienappeal.wav","vj_hlr/gsrc/npc/scientist/alientrick.wav","vj_hlr/gsrc/npc/scientist/analysis.wav","vj_hlr/gsrc/npc/scientist/announcer.wav","vj_hlr/gsrc/npc/scientist/bloodsample.wav","vj_hlr/gsrc/npc/scientist/beverage.wav","vj_hlr/gsrc/npc/scientist/areyouthink.wav","vj_hlr/gsrc/npc/scientist/catchone.wav","vj_hlr/gsrc/npc/scientist/cascade.wav","vj_hlr/gsrc/npc/scientist/everseen.wav","vj_hlr/gsrc/npc/scientist/doyousmell.wav","vj_hlr/gsrc/npc/scientist/donuteater.wav","vj_hlr/gsrc/npc/scientist/dinner.wav","vj_hlr/gsrc/npc/scientist/fascinating.wav","vj_hlr/gsrc/npc/scientist/headcrab.wav","vj_hlr/gsrc/npc/scientist/goodpaper.wav","vj_hlr/gsrc/npc/scientist/improbable.wav","vj_hlr/gsrc/npc/scientist/hungryyet.wav","vj_hlr/gsrc/npc/scientist/koso.wav","vj_hlr/gsrc/npc/scientist/lambdalab.wav","vj_hlr/gsrc/npc/scientist/newsample.wav","vj_hlr/gsrc/npc/scientist/nothostile.wav","vj_hlr/gsrc/npc/scientist/perfectday.wav","vj_hlr/gsrc/npc/scientist/recalculate.wav","vj_hlr/gsrc/npc/scientist/purereadings.wav","vj_hlr/gsrc/npc/scientist/rumourclean.wav","vj_hlr/gsrc/npc/scientist/shakeunification.wav","vj_hlr/gsrc/npc/scientist/seencup.wav","vj_hlr/gsrc/npc/scientist/smellburn.wav","vj_hlr/gsrc/npc/scientist/softethics.wav","vj_hlr/gsrc/npc/scientist/stimulating.wav","vj_hlr/gsrc/npc/scientist/simulation.wav","vj_hlr/gsrc/npc/scientist/statusreport.wav","vj_hlr/gsrc/npc/scientist/tunedtoday.wav","vj_hlr/gsrc/npc/scientist/sunsets.wav","vj_hlr/gsrc/npc/scientist/survival.wav","vj_hlr/gsrc/npc/scientist/tunnelcalc.wav","vj_hlr/gsrc/npc/scientist/delayagain.wav","vj_hlr/gsrc/npc/scientist/safetyinnumbers.wav","vj_hlr/gsrc/npc/scientist/chaostheory.wav","vj_hlr/gsrc/npc/scientist/checkatten.wav","vj_hlr/gsrc/npc/scientist/chimp.wav"}
ENT.SoundTbl_IdleDialogueAnswer = {"vj_hlr/gsrc/npc/scientist/yees.wav","vj_hlr/gsrc/npc/scientist/yes3.wav","vj_hlr/gsrc/npc/scientist/absolutely.wav","vj_hlr/gsrc/npc/scientist/absolutelynot.wav","vj_hlr/gsrc/npc/scientist/cantbeserious.wav","vj_hlr/gsrc/npc/scientist/completelywrong.wav","vj_hlr/gsrc/npc/scientist/correcttheory.wav","vj_hlr/gsrc/npc/scientist/whocansay.wav","vj_hlr/gsrc/npc/scientist/whyaskme.wav","vj_hlr/gsrc/npc/scientist/stopasking.wav","vj_hlr/gsrc/npc/scientist/theoretically.wav","vj_hlr/gsrc/npc/scientist/shutup.wav","vj_hlr/gsrc/npc/scientist/shutup2.wav","vj_hlr/gsrc/npc/scientist/sci_bother.wav","vj_hlr/gsrc/npc/scientist/perhaps.wav","vj_hlr/gsrc/npc/scientist/positively.wav","vj_hlr/gsrc/npc/scientist/repeat.wav","vj_hlr/gsrc/npc/scientist/ridiculous.wav","vj_hlr/gsrc/npc/scientist/right.wav","vj_hlr/gsrc/npc/scientist/ofcourse.wav","vj_hlr/gsrc/npc/scientist/ofcoursenot.wav","vj_hlr/gsrc/npc/scientist/nodoubt.wav","vj_hlr/gsrc/npc/scientist/noguess.wav","vj_hlr/gsrc/npc/scientist/noidea.wav","vj_hlr/gsrc/npc/scientist/noo.wav","vj_hlr/gsrc/npc/scientist/notcertain.wav","vj_hlr/gsrc/npc/scientist/notsure.wav","vj_hlr/gsrc/npc/scientist/dontconcur.wav","vj_hlr/gsrc/npc/scientist/dontknow.wav","vj_hlr/gsrc/npc/scientist/ibelieveso.wav","vj_hlr/gsrc/npc/scientist/idiotic.wav","vj_hlr/gsrc/npc/scientist/idontthinkso.wav","vj_hlr/gsrc/npc/scientist/imsure.wav","vj_hlr/gsrc/npc/scientist/inconclusive.wav","vj_hlr/gsrc/npc/scientist/justasked.wav"}
ENT.SoundTbl_CombatIdle = {"vj_hlr/gsrc/npc/scientist/scream01.wav","vj_hlr/gsrc/npc/scientist/scream02.wav","vj_hlr/gsrc/npc/scientist/scream03.wav","vj_hlr/gsrc/npc/scientist/scream04.wav","vj_hlr/gsrc/npc/scientist/scream05.wav","vj_hlr/gsrc/npc/scientist/scream06.wav","vj_hlr/gsrc/npc/scientist/scream07.wav","vj_hlr/gsrc/npc/scientist/scream08.wav","vj_hlr/gsrc/npc/scientist/scream09.wav","vj_hlr/gsrc/npc/scientist/scream10.wav","vj_hlr/gsrc/npc/scientist/scream11.wav","vj_hlr/gsrc/npc/scientist/scream12.wav","vj_hlr/gsrc/npc/scientist/scream13.wav","vj_hlr/gsrc/npc/scientist/scream14.wav","vj_hlr/gsrc/npc/scientist/scream15.wav","vj_hlr/gsrc/npc/scientist/scream16.wav","vj_hlr/gsrc/npc/scientist/scream17.wav","vj_hlr/gsrc/npc/scientist/scream18.wav","vj_hlr/gsrc/npc/scientist/scream19.wav","vj_hlr/gsrc/npc/scientist/scream20.wav","vj_hlr/gsrc/npc/scientist/scream22.wav","vj_hlr/gsrc/npc/scientist/scream23.wav","vj_hlr/gsrc/npc/scientist/scream24.wav","vj_hlr/gsrc/npc/scientist/scream25.wav","vj_hlr/gsrc/npc/scientist/sci_fear8.wav","vj_hlr/gsrc/npc/scientist/sci_fear7.wav","vj_hlr/gsrc/npc/scientist/sci_fear15.wav","vj_hlr/gsrc/npc/scientist/sci_fear2.wav","vj_hlr/gsrc/npc/scientist/sci_fear3.wav","vj_hlr/gsrc/npc/scientist/sci_fear4.wav","vj_hlr/gsrc/npc/scientist/sci_fear5.wav","vj_hlr/gsrc/npc/scientist/sci_fear11.wav","vj_hlr/gsrc/npc/scientist/sci_fear12.wav","vj_hlr/gsrc/npc/scientist/sci_fear13.wav","vj_hlr/gsrc/npc/scientist/sci_fear1.wav","vj_hlr/gsrc/npc/scientist/rescueus.wav","vj_hlr/gsrc/npc/scientist/nooo.wav","vj_hlr/gsrc/npc/scientist/noplease.wav","vj_hlr/gsrc/npc/scientist/madness.wav","vj_hlr/gsrc/npc/scientist/gottogetout.wav","vj_hlr/gsrc/npc/scientist/getoutofhere.wav","vj_hlr/gsrc/npc/scientist/getoutalive.wav","vj_hlr/gsrc/npc/scientist/evergetout.wav","vj_hlr/gsrc/npc/scientist/dontwantdie.wav","vj_hlr/gsrc/npc/scientist/b01_sci01_whereami.wav","vj_hlr/gsrc/npc/scientist/cantbeworse.wav","vj_hlr/gsrc/npc/scientist/canttakemore.wav"}
ENT.SoundTbl_FollowPlayer = {"vj_hlr/gsrc/npc/scientist/yes.wav","vj_hlr/gsrc/npc/scientist/yes2.wav","vj_hlr/gsrc/npc/scientist/yesletsgo.wav","vj_hlr/gsrc/npc/scientist/yesok.wav","vj_hlr/gsrc/npc/scientist/yesihope.wav","vj_hlr/gsrc/npc/scientist/waithere.wav","vj_hlr/gsrc/npc/scientist/rightwayout.wav","vj_hlr/gsrc/npc/scientist/protectme.wav","vj_hlr/gsrc/npc/scientist/okgetout.wav","vj_hlr/gsrc/npc/scientist/okihope.wav","vj_hlr/gsrc/npc/scientist/odorfromyou.wav","vj_hlr/gsrc/npc/scientist/letsgo.wav","vj_hlr/gsrc/npc/scientist/leadtheway.wav","vj_hlr/gsrc/npc/scientist/icanhelp.wav","vj_hlr/gsrc/npc/scientist/hopeyouknow.wav","vj_hlr/gsrc/npc/scientist/fellowscientist.wav","vj_hlr/gsrc/npc/scientist/excellentteam.wav","vj_hlr/gsrc/npc/scientist/d01_sci14_right.wav","vj_hlr/gsrc/npc/scientist/c1a0_sci_scanrpt.wav","vj_hlr/gsrc/npc/scientist/alright.wav"}
ENT.SoundTbl_UnFollowPlayer = {"vj_hlr/gsrc/npc/scientist/whyleavehere.wav","vj_hlr/gsrc/npc/scientist/slowingyou.wav","vj_hlr/gsrc/npc/scientist/reconsider.wav","vj_hlr/gsrc/npc/scientist/leavingme.wav","vj_hlr/gsrc/npc/scientist/istay.wav","vj_hlr/gsrc/npc/scientist/illwaithere.wav","vj_hlr/gsrc/npc/scientist/illwait.wav","vj_hlr/gsrc/npc/scientist/fine.wav","vj_hlr/gsrc/npc/scientist/d01_sci14_right.wav","vj_hlr/gsrc/npc/scientist/crowbar.wav","vj_hlr/gsrc/npc/scientist/cantbeserious.wav","vj_hlr/gsrc/npc/scientist/c1a3_sci_1man.wav","vj_hlr/gsrc/npc/scientist/c1a1_sci_5scan.wav","vj_hlr/gsrc/npc/scientist/asexpected.wav","vj_hlr/gsrc/npc/scientist/beenaburden.wav"}
ENT.SoundTbl_YieldToPlayer = {"vj_hlr/gsrc/npc/scientist/sorryimleaving.wav","vj_hlr/gsrc/npc/scientist/excuse.wav"}
ENT.SoundTbl_MedicBeforeHeal = {"vj_hlr/gsrc/npc/scientist/youlookbad.wav","vj_hlr/gsrc/npc/scientist/youlookbad2.wav","vj_hlr/gsrc/npc/scientist/youneedmedic.wav","vj_hlr/gsrc/npc/scientist/youwounded.wav","vj_hlr/gsrc/npc/scientist/thiswillhelp.wav","vj_hlr/gsrc/npc/scientist/letstrythis.wav","vj_hlr/gsrc/npc/scientist/letmehelp.wav","vj_hlr/gsrc/npc/scientist/holdstill.wav","vj_hlr/gsrc/npc/scientist/heal1.wav","vj_hlr/gsrc/npc/scientist/heal2.wav","vj_hlr/gsrc/npc/scientist/heal3.wav","vj_hlr/gsrc/npc/scientist/heal4.wav","vj_hlr/gsrc/npc/scientist/heal5.wav"}
ENT.SoundTbl_OnPlayerSight = {"vj_hlr/gsrc/npc/scientist/undertest.wav","vj_hlr/gsrc/npc/scientist/sci_somewhere.wav","vj_hlr/gsrc/npc/scientist/saved.wav","vj_hlr/gsrc/npc/scientist/newhevsuit.wav","vj_hlr/gsrc/npc/scientist/keller.wav","vj_hlr/gsrc/npc/scientist/inmesstoo.wav","vj_hlr/gsrc/npc/scientist/hellothere.wav","vj_hlr/gsrc/npc/scientist/hellofromlab.wav","vj_hlr/gsrc/npc/scientist/hellofreeman.wav","vj_hlr/gsrc/npc/scientist/hello.wav","vj_hlr/gsrc/npc/scientist/greetings.wav","vj_hlr/gsrc/npc/scientist/greetings2.wav","vj_hlr/gsrc/npc/scientist/goodtoseeyou.wav","vj_hlr/gsrc/npc/scientist/freemanalive.wav","vj_hlr/gsrc/npc/scientist/freeman.wav","vj_hlr/gsrc/npc/scientist/fix.wav","vj_hlr/gsrc/npc/scientist/corporal.wav","vj_hlr/gsrc/npc/scientist/c3a2_sci_1surv.wav","vj_hlr/gsrc/npc/scientist/c2a4_sci_surgury.wav","vj_hlr/gsrc/npc/scientist/c1a3_sci_thankgod.wav","vj_hlr/gsrc/npc/scientist/c1a0_sci_itsyou.wav","vj_hlr/gsrc/npc/scientist/c1a0_sci_gm1.wav","vj_hlr/gsrc/npc/scientist/c1a0_sci_gm.wav","vj_hlr/gsrc/npc/scientist/afellowsci.wav","vj_hlr/gsrc/npc/scientist/ahfreeman.wav","vj_hlr/gsrc/npc/scientist/c1a0_sci_bigday.wav","vj_hlr/gsrc/npc/scientist/c1a0_sci_ctrl4a.wav"}
ENT.SoundTbl_Investigate = {"vj_hlr/gsrc/npc/scientist/whatissound.wav","vj_hlr/gsrc/npc/scientist/overhere.wav","vj_hlr/gsrc/npc/scientist/lowervoice.wav","vj_hlr/gsrc/npc/scientist/ihearsomething.wav","vj_hlr/gsrc/npc/scientist/hello2.wav","vj_hlr/gsrc/npc/scientist/hearsomething.wav","vj_hlr/gsrc/npc/scientist/didyouhear.wav","vj_hlr/gsrc/npc/scientist/d01_sci10_interesting.wav","vj_hlr/gsrc/npc/scientist/c3a2_sci_1glu.wav"}
ENT.SoundTbl_Alert = {"vj_hlr/gsrc/npc/scientist/startle1.wav","vj_hlr/gsrc/npc/scientist/startle2.wav","vj_hlr/gsrc/npc/scientist/startle3.wav","vj_hlr/gsrc/npc/scientist/startle4.wav","vj_hlr/gsrc/npc/scientist/startle5.wav","vj_hlr/gsrc/npc/scientist/startle6.wav","vj_hlr/gsrc/npc/scientist/startle7.wav","vj_hlr/gsrc/npc/scientist/startle8.wav","vj_hlr/gsrc/npc/scientist/startle9.wav","vj_hlr/gsrc/npc/scientist/startle1.wav","vj_hlr/gsrc/npc/scientist/startle2.wav","vj_hlr/gsrc/npc/scientist/c1a3_sci_silo2a.wav"}
ENT.SoundTbl_BecomeEnemyToPlayer = {"vj_hlr/gsrc/npc/scientist/getalong.wav","vj_hlr/gsrc/npc/scientist/advance.wav","vj_hlr/gsrc/npc/scientist/c2a4_sci_alldie.wav"}
ENT.SoundTbl_GrenadeSight = {"vj_hlr/gsrc/npc/scientist/sci_fear6.wav","vj_hlr/gsrc/npc/scientist/sci_fear14.wav","vj_hlr/gsrc/npc/scientist/c1a2_sci_1zomb.wav"}
ENT.SoundTbl_AllyDeath = {"vj_hlr/gsrc/npc/scientist/whatnext.wav","vj_hlr/gsrc/npc/scientist/luckwillchange.wav"}
ENT.SoundTbl_Pain = {"vj_hlr/gsrc/npc/scientist/sci_pain1.wav","vj_hlr/gsrc/npc/scientist/sci_pain2.wav","vj_hlr/gsrc/npc/scientist/sci_pain3.wav","vj_hlr/gsrc/npc/scientist/sci_pain4.wav","vj_hlr/gsrc/npc/scientist/sci_pain5.wav","vj_hlr/gsrc/npc/scientist/sci_pain6.wav","vj_hlr/gsrc/npc/scientist/sci_pain7.wav","vj_hlr/gsrc/npc/scientist/sci_pain8.wav","vj_hlr/gsrc/npc/scientist/sci_pain9.wav","vj_hlr/gsrc/npc/scientist/sci_pain10.wav","vj_hlr/gsrc/npc/scientist/sci_fear9.wav","vj_hlr/gsrc/npc/scientist/sci_fear10.wav","vj_hlr/gsrc/npc/scientist/c1a2_sci_dangling.wav","vj_hlr/gsrc/npc/scientist/iwounded.wav","vj_hlr/gsrc/npc/scientist/iwounded2.wav","vj_hlr/gsrc/npc/scientist/iwoundedbad.wav"}
ENT.SoundTbl_DamageByPlayer = {"vj_hlr/gsrc/npc/scientist/youinsane.wav","vj_hlr/gsrc/npc/scientist/whatyoudoing.wav","vj_hlr/gsrc/npc/scientist/please.wav","vj_hlr/gsrc/npc/scientist/c3a2_sci_fool.wav","vj_hlr/gsrc/npc/scientist/c1a3_sci_team.wav","vj_hlr/gsrc/npc/scientist/c1a0_sci_stayback.wav","vj_hlr/gsrc/npc/scientist/c1a2_sci_3zomb.wav","vj_hlr/gsrc/npc/scientist/c1a2_sci_5zomb.wav"}
ENT.SoundTbl_Death = {"vj_hlr/gsrc/npc/scientist/scream5.wav","vj_hlr/gsrc/npc/scientist/scream21.wav","vj_hlr/gsrc/npc/scientist/sci_die1.wav","vj_hlr/gsrc/npc/scientist/sci_die2.wav","vj_hlr/gsrc/npc/scientist/sci_die3.wav","vj_hlr/gsrc/npc/scientist/sci_die4.wav","vj_hlr/gsrc/npc/scientist/sci_dragoff.wav"}

ENT.MainSoundPitch = 100

-- Custom
ENT.SCI_NextMouthMove = 0
ENT.SCI_NextMouthDistance = 0
ENT.SCI_NextTieAnnoyanceT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
local defaultWeapons = {
	false,
	false,
	false,
	false,
	"weapon_vj_hlrze_beretta",
	"weapon_vj_hlrze_beretta",
	"weapon_vj_hlrze_beretta",
	"weapon_vj_hlrze_spas12",
	"weapon_vj_hlrze_m16",
}
--
function ENT:Init()
	-- Bodygroup: Head
	local randHead = math.random(0, 3)
	self:SetBodygroup(1, randHead)
	if randHead == 2 then
		self:SetSkin(1)
	end

	local wepOverride = GetConVar("gmod_npcweapon"):GetString()
	timer.Simple(0.12, function()
		if IsValid(self) then
			if wepOverride != "none" then
				local wep = self:GetActiveWeapon()
				if !IsValid(wep) then
					self:DoChangeWeapon(VJ.PICK(defaultWeapons))
				end
			end
			
			-- Set behavior based on weapon validity
			if IsValid(self:GetActiveWeapon()) then
				self.Behavior = VJ_BEHAVIOR_AGGRESSIVE
				self.IsMedic = false
			else
				self.Behavior = VJ_BEHAVIOR_PASSIVE
			end
		end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetAnimationTranslations(wepHoldType)
	local wep = self:GetActiveWeapon()
	if !IsValid(wep) then return end
	
	if wepHoldType == "smg" or wepHoldType == "ar2" then
		if wep:GetClass() == "weapon_vj_hlrze_m16" then 
			self:SetBodygroup(3, 3)
			wep.NPC_ReloadSound = {"vj_hlr/gsrc/npc/hgrunt_alpha/gr_reload1.wav"}
		end
		self.AnimationTranslations[ACT_IDLE] = ACT_IDLE_RPG
		self.AnimationTranslations[ACT_RANGE_ATTACK1] = ACT_RANGE_ATTACK_SMG1
		self.AnimationTranslations[ACT_WALK] = ACT_WALK_RPG
		self.AnimationTranslations[ACT_RELOAD] = ACT_RELOAD_SMG1
		self.AnimationTranslations[ACT_RUN] = ACT_RUN_RPG
		self.AnimationTranslations[ACT_MELEE_ATTACK1] = ACT_GESTURE_MELEE_ATTACK1
		self.AnimationTranslations[ACT_IDLE_ANGRY] = ACT_IDLE_RPG
		self.AnimationTranslations[ACT_TURN_RIGHT] = ACT_IDLE_RPG
		self.AnimationTranslations[ACT_TURN_LEFT] = ACT_IDLE_RPG
	elseif wepHoldType == "shotgun" then
		if wep:GetClass() == "weapon_vj_hlrze_spas12" then 
			self:SetBodygroup(3, 2)
		end
		self.AnimationTranslations[ACT_IDLE] = ACT_SHOTGUN_IDLE4
		self.AnimationTranslations[ACT_RANGE_ATTACK1] = ACT_RANGE_ATTACK_SHOTGUN
		self.AnimationTranslations[ACT_WALK] = ACT_WALK_AIM_SHOTGUN
		self.AnimationTranslations[ACT_RELOAD] = ACT_RELOAD_SHOTGUN
		self.AnimationTranslations[ACT_RUN] = ACT_RUN_RIFLE
		self.AnimationTranslations[ACT_MELEE_ATTACK1] = ACT_GESTURE_MELEE_ATTACK1
		self.AnimationTranslations[ACT_IDLE_ANGRY] = ACT_SHOTGUN_IDLE4
		self.AnimationTranslations[ACT_TURN_RIGHT] = ACT_SHOTGUN_IDLE4
		self.AnimationTranslations[ACT_TURN_LEFT] = ACT_SHOTGUN_IDLE4
		wep.NPC_HasReloadSound = false
	elseif wepHoldType == "pistol" then
		if wep:GetClass() == "weapon_vj_hlrze_beretta" then
			self:SetBodygroup(3, 1)
		end
		self.AnimationTranslations[ACT_IDLE] = nil
		self.AnimationTranslations[ACT_RANGE_ATTACK1] = nil
		self.AnimationTranslations[ACT_WALK] = ACT_WALK_PISTOL
		self.AnimationTranslations[ACT_RELOAD] = nil
		self.AnimationTranslations[ACT_RUN] = ACT_RUN_PISTOL
		self.AnimationTranslations[ACT_MELEE_ATTACK1] = nil
		self.AnimationTranslations[ACT_IDLE_ANGRY] = ACT_IDLE_PISTOL
		self.AnimationTranslations[ACT_TURN_RIGHT] = nil
		self.AnimationTranslations[ACT_TURN_LEFT] = nil
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
	-- Barnacle animation
	if self:IsEFlagSet(EFL_IS_BEING_LIFTED_BY_BARNACLE) then
		return ACT_BARNACLE_PULL
	-- Scared animations
	elseif !self.VJ_IsBeingControlled && self.Behavior == VJ_BEHAVIOR_PASSIVE && (self:GetNPCState() == NPC_STATE_ALERT or self:GetNPCState() == NPC_STATE_COMBAT) then
		if act == ACT_IDLE then
			return ACT_CROUCHIDLE
		elseif act == ACT_WALK then
			return ACT_WALK_SCARED
		elseif act == ACT_RUN then
			return ACT_RUN_SCARED
		end
	end
	return self.BaseClass.TranslateActivity(self, act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
	//print(key)
	if key == "step" then
		self:PlayFootstepSound()
	elseif key == "tie" then
		self:StopAllSounds()
		VJ.EmitSound(self, {"vj_hlr/gsrc/npc/scientist/weartie.wav","vj_hlr/gsrc/npc/scientist/ties.wav"}, 80, 100)
	elseif key == "draw" then
		self:SetBodygroup(2,1)
	elseif key == "holster" then
		self:SetBodygroup(2,0)
	elseif key == "fire" then
		local wep = self:GetActiveWeapon()
		if IsValid(wep) then
			wep:NPCShoot_Primary()
		end
	elseif key == "shell" then
		VJ.EmitSound(self, {"vj_hlr/gsrc/wep/reload1.wav","vj_hlr/gsrc/wep/reload2.wav","vj_hlr/gsrc/wep/reload3.wav"}, 80, 100)
	elseif key == "cock" then -- and ball torture
		VJ.EmitSound(self, "vj_hlr/gsrc/wep/shotgun/scock1.wav", 80, 100)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SCHEDULE_IDLE_STAND()
	if !self.BaseClass.SCHEDULE_IDLE_STAND(self) then return end
	-- Tie annoyance
	if self.Behavior == VJ_BEHAVIOR_PASSIVE && CurTime() > self.SCI_NextTieAnnoyanceT && self:GetNPCState() <= NPC_STATE_IDLE then
		if math.random(1, 8) == 1 then
			self:PlayAnim(ACT_VM_IDLE, true, false)
		end
		self.SCI_NextTieAnnoyanceT = CurTime() + math.Rand(25, 100)
	end
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMedicBehavior(status, statusData)
	if status == "BeforeHeal" then
		-- Healing animation (3)
		self:PlayAnim("pull_needle", true, false, false, 0, {OnFinish=function(interrupted, anim)
			if interrupted then return end
			self:PlayAnim("give_shot", true, false, false, 0, {OnFinish=function(interrupted2, anim2)
				if interrupted2 then return end
				self:PlayAnim("return_needle", true, false)
			end})
		end})
	elseif status == "OnReset" then
		timer.Simple(1.5, function() if IsValid(self) then self:SetBodygroup(2, 0) end end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
	if self.VJ_IsBeingControlled then return end
	if math.random(1, 2) == 1 && ent.VJ_ID_Headcrab then
		self:PlaySoundSystem("Alert", "vj_hlr/gsrc/npc/scientist/seeheadcrab.wav")
	end
	if self.Behavior == VJ_BEHAVIOR_PASSIVE && math.random(1, 2) == 1 && ent:GetPos():Distance(self:GetPos()) >= 300 then
		self:PlayAnim({"vjseq_eye_wipe", "vjseq_fear1", "vjseq_fear2"}, true, false, true)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
	-- Mouth animation when talking
	if CurTime() < self.SCI_NextMouthMove then
		if self.SCI_NextMouthDistance == 0 then
			self.SCI_NextMouthDistance = math.random(10, 70)
		else
			self.SCI_NextMouthDistance = 0
		end
		self:SetPoseParameter("mouth", self.SCI_NextMouthDistance)
	else
		self:SetPoseParameter("mouth", 0)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateSound(sdData, sdFile)
	self.SCI_NextMouthMove = CurTime() + SoundDuration(sdFile)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HandleGibOnDeath(dmginfo, hitgroup)
	self.HasDeathSounds = false
	if self.HasGibOnDeathEffects == true then
		local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetPos() +self:OBBCenter())
		bloodeffect:SetColor(VJ.Color2Byte(Color(130,19,10)))
		bloodeffect:SetScale(120)
		util.Effect("VJ_Blood1",bloodeffect)
		
		local bloodspray = EffectData()
		bloodspray:SetOrigin(self:GetPos())
		bloodspray:SetScale(8)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(0)
		util.Effect("bloodspray",bloodspray)
		util.Effect("bloodspray",bloodspray)
	end
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/flesh1.mdl",{CollisionDecal="VJ_HLR1_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/flesh2.mdl",{CollisionDecal="VJ_HLR1_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/flesh3.mdl",{CollisionDecal="VJ_HLR1_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/flesh4.mdl",{CollisionDecal="VJ_HLR1_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_b_bone.mdl",{CollisionDecal="VJ_HLR1_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,50))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_b_gib.mdl",{CollisionDecal="VJ_HLR1_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_guts.mdl",{CollisionDecal="VJ_HLR1_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_hmeat.mdl",{CollisionDecal="VJ_HLR1_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_lung.mdl",{CollisionDecal="VJ_HLR1_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_skull.mdl",{CollisionDecal="VJ_HLR1_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,60))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_legbone.mdl",{CollisionDecal="VJ_HLR1_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,15))})
	self:PlaySoundSystem("Gib", "vj_base/gib/splat.wav")
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "Init" then
		self:SetBodygroup(2, 0) -- Remove the needle bodygroup
	elseif status == "DeathAnim" then
		if hitgroup == HITGROUP_HEAD then
			self.AnimTbl_Death = ACT_DIE_HEADSHOT
		elseif hitgroup == HITGROUP_STOMACH then
			self.AnimTbl_Death = ACT_DIE_GUTSHOT
		end
	elseif status == "Finish" then
		self:SetBodygroup(3, 0)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local gibs1 = {"models/vj_hlr/gibs/hgib_b_bone.mdl", "models/vj_hlr/gibs/hgib_b_gib.mdl", "models/vj_hlr/gibs/hgib_guts.mdl", "models/vj_hlr/gibs/hgib_hmeat.mdl","models/vj_hlr/gibs/hgib_lung.mdl","models/vj_hlr/gibs/hgib_skull.mdl","models/vj_hlr/gibs/hgib_legbone.mdl"}
--
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)
	VJ.HLR_ApplyCorpseSystem(self, corpse, gibs1)
end