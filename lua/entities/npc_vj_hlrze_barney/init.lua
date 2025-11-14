AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_hlr/hlze/barney.mdl"
ENT.StartHealth = 90
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
ENT.HasMeleeAttack = true

-- Weapon
//ENT.Weapon_IgnoreSpawnMenu = true
ENT.DisableWeaponFiringGesture = true
ENT.AnimTbl_WeaponAttackGesture = false
ENT.Weapon_Strafe = false

ENT.AnimTbl_CallForHelp = false
ENT.AnimTbl_TakingCover = "cover_stand"
ENT.BecomeEnemyToPlayer = true
ENT.DropDeathLoot = false
ENT.HasOnPlayerSight = true
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = {ACT_DIEBACKWARD, ACT_DIEFORWARD, ACT_DIE_GUTSHOT, ACT_DIE_HEADSHOT, ACT_DIESIMPLE}
ENT.DisableFootStepSoundTimer = true

-- Flinching
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.FlinchHitGroupMap = {{HitGroup = {HITGROUP_LEFTARM}, Animation = {ACT_FLINCH_LEFTARM}}, {HitGroup = {HITGROUP_RIGHTARM}, Animation = {ACT_FLINCH_RIGHTARM}}, {HitGroup = {HITGROUP_LEFTLEG}, Animation = {ACT_FLINCH_LEFTLEG}}, {HitGroup = {HITGROUP_RIGHTLEG}, Animation = {ACT_FLINCH_RIGHTLEG}}}

-- Sounds
ENT.SoundTbl_FootStep = {"vj_hlr/gsrc/pl_step1.wav","vj_hlr/gsrc/pl_step2.wav","vj_hlr/gsrc/pl_step3.wav","vj_hlr/gsrc/pl_step4.wav"}
ENT.SoundTbl_Idle = {"vj_hlr/gsrc/npc/barney/whatisthat.wav","vj_hlr/gsrc/npc/barney/somethingstinky.wav","vj_hlr/gsrc/npc/barney/somethingdied.wav","vj_hlr/gsrc/npc/barney/guyresponsible.wav","vj_hlr/gsrc/npc/barney/coldone.wav","vj_hlr/gsrc/npc/barney/ba_gethev.wav","vj_hlr/gsrc/npc/barney/badfeeling.wav","vj_hlr/gsrc/npc/barney/bigmess.wav","vj_hlr/gsrc/npc/barney/bigplace.wav"}
ENT.SoundTbl_IdleDialogue = {"vj_hlr/gsrc/npc/barney/youeverseen.wav","vj_hlr/gsrc/npc/barney/workingonstuff.wav","vj_hlr/gsrc/npc/barney/whatsgoingon.wav","vj_hlr/gsrc/npc/barney/thinking.wav","vj_hlr/gsrc/npc/barney/survive.wav","vj_hlr/gsrc/npc/barney/stench.wav","vj_hlr/gsrc/npc/barney/somethingmoves.wav","vj_hlr/gsrc/npc/barney/of1a5_ba01.wav","vj_hlr/gsrc/npc/barney/nodrill.wav","vj_hlr/gsrc/npc/barney/missingleg.wav","vj_hlr/gsrc/npc/barney/luckwillturn.wav","vj_hlr/gsrc/npc/barney/gladof38.wav","vj_hlr/gsrc/npc/barney/gettingcloser.wav","vj_hlr/gsrc/npc/barney/crewdied.wav","vj_hlr/gsrc/npc/barney/ba_idle0.wav","vj_hlr/gsrc/npc/barney/badarea.wav","vj_hlr/gsrc/npc/barney/beertopside.wav"}
ENT.SoundTbl_IdleDialogueAnswer = {"vj_hlr/gsrc/npc/barney/yup.wav","vj_hlr/gsrc/npc/barney/youtalkmuch.wav","vj_hlr/gsrc/npc/barney/yougotit.wav","vj_hlr/gsrc/npc/barney/youbet.wav","vj_hlr/gsrc/npc/barney/yessir.wav","vj_hlr/gsrc/npc/barney/soundsright.wav","vj_hlr/gsrc/npc/barney/noway.wav","vj_hlr/gsrc/npc/barney/nope.wav","vj_hlr/gsrc/npc/barney/nosir.wav","vj_hlr/gsrc/npc/barney/notelling.wav","vj_hlr/gsrc/npc/barney/maybe.wav","vj_hlr/gsrc/npc/barney/justdontknow.wav","vj_hlr/gsrc/npc/barney/ireckon.wav","vj_hlr/gsrc/npc/barney/iguess.wav","vj_hlr/gsrc/npc/barney/icanhear.wav","vj_hlr/gsrc/npc/barney/guyresponsible.wav","vj_hlr/gsrc/npc/barney/dontreckon.wav","vj_hlr/gsrc/npc/barney/dontguess.wav","vj_hlr/gsrc/npc/barney/dontfigure.wav","vj_hlr/gsrc/npc/barney/dontbuyit.wav","vj_hlr/gsrc/npc/barney/dontbet.wav","vj_hlr/gsrc/npc/barney/dontaskme.wav","vj_hlr/gsrc/npc/barney/cantfigure.wav","vj_hlr/gsrc/npc/barney/bequiet.wav","vj_hlr/gsrc/npc/barney/ba_stare0.wav","vj_hlr/gsrc/npc/barney/alreadyasked.wav"}
ENT.SoundTbl_CombatIdle = {"vj_hlr/gsrc/npc/barney/whatgood.wav","vj_hlr/gsrc/npc/barney/targetpractice.wav","vj_hlr/gsrc/npc/barney/easily.wav","vj_hlr/gsrc/npc/barney/getanyworse.wav"}
ENT.SoundTbl_FollowPlayer = {"vj_hlr/gsrc/npc/barney/yougotit.wav","vj_hlr/gsrc/npc/barney/wayout.wav","vj_hlr/gsrc/npc/barney/teamup1.wav","vj_hlr/gsrc/npc/barney/teamup2.wav","vj_hlr/gsrc/npc/barney/rightway.wav","vj_hlr/gsrc/npc/barney/letsgo.wav","vj_hlr/gsrc/npc/barney/letsmoveit.wav","vj_hlr/gsrc/npc/barney/imwithyou.wav","vj_hlr/gsrc/npc/barney/gladtolendhand.wav","vj_hlr/gsrc/npc/barney/dobettertogether.wav","vj_hlr/gsrc/npc/barney/c1a2_ba_goforit.wav","vj_hlr/gsrc/npc/barney/ba_ok1.wav","vj_hlr/gsrc/npc/barney/ba_ok2.wav","vj_hlr/gsrc/npc/barney/ba_ok3.wav","vj_hlr/gsrc/npc/barney/ba_idle1.wav","vj_hlr/gsrc/npc/barney/ba_ht06_11.wav"}
ENT.SoundTbl_UnFollowPlayer = {"vj_hlr/gsrc/npc/barney/waitin.wav","vj_hlr/gsrc/npc/barney/stop2.wav","vj_hlr/gsrc/npc/barney/standguard.wav","vj_hlr/gsrc/npc/barney/slowingyoudown.wav","vj_hlr/gsrc/npc/barney/seeya.wav","vj_hlr/gsrc/npc/barney/iwaithere.wav","vj_hlr/gsrc/npc/barney/illwait.wav","vj_hlr/gsrc/npc/barney/helpothers.wav","vj_hlr/gsrc/npc/barney/ba_wait1.wav","vj_hlr/gsrc/npc/barney/ba_wait2.wav","vj_hlr/gsrc/npc/barney/ba_wait3.wav","vj_hlr/gsrc/npc/barney/ba_wait4.wav","vj_hlr/gsrc/npc/barney/ba_security2_pass.wav","vj_hlr/gsrc/npc/barney/aintgoin.wav","vj_hlr/gsrc/npc/barney/ba_becareful1.wav"}
ENT.SoundTbl_OnPlayerSight = {"vj_hlr/gsrc/npc/barney/mrfreeman.wav","vj_hlr/gsrc/npc/barney/howyoudoing.wav","vj_hlr/gsrc/npc/barney/howdy.wav","vj_hlr/gsrc/npc/barney/heybuddy.wav","vj_hlr/gsrc/npc/barney/heyfella.wav","vj_hlr/gsrc/npc/barney/hellonicesuit.wav","vj_hlr/gsrc/npc/barney/ba_stare1.wav","vj_hlr/gsrc/npc/barney/ba_later.wav","vj_hlr/gsrc/npc/barney/ba_idle4.wav","vj_hlr/gsrc/npc/barney/ba_idle3.wav","vj_hlr/gsrc/npc/barney/ba_ok4.wav","vj_hlr/gsrc/npc/barney/ba_ok5.wav","vj_hlr/gsrc/npc/barney/ba_ht06_03.wav","vj_hlr/gsrc/npc/barney/ba_ht06_03_alt.wav","vj_hlr/gsrc/npc/barney/ba_hello0.wav","vj_hlr/gsrc/npc/barney/ba_hello1.wav","vj_hlr/gsrc/npc/barney/ba_hello2.wav","vj_hlr/gsrc/npc/barney/ba_hello3.wav","vj_hlr/gsrc/npc/barney/ba_hello4.wav","vj_hlr/gsrc/npc/barney/ba_hello5.wav","vj_hlr/gsrc/npc/barney/armedforces.wav"}
ENT.SoundTbl_Investigate = {"vj_hlr/gsrc/npc/barney/youhearthat.wav","vj_hlr/gsrc/npc/barney/soundsbad.wav","vj_hlr/gsrc/npc/barney/icanhear.wav","vj_hlr/gsrc/npc/barney/hearsomething2.wav","vj_hlr/gsrc/npc/barney/hearsomething.wav","vj_hlr/gsrc/npc/barney/ambush.wav","vj_hlr/gsrc/npc/barney/ba_generic0.wav"}
ENT.SoundTbl_Alert = {"vj_hlr/gsrc/npc/barney/ba_openfire.wav","vj_hlr/gsrc/npc/barney/ba_attack1.wav","vj_hlr/gsrc/npc/barney/aimforhead.wav"}
//ENT.SoundTbl_CallForHelp = {"vj_hlr/gsrc/npc/barney/ba_needhelp0.wav","vj_hlr/gsrc/npc/barney/ba_needhelp1.wav"}
ENT.SoundTbl_BecomeEnemyToPlayer = {"vj_hlr/gsrc/npc/barney/ba_uwish.wav","vj_hlr/gsrc/npc/barney/ba_tomb.wav","vj_hlr/gsrc/npc/barney/ba_somuch.wav","vj_hlr/gsrc/npc/barney/ba_mad3.wav","vj_hlr/gsrc/npc/barney/ba_iwish.wav","vj_hlr/gsrc/npc/barney/ba_endline.wav","vj_hlr/gsrc/npc/barney/aintscared.wav"}
ENT.SoundTbl_Suppressing = {"vj_hlr/gsrc/npc/barney/c1a4_ba_octo2.wav","vj_hlr/gsrc/npc/barney/c1a4_ba_octo4.wav","vj_hlr/gsrc/npc/barney/c1a4_ba_octo3.wav","vj_hlr/gsrc/npc/barney/ba_generic1.wav","vj_hlr/gsrc/npc/barney/ba_bring.wav","vj_hlr/gsrc/npc/barney/ba_attacking1.wav"}
ENT.SoundTbl_GrenadeSight = {"vj_hlr/gsrc/npc/barney/standback.wav","vj_hlr/gsrc/npc/barney/ba_heeey.wav"}
ENT.SoundTbl_KilledEnemy = {"vj_hlr/gsrc/npc/barney/soundsbad.wav","vj_hlr/gsrc/npc/barney/ba_seethat.wav","vj_hlr/gsrc/npc/barney/ba_kill0.wav","vj_hlr/gsrc/npc/barney/ba_gotone.wav","vj_hlr/gsrc/npc/barney/ba_firepl.wav","vj_hlr/gsrc/npc/barney/ba_buttugly.wav","vj_hlr/gsrc/npc/barney/ba_another.wav","vj_hlr/gsrc/npc/barney/ba_close.wav"}
ENT.SoundTbl_AllyDeath = {"vj_hlr/gsrc/npc/barney/die.wav"}
ENT.SoundTbl_Pain = {"vj_hlr/gsrc/npc/barney/imhit.wav","vj_hlr/gsrc/npc/barney/hitbad.wav","vj_hlr/gsrc/npc/barney/c1a2_ba_4zomb.wav","vj_hlr/gsrc/npc/barney/ba_pain1.wav","vj_hlr/gsrc/npc/barney/ba_pain2.wav","vj_hlr/gsrc/npc/barney/ba_pain3.wav"}
ENT.SoundTbl_DamageByPlayer = {"vj_hlr/gsrc/npc/barney/donthurtem.wav","vj_hlr/gsrc/npc/barney/ba_whoathere.wav","vj_hlr/gsrc/npc/barney/ba_whatyou.wav","vj_hlr/gsrc/npc/barney/ba_watchit.wav","vj_hlr/gsrc/npc/barney/ba_shot1.wav","vj_hlr/gsrc/npc/barney/ba_shot2.wav","vj_hlr/gsrc/npc/barney/ba_shot3.wav","vj_hlr/gsrc/npc/barney/ba_shot4.wav","vj_hlr/gsrc/npc/barney/ba_shot5.wav","vj_hlr/gsrc/npc/barney/ba_shot6.wav","vj_hlr/gsrc/npc/barney/ba_shot7.wav","vj_hlr/gsrc/npc/barney/ba_stepoff.wav","vj_hlr/gsrc/npc/barney/ba_pissme.wav","vj_hlr/gsrc/npc/barney/ba_mad1.wav","vj_hlr/gsrc/npc/barney/ba_mad0.wav","vj_hlr/gsrc/npc/barney/ba_friends.wav","vj_hlr/gsrc/npc/barney/ba_dotoyou.wav","vj_hlr/gsrc/npc/barney/ba_dontmake.wav","vj_hlr/gsrc/npc/barney/ba_crazy.wav"}
ENT.SoundTbl_Death = {"vj_hlr/gsrc/npc/barney/ba_ht06_02_alt.wav","vj_hlr/gsrc/npc/barney/ba_ht06_02.wav","vj_hlr/gsrc/npc/barney/ba_die1.wav","vj_hlr/gsrc/npc/barney/ba_die2.wav","vj_hlr/gsrc/npc/barney/ba_die3.wav"}

ENT.MainSoundPitch = 100

-- Custom
ENT.Security_NextMouthMove = 0
ENT.Security_NextMouthDistance = 0
ENT.Security_WepIsBeretta = false
---------------------------------------------------------------------------------------------------------------------------------------------
local defaultWeapons = {
	"weapon_vj_hlrze_beretta",
	"weapon_vj_hlrze_beretta",
	"weapon_vj_hlrze_spas12",
	"weapon_vj_hlrze_m16",
}
--
function ENT:Init()
	//self:SetBodygroup(1, 0)
	local wepOverride = GetConVar("gmod_npcweapon"):GetString()
	if wepOverride != "none" then
		timer.Simple(0.12, function()
			if IsValid(self) then
				local wep = self:GetActiveWeapon()
				if !IsValid(wep) then
					self:DoChangeWeapon(VJ.PICK(defaultWeapons))
				end
			end
		end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
	if key == "step" then
		self:PlayFootstepSound()
	elseif key == "fire" then
		local wep = self:GetActiveWeapon()
		if IsValid(wep) then
			wep:NPCShoot_Primary()
		end
	elseif key == "shell" then
		VJ.EmitSound(self, {"vj_hlr/gsrc/wep/reload1.wav", "vj_hlr/gsrc/wep/reload2.wav", "vj_hlr/gsrc/wep/reload3.wav"}, 80, 100)
	elseif key == "cock" then -- and ball torture (Unused)
		VJ.EmitSound(self, "vj_hlr/gsrc/wep/shotgun/scock1.wav", 80, 100)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetAnimationTranslations(wepHoldType)
	local wep = self:GetActiveWeapon()
	if !IsValid(wep) then self.Security_WepIsBeretta = false return end
	
	if wepHoldType == "smg" or wepHoldType == "ar2" then
		if wep:GetClass() == "weapon_vj_hlrze_m16" then
			self:SetBodygroup(1, 3)
			wep.NPC_ReloadSound = {"vj_hlr/gsrc/npc/hgrunt_alpha/gr_reload1.wav"}
		end
		self.AnimationTranslations[ACT_IDLE] = ACT_IDLE_RPG
		self.AnimationTranslations[ACT_RANGE_ATTACK1] = ACT_CROUCHIDLE
		self.AnimationTranslations[ACT_WALK] = ACT_WALK_RPG
		self.AnimationTranslations[ACT_RELOAD] = ACT_RELOAD_SMG1
		self.AnimationTranslations[ACT_RUN] = ACT_RUN_RPG
		self.AnimationTranslations[ACT_MELEE_ATTACK1] = ACT_GESTURE_MELEE_ATTACK1
		self.AnimationTranslations[ACT_IDLE_ANGRY] = ACT_IDLE_RPG
		self.AnimationTranslations[ACT_TURN_RIGHT] = ACT_IDLE_RPG
		self.AnimationTranslations[ACT_TURN_LEFT] = ACT_IDLE_RPG
	elseif wepHoldType == "shotgun" then
		if wep:GetClass() == "weapon_vj_hlrze_spas12" then
			self:SetBodygroup(1, 4)
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
	elseif (wepHoldType == "pistol" or wepHoldType == "357") && wep:GetClass() != "weapon_vj_hlrze_beretta" then
		self:SetBodygroup(1, 2)
	end
	
	if wep:GetClass() == "weapon_vj_hlrze_beretta" then
		self.Security_WepIsBeretta = true
	else
		self.Security_WepIsBeretta = false
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
	-- Mouth movement
	if CurTime() < self.Security_NextMouthMove then
		if self.Security_NextMouthDistance == 0 then
			self.Security_NextMouthDistance = math.random(10, 70)
		else
			self.Security_NextMouthDistance = 0
		end
		self:SetPoseParameter("mouth", self.Security_NextMouthDistance)
	else
		self:SetPoseParameter("mouth", 0)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Security_HolsterGun()
	if self:GetBodygroup(1) != 0 then self:PlayAnim(ACT_DISARM, true, false, true) end
	self:SetWeaponState(VJ.WEP_STATE_HOLSTERED)
	timer.Simple(1.5, function()
		-- Set the holster bodygroup if we have NOT been interrupted
		if IsValid(self) && self:GetWeaponState() == VJ.WEP_STATE_HOLSTERED then
			self:SetBodygroup(1, 0)
		end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Security_UnHolsterGun()
	self:StopMoving()
	self:PlayAnim(ACT_ARM, true, false, true)
	self:SetWeaponState()
	timer.Simple(0.55, function() if IsValid(self) then self:SetBodygroup(1, 1) end end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
	if self.VJ_IsBeingControlled or self.Dead or !self.Security_WepIsBeretta or self:IsBusy("Activities") then return end
	-- Unholster the weapon if we are alerted and have NOT unholstered the weapon
	if self:GetNPCState() == NPC_STATE_ALERT or self:GetNPCState() == NPC_STATE_COMBAT then
		if self:GetWeaponState() == VJ.WEP_STATE_HOLSTERED then
			self:Security_UnHolsterGun()
		end
	-- Holster the weapon if we are idling and its been a bit since we saw an enemy
	elseif self:GetWeaponState() == VJ.WEP_STATE_READY && (CurTime() - self.EnemyData.TimeSet) > 5 then
		self:Security_HolsterGun()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateSound(sdData, sdFile)
	self.Security_NextMouthMove = CurTime() + SoundDuration(sdFile)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
	if self.VJ_IsBeingControlled == true then return end
	
	if math.random(1, 2) == 1 then
		if ent:GetClass() == "npc_vj_hlr1_bullsquid" then
			self:PlaySoundSystem("Alert", "vj_hlr/gsrc/npc/barney/c1a4_ba_octo1.wav")
		elseif ent.IsVJBaseSNPC_Creature then
			self:PlaySoundSystem("Alert", "vj_hlr/gsrc/npc/barney/diebloodsucker.wav")
		end
	end
	
	if self:GetWeaponState() == VJ.WEP_STATE_HOLSTERED then
		self:Security_UnHolsterGun()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local vec = Vector(0, 0, 0)
--
function ENT:OnDamaged(dmginfo, hitgroup, status)
	-- Make a metal effect when the helmet is hit!
	if status == "Init" && hitgroup == HITGROUP_GEAR && dmginfo:GetDamagePosition() != vec then
		dmginfo:ScaleDamage(0.5)
		local rico = EffectData()
		rico:SetOrigin(dmginfo:GetDamagePosition())
		rico:SetScale(4) -- Size
		rico:SetMagnitude(2) -- Effect type | 1 = Animated | 2 = Basic
		util.Effect("VJ_HLR_Rico", rico)
	end
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
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/flesh1.mdl",{CollisionDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/flesh2.mdl",{CollisionDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/flesh3.mdl",{CollisionDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/flesh4.mdl",{CollisionDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_b_bone.mdl",{CollisionDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,50))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_b_gib.mdl",{CollisionDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_guts.mdl",{CollisionDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_hmeat.mdl",{CollisionDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_lung.mdl",{CollisionDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_skull.mdl",{CollisionDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,60))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_legbone.mdl",{CollisionDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,15))})
	self:PlaySoundSystem("Gib", "vj_base/gib/splat.wav")
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "Finish" then
		self:SetBodygroup(1, 2)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)
	VJ.HLR_ApplyCorpseSystem(self, corpse)
end