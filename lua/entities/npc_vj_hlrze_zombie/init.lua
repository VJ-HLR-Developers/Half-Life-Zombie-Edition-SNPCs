AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_hlr/hlze/zombie.mdl"
ENT.StartHealth = 50
ENT.HullType = HULL_HUMAN
ENT.ControllerParams = {
	ThirdP_Offset = Vector(30, 20, -50),
	FirstP_Bone = "Bip01 Neck",
	FirstP_Offset = Vector(5, 0, 10),
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.BloodColor = VJ.BLOOD_COLOR_YELLOW
ENT.BloodParticle = {"vj_hlr_blood_yellow"}
ENT.BloodDecal = {"VJ_HLR1_Blood_Yellow"}
ENT.HasBloodPool = false
ENT.BringFriendsOnDeath = false
ENT.CallForHelp = false
ENT.CanEat = true

-- Melee attack
ENT.HasMeleeAttack = true
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 50
ENT.MeleeAttackDamageDistance = 80

-- Flinching
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = "vjseq_flinch"
ENT.FlinchHitGroupMap = {
	{HitGroup={HITGROUP_LEFTARM}, Animation={ACT_FLINCH_LEFTARM}},
	{HitGroup={HITGROUP_LEFTLEG}, Animation={ACT_FLINCH_LEFTLEG}},
	{HitGroup={HITGROUP_RIGHTARM}, Animation={ACT_FLINCH_RIGHTARM}},
	{HitGroup={HITGROUP_RIGHTLEG}, Animation={ACT_FLINCH_RIGHTLEG}}
}

ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true
ENT.HasDeathAnimation = true

-- Sounds
ENT.SoundTbl_FootStep = {"vj_hlr/gsrc/pl_step1.wav","vj_hlr/gsrc/pl_step2.wav","vj_hlr/gsrc/pl_step3.wav","vj_hlr/gsrc/pl_step4.wav"}
ENT.SoundTbl_Idle = {"vj_hlr/gsrc/npc/zombie/zo_idle1.wav","vj_hlr/gsrc/npc/zombie/zo_idle2.wav","vj_hlr/gsrc/npc/zombie/zo_idle3.wav","vj_hlr/gsrc/npc/zombie/zo_idle4.wav"}
ENT.SoundTbl_Alert = {"vj_hlr/gsrc/npc/zombie/zo_alert10.wav","vj_hlr/gsrc/npc/zombie/zo_alert20.wav","vj_hlr/gsrc/npc/zombie/zo_alert30.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_hlr/gsrc/npc/zombie/zo_attack1.wav","vj_hlr/gsrc/npc/zombie/zo_attack2.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"vj_hlr/gsrc/npc/zombie/claw_strike1.wav","vj_hlr/gsrc/npc/zombie/claw_strike2.wav","vj_hlr/gsrc/npc/zombie/claw_strike3.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_hlr/gsrc/npc/zombie/claw_miss1.wav","vj_hlr/gsrc/npc/zombie/claw_miss2.wav"}
ENT.SoundTbl_Pain = {"vj_hlr/gsrc/npc/zombie/zo_pain1.wav","vj_hlr/gsrc/npc/zombie/zo_pain2.wav"}
ENT.SoundTbl_Death = {"vj_hlr/gsrc/npc/zombie/zo_pain1.wav","vj_hlr/gsrc/npc/zombie/zo_pain2.wav"}

ENT.MainSoundPitch = 100

-- Custom
ENT.Zombie_Crippled = false
ENT.Zombie_LegHP = ENT.StartHealth / 6
ENT.Zombie_RecoveryHP = 0 -- Threshold it must pass before recovering
ENT.Zombie_NextCrippleRegenT = 0
ENT.IsHEVZombie = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetBodygroup(0, 0)
	self:SetBodygroup(1, 0)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply, controlEnt)
	ply:ChatPrint("JUMP: Detach Headcrab")
	if self.Zombie_CanGrenade then
		ply:ChatPrint("MOUSE2: Arm Grenade")
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Cripple(enable)
	//print("Cripple", enable)
	if enable then
		self.Zombie_Crippled = true
		self.Zombie_RecoveryHP = self:Health() + 20
		self.AnimationTranslations[ACT_IDLE] = ACT_COMBAT_IDLE
		self.AnimationTranslations[ACT_WALK] = VJ.SequenceToActivity(self,"limp_leg_walk")
		self.AnimationTranslations[ACT_RUN] = VJ.SequenceToActivity(self,"limp_leg_run")
		self.AnimationTranslations[ACT_TURN_RIGHT] = ACT_COMBAT_IDLE
		self.AnimationTranslations[ACT_TURN_LEFT] = ACT_COMBAT_IDLE
		self.JumpParams.Enabled = false
		self.CanFlinch = false
		self.CanEat = false
		self:SetHullType(HULL_WIDE_SHORT)
		self:SetCollisionBounds(Vector(14, 14, 20), Vector(-14, -14, 0))
		self:SetSurroundingBounds(Vector(58, 58, 30), Vector(-58, -58, 0))
		self:PlayAnim(ACT_DIESIMPLE, true, false, false)
	else
		self.Zombie_Crippled = false
		self.Zombie_LegHP = 20
		self.AnimationTranslations[ACT_IDLE] = nil
		self.AnimationTranslations[ACT_WALK] = nil
		self.AnimationTranslations[ACT_RUN] = nil
		self.AnimationTranslations[ACT_TURN_RIGHT] = nil
		self.AnimationTranslations[ACT_TURN_LEFT] = nil
		self.JumpParams.Enabled = true
		self.CanFlinch = true
		self.CanEat = true
		self:SetHullType(HULL_HUMAN)
		self:SetCollisionBounds(Vector(18, 18, 66), Vector(-18, -18, 0))
		self:SetSurroundingBounds(Vector(20, 20, 80), Vector(-20, -20, 0))
		self:PlayAnim(ACT_ROLL_LEFT, true, false, false)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
	if self.Zombie_Crippled then
		-- Slowly regenerate health only while crippled
		if CurTime() > self.Zombie_NextCrippleRegenT then
			self:SetHealth(math.Clamp(self:Health() + 5, 1, self:GetMaxHealth()))
			self.Zombie_NextCrippleRegenT = CurTime() + 10
		end
		-- Uncripple only if we surpassed the recovery amount or reached max health (This is to avoid getting crippled and getting back up within the same second)
		local curHP = self:Health()
		if curHP >= self.Zombie_RecoveryHP or curHP == self:GetMaxHealth() then
			self:Cripple(false)
		end
	end
	
	-- NPC Controller headcrab detaching
	if self:Alive() && self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP) then
		self.AnimTbl_Death = ACT_DIE_HEADSHOT
		self:DropHeadcrab()
		self:TakeDamage(self:Health() + 100, self, self)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
	if key == "event_emit step" then
		self:PlayFootstepSound()
	elseif key == "event_mattack right" or key == "event_mattack left" or key == "event_mattack both" then
		self:ExecuteMeleeAttack()
	elseif key == "mattack right" or key == "mattack left" or key == "mattack both" then
		self:ExecuteMeleeAttack()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkAttack(isAttacking, enemy)
	if isAttacking then return end
	if self.Zombie_Crippled then
		if math.random(1, 2) == 1 then
			self.AnimationTranslations[ACT_MELEE_ATTACK1] = ACT_RANGE_ATTACK2
			self.MeleeAttackDamage = 10
		else
			self.AnimationTranslations[ACT_MELEE_ATTACK1] = ACT_RANGE_ATTACK2
			self.MeleeAttackDamage = 20
		end
	else
		if math.random(1, 2) == 1 then
			self.AnimationTranslations[ACT_MELEE_ATTACK1] = ACT_MELEE_ATTACK1
			self.MeleeAttackDamage = 20
		else
			self.AnimationTranslations[ACT_MELEE_ATTACK1] = ACT_MELEE_ATTACK2
			self.MeleeAttackDamage = 40
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local vecZ50 = Vector(0, 0, -50)
--
function ENT:OnEat(status, statusInfo)
	-- The following code is a ideal example based on Half-Life 1 Zombie
	//print(self, "Eating Status: ", status, statusInfo)
	if status == "CheckFood" then
		return (statusInfo.owner.BloodData && statusInfo.owner.BloodData.Color == VJ.BLOOD_COLOR_RED && self:Health() != self:GetMaxHealth()) -- only start eating if the corpse is a human, and we're not at full health - epicplayer
	elseif status == "BeginEating" then
		self.AnimationTranslations[ACT_IDLE] = ACT_GESTURE_RANGE_ATTACK1
		return select(2, self:PlayAnim(ACT_ARM, true, false))
	elseif status == "Eat" then
		VJ.EmitSound(self, "vj_hlr/gsrc/npc/bullchicken/bc_bite"..math.random(1, 3)..".wav", 100) --more accurate to the mod - epicplayer
		-- Health changes
		local food = self.EatingData.Target
		local damage = 15 -- How much damage food will receive
		local foodHP = food:Health() -- Food's health
		self:SetHealth(math.Clamp(self:Health() + ((damage > foodHP and foodHP) or damage), self:Health(), self:GetMaxHealth())) -- Give health to the NPC
		food:SetHealth(foodHP - damage) -- Decrease corpse health
		-- Blood effects
		local bloodData = food.BloodData
		if bloodData then
			local bloodPos = food:GetPos() + food:OBBCenter()
			local bloodParticle = VJ.PICK(bloodData.Particle)
			if bloodParticle then
				ParticleEffect(bloodParticle, bloodPos, self:GetAngles())
			end
			local bloodDecal = VJ.PICK(bloodData.Decal)
			if bloodDecal then
				local tr = util.TraceLine({start = bloodPos, endpos = bloodPos + vecZ50, filter = {food, self}})
				util.Decal(bloodDecal, tr.HitPos + tr.HitNormal + Vector(math.random(-45, 45), math.random(-45, 45), 0), tr.HitPos - tr.HitNormal, food)
			end
		end
		return 1 -- Changed to match the speed of the HLZE mod - epicplayer
	elseif status == "StopEating" then
		if statusInfo != "Dead" && self.EatingData.AnimStatus != "None" then -- Do NOT play anim while dead or has NOT prepared to eat
			return self:PlayAnim(ACT_DISARM, true, false)
		end
	end
	return 0
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnBleed(dmginfo,hitgroup)
	if !self.Zombie_Crippled then
		-- Change movement animations to whichever leg was damaged last
		if hitgroup == HITGROUP_LEFTLEG && !self.IsHEVZombie then
			self.AnimationTranslations[ACT_WALK] = ACT_STRAFE_LEFT
			self.AnimationTranslations[ACT_RUN] = ACT_STRAFE_LEFT
		elseif hitgroup == HITGROUP_RIGHTLEG && !self.IsHEVZombie then
			self.AnimationTranslations[ACT_WALK] = ACT_STRAFE_RIGHT
			self.AnimationTranslations[ACT_RUN] = ACT_STRAFE_RIGHT
		end
		
		-- 1 in 5 chance that headcrab drops when its health is low
		if self:Health() < 10 && self:Health() > 0 && hitgroup != HITGROUP_HEAD && math.random(0, 4) == 0 then
			self.AnimTbl_Death = ACT_DIE_HEADSHOT
			self:DropHeadcrab()
			self:TakeDamage(self:Health() + 100, self, self)
		end
		
		-- If leg health is depleted, then cripple the zombie
		if (hitgroup == HITGROUP_LEFTLEG || hitgroup == HITGROUP_RIGHTLEG) && !self.Zombie_Crippled && !self.IsHEVZombie then
			self.Zombie_LegHP = self.Zombie_LegHP - dmginfo:GetDamage()
			if self.Zombie_LegHP <= 0 then
				self:Cripple(true)
				self.Zombie_NextCrippleRegenT = CurTime() + 10
			end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DropHeadcrab()
	local headcrab = ents.Create("npc_vj_hlrze_headcrab")
	headcrab:SetPos(self:GetPos() + self:GetUp() * 60)
	headcrab:SetAngles(self:GetAngles())
	headcrab:Spawn()
	if self.Zombie_CanGrenade then
		self:SetBodygroup(0, 3)
	end

	if self.IsHEVZombie then
		self:SetBodygroup(1, 1)
	else
		self:SetBodygroup(1, 4)
	end

	if self.VJ_IsBeingControlled then
		local cameramode = self.VJ_TheControllerEntity.VJC_Camera_Mode -- Copy the current camera view
		local ply = self.VJ_TheController
		self.VJ_TheControllerEntity:StopControlling(false)
		
		local ent_controller = ents.Create("obj_vj_controller")
		ent_controller.VJCE_Player = ply
		ent_controller:SetControlledNPC(headcrab)
		ent_controller:Spawn()
		ent_controller:StartControlling()
		timer.Simple(0.01, function()
			ent_controller:SetCameraMode(cameramode)
		end )
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HandleGibOnDeath(dmginfo, hitgroup)
	self.HasDeathSounds = false
	if self.HasGibOnDeathEffects == true then
		local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetPos() +self:OBBCenter())
		bloodeffect:SetColor(VJ.Color2Byte(Color(255,221,35)))
		bloodeffect:SetScale(120)
		util.Effect("VJ_Blood1",bloodeffect)
		
		local bloodspray = EffectData()
		bloodspray:SetOrigin(self:GetPos() +self:OBBCenter())
		bloodspray:SetScale(8)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(1)
		util.Effect("bloodspray",bloodspray)
		util.Effect("bloodspray",bloodspray)
		
		local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos() +self:OBBCenter())
		effectdata:SetScale(1)
		util.Effect("StriderBlood",effectdata)
		util.Effect("StriderBlood",effectdata)
	end
	
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib1.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR1_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib2.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR1_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,20))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib3.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR1_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib4.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR1_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,35))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib5.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR1_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,50))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib6.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR1_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,55))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib7.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR1_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib8.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR1_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib9.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR1_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,25))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib10.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR1_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,15))})
	self:PlaySoundSystem("Gib", "vj_base/gib/splat.wav")
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "DeathAnim" && !self.Zombie_Crippled then
		if hitgroup == HITGROUP_HEAD then
			self.AnimTbl_Death = ACT_DIE_HEADSHOT
		else
			self.AnimTbl_Death = {ACT_DIEBACKWARD, ACT_DIESIMPLE}
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local gibs1 = {"models/vj_hlr/gibs/agib1.mdl", "models/vj_hlr/gibs/agib2.mdl", "models/vj_hlr/gibs/agib3.mdl", "models/vj_hlr/gibs/agib4.mdl","models/vj_hlr/gibs/agib5.mdl","models/vj_hlr/gibs/agib6.mdl","models/vj_hlr/gibs/agib7.mdl","models/vj_hlr/gibs/agib8.mdl","models/vj_hlr/gibs/agib9.mdl","models/vj_hlr/gibs/agib10.mdl"}
--
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)
	VJ.HLR_ApplyCorpseSystem(self, corpse, gibs1)
end