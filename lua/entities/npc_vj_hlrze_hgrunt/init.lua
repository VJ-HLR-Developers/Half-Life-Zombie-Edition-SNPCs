AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_hlr/hlze/hgrunt.mdl"
ENT.StartHealth = 90
ENT.HullType = HULL_HUMAN
ENT.ControllerParams = {
	ThirdP_Offset = Vector(30, 20, -50),
	FirstP_Bone = "Bip01 Head",
	FirstP_Offset = Vector(5, 0, 5),
}
ENT.CanTurnWhileMoving = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_UNITED_STATES"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_hlr_blood_red"}
ENT.BloodDecal = {"VJ_HLR1_Blood_Red"}
ENT.HasBloodPool = false

-- Melee attack
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDamage = 10
ENT.TimeUntilMeleeAttackDamage = false

-- Grenade attack
ENT.HasGrenadeAttack = true
ENT.GrenadeAttackEntity = "obj_vj_hlr1_grenade"
ENT.AnimTbl_GrenadeAttack = ACT_SPECIAL_ATTACK2
ENT.GrenadeAttackAttachment = "lhand"
ENT.GrenadeAttackThrowTime = 1.3
ENT.GrenadeAttackChance = 2

-- Weapon
ENT.Weapon_IgnoreSpawnMenu = true
ENT.Weapon_Strafe = false
ENT.AnimTbl_WeaponAttackGesture = false
ENT.AnimTbl_WeaponAttackSecondary = ACT_SPECIAL_ATTACK1
ENT.Weapon_SecondaryFireTime = 0.7
ENT.AnimTbl_WeaponReload = ACT_RELOAD_SMG1

ENT.AnimTbl_Medic_GiveHealth = false
ENT.Medic_SpawnPropOnHeal = false
ENT.Medic_TimeUntilHeal = 4

ENT.AnimTbl_DamageAllyResponse = ACT_SIGNAL3
ENT.AnimTbl_CallForHelp = ACT_SIGNAL1
ENT.AnimTbl_TakingCover = ACT_CROUCHIDLE
ENT.DropDeathLoot = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = {ACT_DIEBACKWARD, ACT_DIEFORWARD, ACT_DIE_GUTSHOT, ACT_DIE_HEADSHOT, ACT_DIESIMPLE}
ENT.DeathAnimationTime = 0.8
ENT.DisableFootStepSoundTimer = true

-- Flinching
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH

-- Sounds
ENT.SoundTbl_FootStep = {"vj_hlr/gsrc/pl_step1.wav","vj_hlr/gsrc/pl_step2.wav","vj_hlr/gsrc/pl_step3.wav","vj_hlr/gsrc/pl_step4.wav"}
ENT.SoundTbl_Idle = {"vj_hlr/gsrc/npc/hgrunt/gr_alert1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_idle1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_idle2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_idle3.wav"}
ENT.SoundTbl_IdleDialogue = {"vj_hlr/gsrc/npc/hgrunt/gr_question1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_question2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_question3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_question4.wav", "vj_hlr/gsrc/npc/hgrunt/gr_question5.wav", "vj_hlr/gsrc/npc/hgrunt/gr_question6.wav", "vj_hlr/gsrc/npc/hgrunt/gr_question7.wav", "vj_hlr/gsrc/npc/hgrunt/gr_question8.wav", "vj_hlr/gsrc/npc/hgrunt/gr_question9.wav", "vj_hlr/gsrc/npc/hgrunt/gr_question10.wav", "vj_hlr/gsrc/npc/hgrunt/gr_question11.wav", "vj_hlr/gsrc/npc/hgrunt/gr_question12.wav", "vj_hlr/gsrc/npc/hgrunt/gr_check1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_check2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_check3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_check4.wav", "vj_hlr/gsrc/npc/hgrunt/gr_check5.wav", "vj_hlr/gsrc/npc/hgrunt/gr_check6.wav", "vj_hlr/gsrc/npc/hgrunt/gr_check7.wav", "vj_hlr/gsrc/npc/hgrunt/gr_check8.wav", }
ENT.SoundTbl_IdleDialogueAnswer = {"vj_hlr/gsrc/npc/hgrunt/gr_clear1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_clear2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_clear3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_clear4.wav", "vj_hlr/gsrc/npc/hgrunt/gr_clear5.wav", "vj_hlr/gsrc/npc/hgrunt/gr_clear6.wav", "vj_hlr/gsrc/npc/hgrunt/gr_clear7.wav", "vj_hlr/gsrc/npc/hgrunt/gr_clear8.wav", "vj_hlr/gsrc/npc/hgrunt/gr_clear9.wav", "vj_hlr/gsrc/npc/hgrunt/gr_clear10.wav", "vj_hlr/gsrc/npc/hgrunt/gr_clear11.wav", "vj_hlr/gsrc/npc/hgrunt/gr_clear12.wav", "vj_hlr/gsrc/npc/hgrunt/gr_answer1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_answer2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_answer3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_answer4.wav", "vj_hlr/gsrc/npc/hgrunt/gr_answer5.wav", "vj_hlr/gsrc/npc/hgrunt/gr_answer6.wav", "vj_hlr/gsrc/npc/hgrunt/gr_answer7.wav"}
ENT.SoundTbl_CombatIdle = {"vj_hlr/gsrc/npc/hgrunt/gr_taunt1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_taunt2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_taunt3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_taunt4.wav", "vj_hlr/gsrc/npc/hgrunt/gr_taunt5.wav", "vj_hlr/gsrc/npc/hgrunt/gr_combat1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_combat2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_combat3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_combat4.wav"}
ENT.SoundTbl_ReceiveOrder = {"vj_hlr/gsrc/npc/hgrunt/gr_answer1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_answer2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_answer3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_answer5.wav", "vj_hlr/gsrc/npc/hgrunt/gr_answer7.wav"}
ENT.SoundTbl_Investigate = {"vj_hlr/gsrc/npc/hgrunt/gr_investigate.wav"}
ENT.SoundTbl_Alert = {"vj_hlr/gsrc/npc/hgrunt/gr_alert3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_alert4.wav", "vj_hlr/gsrc/npc/hgrunt/gr_alert6.wav", "vj_hlr/gsrc/npc/hgrunt/gr_alert7.wav", "vj_hlr/gsrc/npc/hgrunt/gr_alert8.wav"}
ENT.SoundTbl_CallForHelp = {"vj_hlr/gsrc/npc/hgrunt/gr_taunt6.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover4.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover7.wav"}
ENT.SoundTbl_WeaponReload = {"vj_hlr/gsrc/npc/hgrunt/gr_cover1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover4.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover5.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover6.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover7.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover8.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover9.wav"}
ENT.SoundTbl_GrenadeAttack = {"vj_hlr/gsrc/npc/hgrunt/gr_throw1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_throw2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_throw3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_throw4.wav"}
ENT.SoundTbl_GrenadeSight = {"vj_hlr/gsrc/npc/hgrunt/gr_cover1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover7.wav", "vj_hlr/gsrc/npc/hgrunt/gr_grenadealert1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_grenadealert2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_grenadealert3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_grenadealert4.wav", "vj_hlr/gsrc/npc/hgrunt/gr_grenadealert5.wav", "vj_hlr/gsrc/npc/hgrunt/gr_grenadealert6.wav"}
ENT.SoundTbl_DangerSight = {"vj_hlr/gsrc/npc/hgrunt/gr_cover1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover7.wav", "vj_hlr/gsrc/npc/hgrunt/gr_grenadealert2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_grenadealert3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_grenadealert4.wav", "vj_hlr/gsrc/npc/hgrunt/gr_grenadealert5.wav", "vj_hlr/gsrc/npc/hgrunt/gr_grenadealert6.wav"}
ENT.SoundTbl_AllyDeath = {"vj_hlr/gsrc/npc/hgrunt/gr_allydeath.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover4.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover7.wav"}
ENT.SoundTbl_Pain = {"vj_hlr/gsrc/npc/hgrunt/gr_pain1.wav","vj_hlr/gsrc/npc/hgrunt/gr_pain2.wav","vj_hlr/gsrc/npc/hgrunt/gr_pain3.wav","vj_hlr/gsrc/npc/hgrunt/gr_pain4.wav","vj_hlr/gsrc/npc/hgrunt/gr_pain5.wav"}
ENT.SoundTbl_Death = {"vj_hlr/gsrc/npc/hgrunt/gr_die1.wav","vj_hlr/gsrc/npc/hgrunt/gr_die2.wav","vj_hlr/gsrc/npc/hgrunt/gr_die3.wav"}

-- Custom
ENT.HECU_Type = 1
ENT.HECU_WepBG = 2 -- The bodygroup that the weapons are in (Ourish e amen modelneroun)
ENT.HECU_LastBodyGroup = 99
ENT.HECU_WillBecomeBloody = false -- Will we use our bloody skin if we are heavily injured?
ENT.HECU_NextMouthMove = 0
ENT.HECU_NextMouthDistance = 0
ENT.HECU_NextStrafeT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(15, 15, 80), Vector(-15, -15, 0))
	
	-- Skin: White or Black
	local randSkin = math.random(0, 3)
	if randSkin < 3 then
		self:SetSkin(0)
	else
		self:SetSkin(1)
	end
	
	-- Bodygroup: Head
	local randHead = math.random(0, 5)
	if randHead == 4 then -- Commander, forces skin to white
		self:SetBodygroup(1, 1)
		self:SetSkin(0)
	elseif randHead == 5 then -- Grenader, forces skin to black
		self:SetBodygroup(1,3)
		self:SetSkin(1)
	end
	
	-- Bodygroup: Weapon
	local randWep = math.random(0, 5)
	if randWep == 4 then
		self:SetBodygroup(2, 1)
		if randHead != 4 then -- Shotgunner, don't swap head if we're a commander
			self:SetBodygroup(1, 2)
		end
	elseif randWep == 5 && randHead < 5 then -- SAW gunner, don't change if we're already a grenader
		self:SetBodygroup(2, 2)
	end
	
	-- 1 in 3 chance that a grunt can be bloody
	if math.random(0, 2) == 2 then
		self.HECU_WillBecomeBloody = true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply, controlEnt)
	ply:ChatPrint("CROUCH: Strafe")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
	if key == "event_emit step" then
		self:PlayFootstepSound()
	elseif key == "event_mattack" then
		self:ExecuteMeleeAttack()
	elseif key == "event_rattack mp5_fire" or key == "event_rattack shotgun_fire" or key == "event_rattack saw_fire" then
		local wep = self:GetActiveWeapon()
		if IsValid(wep) then
			wep:NPCShoot_Primary()
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateSound(SoundData,SoundFile)
	if VJ.HasValue(self.SoundTbl_Breath, SoundFile) then return end
	self.HECU_NextMouthMove = CurTime() + SoundDuration(SoundFile)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
	local curTime = CurTime()
	
	if curTime < self.HECU_NextMouthMove then
		if self.HECU_NextMouthDistance == 0 then
			self.HECU_NextMouthDistance = math.random(10, 90)
		else
			self.HECU_NextMouthDistance = 0
		end
		self:SetPoseParameter("mouth", self.HECU_NextMouthDistance)
	else
		self:SetPoseParameter("mouth", 0)
	end
	
	if self:Health() <= (self:GetMaxHealth() / 2.2) then
		self.AnimationTranslations[ACT_WALK] = ACT_WALK_HURT
		self.AnimationTranslations[ACT_RUN] = ACT_RUN_HURT
		if self.HECU_WillBecomeBloody then self:SetSkin(2) end -- If our spawn randomisation said we should be bloody, then do it
	else
		if self:GetBodygroup(2) != 2 then
			self.AnimationTranslations[ACT_RUN] = ACT_SPRINT
		else
			self.AnimationTranslations[ACT_RUN] = ACT_RUN
		end
		self.AnimationTranslations[ACT_WALK] = ACT_WALK
	end
	
	if IsValid(self:GetEnemy()) && self.WeaponAttackState == VJ.WEP_ATTACK_STATE_FIRE_STAND && !self.VJ_IsBeingControlled && curTime > self.HECU_NextStrafeT && !self:IsMoving() && self:GetPos():Distance(self:GetEnemy():GetPos()) < 1400 then
		self:StopMoving()
		self:PlayAnim({ACT_STRAFE_RIGHT, ACT_STRAFE_LEFT}, true, false, false)
		self.HECU_NextStrafeT = curTime + math.Rand(6, 12)
	end
	
	local bgroup = self:GetBodygroup(2)
	if self.HECU_LastBodyGroup != bgroup then
		self.HECU_LastBodyGroup = bgroup
		if bgroup == 0 then -- M16
			self:DoChangeWeapon("weapon_vj_hlrze_m16")
			self.AnimTbl_WeaponAttack = ACT_RANGE_ATTACK_SMG1
			self.AnimTbl_WeaponAttackCrouch = ACT_RANGE_ATTACK_SMG1_LOW
		elseif bgroup == 1 then -- Shotgun
			self:DoChangeWeapon("weapon_vj_hlrze_spas12")
			self.AnimTbl_WeaponAttack = ACT_RANGE_ATTACK_SHOTGUN
			self.AnimTbl_WeaponAttackCrouch = ACT_RANGE_ATTACK_SHOTGUN_LOW
		elseif bgroup == 2 then -- SAW
			self:DoChangeWeapon("weapon_vj_hlrze_m249")
			self.AnimTbl_WeaponAttack = ACT_RANGE_ATTACK_SMG1
			self.AnimTbl_WeaponAttackCrouch = ACT_RANGE_ATTACK_SMG1_LOW
		end
	end
	
	if self.VJ_IsBeingControlled && self.VJ_TheController:KeyPressed(IN_DUCK) then
		self:PlayAnim({ACT_STRAFE_RIGHT, ACT_STRAFE_LEFT}, true, false, false)
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
	if status == "Finish" then
		self:SetBodygroup(2, 3)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)
	VJ.HLR_ApplyCorpseSystem(self, corpse)
end