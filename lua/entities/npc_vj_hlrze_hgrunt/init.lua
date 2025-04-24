AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_hlr/hlze/hgrunt.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 90
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = VJ.BLOOD_COLOR_RED -- The blood type, this will determine what it should use (decal, particle, etc.)
ENT.BloodParticle = {"vj_hlr_blood_red"}
ENT.BloodDecal = {"VJ_HLR1_Blood_Red"} -- Decals to spawn when it's damaged
ENT.HasBloodPool = false -- Does it have a blood pool?
ENT.VJ_NPC_Class = {"CLASS_UNITED_STATES"} -- NPCs with the same class with be allied to each other
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1} -- Melee Attack Animations
ENT.MeleeAttackDamage = 10
ENT.TimeUntilMeleeAttackDamage = false -- This counted in seconds | This calculates the time until it hits something
ENT.HasGrenadeAttack = true -- Should the SNPC have a grenade attack?
ENT.GrenadeAttackModel = "models/vj_hlr/weapons/w_grenade.mdl" -- The model for the grenade entity
ENT.AnimTbl_GrenadeAttack = {ACT_SPECIAL_ATTACK2} -- Grenade Attack Animations
ENT.GrenadeAttackAttachment = "lhand" -- The attachment that the grenade will spawn at
ENT.GrenadeAttackThrowTime = 1.3 -- Time until the grenade is released
ENT.GrenadeAttackChance = 1
ENT.Medic_DisableAnimation = true -- if true, it will disable the animation code
ENT.Medic_SpawnPropOnHeal = false -- Should it spawn a prop, such as small health vial at a attachment when healing an ally?
ENT.Medic_TimeUntilHeal = 4 -- Time until the ally receives health | Set to false to let the base decide the time
ENT.Weapon_NoSpawnMenu = true -- If set to true, the NPC weapon setting in the spawnmenu will not be applied for this SNPC
ENT.DisableWeaponFiringGesture = true -- If set to true, it will disable the weapon firing gestures
ENT.Weapon_Strafe = false -- Should it move randomly when shooting?
//ENT.PoseParameterLooking_InvertPitch = true -- Inverts the pitch poseparameters (X)
//ENT.PoseParameterLooking_Names = {pitch={"XR"},yaw={},roll={"ZR"}} -- Custom pose parameters to use, can put as many as needed
ENT.AnimTbl_ShootWhileMovingRun = {ACT_SPRINT} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_ShootWhileMovingWalk = {ACT_SPRINT} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
ENT.DamageAllyResponseAnimation = {ACT_SIGNAL3} -- Animation used if the SNPC does the DamageAllyResponse function
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
ENT.AnimTbl_CallForHelp = {ACT_SIGNAL1} -- Call For Help Animations
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIE_GUTSHOT,ACT_DIE_HEADSHOT,ACT_DIESIMPLE} -- Death Animations
ENT.DeathAnimationTime = 0.8 -- Time until the SNPC spawns its corpse and gets removed
ENT.AnimTbl_TakingCover = {ACT_CROUCHIDLE} -- The animation it plays when hiding in a covered position, leave empty to let the base decide
ENT.AnimTbl_AlertFriendsOnDeath = {"vjseq_idle2"} -- Animations it plays when an ally dies that also has AlertFriendsOnDeath set to true
ENT.DropWeaponOnDeathAttachment = "rhand" -- Which attachment should it use for the weapon's position
ENT.HasLostWeaponSightAnimation = true -- Set to true if you would like the SNPC to play a different animation when it has lost sight of the enemy and can't fire at it
	-- ====== Flinching Code ====== --
ENT.CanFlinch = 1 -- 0 = Don't flinch | 1 = Flinch at any damage | 2 = Flinch only from certain damages
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH} -- If it uses normal based animation, use this

	-- ====== NPC Controller Data ====== --
ENT.ControllerParams = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 20, -50), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(5, 0, 5), -- The offset for the controller when the camera is in first person
	FirstP_ShrinkBone = true, -- Should the bone shrink? Useful if the bone is obscuring the player's view
	FirstP_CameraBoneAng = 0, -- Should the camera's angle be affected by the bone's angle? | 0 = No, 1 = Pitch, 2 = Yaw, 3 = Roll
	FirstP_CameraBoneAng_Offset = 0, -- How much should the camera's angle be rotated by? | Useful for weird bone angles
}

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_hlr/gsrc/pl_step1.wav","vj_hlr/gsrc/pl_step2.wav","vj_hlr/gsrc/pl_step3.wav","vj_hlr/gsrc/pl_step4.wav"}
ENT.SoundTbl_Death = {"vj_hlr/gsrc/npc/hgrunt/gr_die1.wav","vj_hlr/gsrc/npc/hgrunt/gr_die2.wav","vj_hlr/gsrc/npc/hgrunt/gr_die3.wav"}
ENT.SoundTbl_Pain = {"vj_hlr/gsrc/npc/hgrunt/gr_pain1.wav","vj_hlr/gsrc/npc/hgrunt/gr_pain2.wav","vj_hlr/gsrc/npc/hgrunt/gr_pain3.wav","vj_hlr/gsrc/npc/hgrunt/gr_pain4.wav","vj_hlr/gsrc/npc/hgrunt/gr_pain5.wav"}

-- Custom
ENT.HECU_Type = 1
ENT.HECU_WepBG = 2 -- The bodygroup that the weapons are in (Ourish e amen modelneroun)
ENT.HECU_LastBodyGroup = 99
ENT.AnimTbl_WeaponAttackSecondary = {ACT_SPECIAL_ATTACK1} -- Animations played when the SNPC fires a secondary weapon attack
ENT.WeaponAttackSecondaryTimeUntilFire = 1 -- The weapon uses this integer to set the time until the firing code is ran
ENT.HECU_WillBecomeBloody = false -- Will we use our bloody skin if we are heavily injured?

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HECU_OnInit()
	self.HECU_UsingDefaultSounds = true
	self.SoundTbl_Idle = {"vj_hlr/gsrc/npc/hgrunt/gr_alert1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_idle1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_idle2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_idle3.wav"}
	self.SoundTbl_IdleDialogue = {"vj_hlr/gsrc/npc/hgrunt/gr_question1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_question2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_question3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_question4.wav", "vj_hlr/gsrc/npc/hgrunt/gr_question5.wav", "vj_hlr/gsrc/npc/hgrunt/gr_question6.wav", "vj_hlr/gsrc/npc/hgrunt/gr_question7.wav", "vj_hlr/gsrc/npc/hgrunt/gr_question8.wav", "vj_hlr/gsrc/npc/hgrunt/gr_question9.wav", "vj_hlr/gsrc/npc/hgrunt/gr_question10.wav", "vj_hlr/gsrc/npc/hgrunt/gr_question11.wav", "vj_hlr/gsrc/npc/hgrunt/gr_question12.wav", "vj_hlr/gsrc/npc/hgrunt/gr_check1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_check2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_check3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_check4.wav", "vj_hlr/gsrc/npc/hgrunt/gr_check5.wav", "vj_hlr/gsrc/npc/hgrunt/gr_check6.wav", "vj_hlr/gsrc/npc/hgrunt/gr_check7.wav", "vj_hlr/gsrc/npc/hgrunt/gr_check8.wav", }
	self.SoundTbl_IdleDialogueAnswer = {"vj_hlr/gsrc/npc/hgrunt/gr_clear1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_clear2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_clear3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_clear4.wav", "vj_hlr/gsrc/npc/hgrunt/gr_clear5.wav", "vj_hlr/gsrc/npc/hgrunt/gr_clear6.wav", "vj_hlr/gsrc/npc/hgrunt/gr_clear7.wav", "vj_hlr/gsrc/npc/hgrunt/gr_clear8.wav", "vj_hlr/gsrc/npc/hgrunt/gr_clear9.wav", "vj_hlr/gsrc/npc/hgrunt/gr_clear10.wav", "vj_hlr/gsrc/npc/hgrunt/gr_clear11.wav", "vj_hlr/gsrc/npc/hgrunt/gr_clear12.wav", "vj_hlr/gsrc/npc/hgrunt/gr_answer1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_answer2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_answer3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_answer4.wav", "vj_hlr/gsrc/npc/hgrunt/gr_answer5.wav", "vj_hlr/gsrc/npc/hgrunt/gr_answer6.wav", "vj_hlr/gsrc/npc/hgrunt/gr_answer7.wav"}
	self.SoundTbl_CombatIdle = {"vj_hlr/gsrc/npc/hgrunt/gr_taunt1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_taunt2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_taunt3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_taunt4.wav", "vj_hlr/gsrc/npc/hgrunt/gr_taunt5.wav", "vj_hlr/gsrc/npc/hgrunt/gr_combat1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_combat2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_combat3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_combat4.wav"}
	self.SoundTbl_ReceiveOrder = {"vj_hlr/gsrc/npc/hgrunt/gr_answer1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_answer2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_answer3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_answer5.wav", "vj_hlr/gsrc/npc/hgrunt/gr_answer7.wav"}
	self.SoundTbl_Investigate = {"vj_hlr/gsrc/npc/hgrunt/gr_investigate.wav"}
	self.SoundTbl_Alert = {"vj_hlr/gsrc/npc/hgrunt/gr_alert3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_alert4.wav", "vj_hlr/gsrc/npc/hgrunt/gr_alert6.wav", "vj_hlr/gsrc/npc/hgrunt/gr_alert7.wav", "vj_hlr/gsrc/npc/hgrunt/gr_alert8.wav"}
	self.SoundTbl_CallForHelp = {"vj_hlr/gsrc/npc/hgrunt/gr_taunt6.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover4.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover7.wav"}
	self.SoundTbl_WeaponReload = {"vj_hlr/gsrc/npc/hgrunt/gr_cover1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover4.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover5.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover6.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover7.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover8.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover9.wav"}
	self.SoundTbl_GrenadeAttack = {"vj_hlr/gsrc/npc/hgrunt/gr_throw1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_throw2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_throw3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_throw4.wav"}
	self.SoundTbl_GrenadeSight = {"vj_hlr/gsrc/npc/hgrunt/gr_cover1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover7.wav", "vj_hlr/gsrc/npc/hgrunt/gr_grenadealert1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_grenadealert2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_grenadealert3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_grenadealert4.wav", "vj_hlr/gsrc/npc/hgrunt/gr_grenadealert5.wav", "vj_hlr/gsrc/npc/hgrunt/gr_grenadealert6.wav"}
	self.SoundTbl_DangerSight = {"vj_hlr/gsrc/npc/hgrunt/gr_cover1.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover7.wav", "vj_hlr/gsrc/npc/hgrunt/gr_grenadealert2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_grenadealert3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_grenadealert4.wav", "vj_hlr/gsrc/npc/hgrunt/gr_grenadealert5.wav", "vj_hlr/gsrc/npc/hgrunt/gr_grenadealert6.wav"}
	self.SoundTbl_AllyDeath = {"vj_hlr/gsrc/npc/hgrunt/gr_allydeath.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover2.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover3.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover4.wav", "vj_hlr/gsrc/npc/hgrunt/gr_cover7.wav"}
	
	local randomskin = (math.random(0,3))
	if randomskin < 3 then self:SetSkin(0) else self:SetSkin(1) end
	local randhead = math.random(0,5)
	if randhead == 4 then self:SetBodygroup(1,1) self:SetSkin(0) end --commander
	if randhead == 5 then self:SetBodygroup(1,3) self:SetSkin(1) end --grenader
	local randweapon = math.random(0,5)
	if randweapon == 4 then self:SetBodygroup(2,1) if randhead != 4 then self:SetBodygroup(1,2) end end --shotgunner
	if randweapon == 5 && randhead < 5 then self:SetBodygroup(2,2) end --SAW gunner
	
	local randombloody = (math.random(0,2)) --It used to be that all grunts get bloody when hurt, but now it's a random chance determined from spawn
	if randombloody == 2 then self.HECU_WillBecomeBloody = true end
	--self:SetBodygroup(2,math.random(0,2))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(15, 15, 80), Vector(-15, -15, 0))

	self.HECU_NextStrafeT = CurTime()
	self.HECU_NextMouthMove = CurTime()
	self:HECU_OnInit()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateSound(SoundData,SoundFile)
	if VJ.HasValue(self.SoundTbl_Breath, sdFile) then return end
	self.HECU_NextMouthMove = CurTime() + SoundDuration(sdFile)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
	if key == "event_emit step" then
		self:PlayFootstepSound()
	end
	if key == "event_mattack" then
		self:ExecuteMeleeAttack()
	end
	if key == "event_rattack mp5_fire" or key == "event_rattack shotgun_fire" or key == "event_rattack saw_fire" then
		local wep = self:GetActiveWeapon()
		if IsValid(wep) then
			wep:NPCShoot_Primary(ShootPos,ShootDir)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
	if self.HECU_CustomOnThink then self:HECU_OnThink() end
	self:HECU_MouthCode()
	if self:Health() <= (self:GetMaxHealth() / 2.2) then
		self.AnimationTranslations[ACT_WALK] = {ACT_WALK_HURT}
		self.AnimationTranslations[ACT_RUN] = {ACT_RUN_HURT}
		self.AnimTbl_ShootWhileMovingWalk = {ACT_WALK_HURT}
		self.AnimTbl_ShootWhileMovingRun = {ACT_RUN_HURT}
		if self.HECU_WillBecomeBloody then self:SetSkin(2) end --If our spawn randomisation said we should be bloody, then do it 
	else
		if self:GetBodygroup(2) != 2 then
			self.AnimationTranslations[ACT_RUN] = {ACT_SPRINT}
			self.AnimTbl_ShootWhileMovingRun = {ACT_SPRINT}
		else
			self.AnimationTranslations[ACT_RUN] = {ACT_RUN}
			self.AnimTbl_ShootWhileMovingRun = {ACT_RUN}
		end
		self.AnimationTranslations[ACT_WALK] = {ACT_WALK}
		self.AnimTbl_ShootWhileMovingWalk = {ACT_WALK}
	end
	if IsValid(self:GetEnemy()) && self.DoingWeaponAttack_Standing == true && self.VJ_IsBeingControlled == false && CurTime() > self.HECU_NextStrafeT && !self:IsMoving() && self:GetPos():Distance(self:GetEnemy():GetPos()) < 1400 then
		self:StopMoving()
		self:VJ_ACT_PLAYACTIVITY({ACT_STRAFE_RIGHT,ACT_STRAFE_LEFT},true,false,false)
		self.HECU_NextStrafeT = CurTime() +math.Rand(6,12)
	end
	local bgroup = self:GetBodygroup(2)
	if self.HECU_LastBodyGroup != bgroup then
		self.HECU_LastBodyGroup = bgroup
		if bgroup == 0 then -- M16
			self:DoChangeWeapon("weapon_vj_hlrze_m16")
			self.AnimTbl_WeaponAttack = {ACT_RANGE_ATTACK_SMG1}
			self.AnimTbl_WeaponAttackCrouch = {ACT_RANGE_ATTACK_SMG1_LOW}
			self.Weapon_StartingAmmoAmount = 50
		elseif bgroup == 1 then -- Shotgun
			self:DoChangeWeapon("weapon_vj_hlrze_spas12")
			self.AnimTbl_WeaponAttack = {ACT_RANGE_ATTACK_SHOTGUN}
			self.AnimTbl_WeaponAttackCrouch = {ACT_RANGE_ATTACK_SHOTGUN_LOW}
			self.Weapon_StartingAmmoAmount = 8
		elseif bgroup == 2 then -- SAW
			self:DoChangeWeapon("weapon_vj_hlrze_m249")
			-- self.AnimTbl_WeaponAttack = {ACT_RANGE_ATTACK_AR2}
			-- self.AnimTbl_WeaponAttackCrouch = {ACT_RANGE_ATTACK_AR2_LOW}
			-- self.Weapon_StartingAmmoAmount = 50
			self.AnimTbl_WeaponAttack = {ACT_RANGE_ATTACK_SMG1}
			self.AnimTbl_WeaponAttackCrouch = {ACT_RANGE_ATTACK_SMG1_LOW}
			self.Weapon_StartingAmmoAmount = 50
		end
	end
	
	if self.VJ_IsBeingControlled == true && self.VJ_TheController:KeyPressed(IN_DUCK) then
		self:VJ_ACT_PLAYACTIVITY({ACT_STRAFE_RIGHT,ACT_STRAFE_LEFT},true,false,false)
		--print(self.VJ_TheControllerEntity.LastPressedKey)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HECU_MouthCode()
	if CurTime() < self.HECU_NextMouthMove then
		if self.HECU_NextMouthDistance == 0 then
			self.HECU_NextMouthDistance = math.random(10,90)
		else
			self.HECU_NextMouthDistance = 0
		end
		self:SetPoseParameter("mouth",self.HECU_NextMouthDistance)
	else
		self:SetPoseParameter("mouth",0)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HandleGibOnDeath(dmginfo,hitgroup)
	self.HasDeathSounds = false
	if self.CanGibOnDeathEffects == true then
		local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetPos() +self:OBBCenter())
		bloodeffect:SetColor(VJ_Color2Byte(Color(130,19,10)))
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
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/flesh1.mdl",{BloodDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/flesh2.mdl",{BloodDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/flesh3.mdl",{BloodDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/flesh4.mdl",{BloodDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_b_bone.mdl",{BloodDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,50))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_b_gib.mdl",{BloodDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_guts.mdl",{BloodDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_hmeat.mdl",{BloodDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_lung.mdl",{BloodDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_skull.mdl",{BloodDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,60))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/hgib_legbone.mdl",{BloodDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,15))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/gib_hgrunt.mdl",{BloodDecal="VJ_HLR_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,15))})
	self:PlaySoundSystem("Gib", "vj_base/gib/splat.wav")
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if hitgroup == 3 then
		dmginfo:ScaleDamage(0.5)
		--VJ_EmitSound(self,"vj_hlr/fx/ric" .. math.random(1,5) .. ".wav",88,100)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_BeforeCorpseSpawned(dmginfo,hitgroup)
	self:SetBodygroup(2,3)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_IntMsg(ply)
	ply:ChatPrint("CROUCH: Strafe")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpseEnt)
	VJ.HLR_ApplyCorpseSystem(self, corpseEnt)
end