AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_hlr/hlze/zombie.mdl"}
ENT.StartHealth = 50
ENT.HullType = HULL_HUMAN
ENT.CanReceiveOrders = true
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = VJ.BLOOD_COLOR_YELLOW
ENT.BloodParticle = {"vj_hlr_blood_yellow"}
ENT.BloodDecal = {"VJ_HLR1_Blood_Yellow"}
ENT.HasBloodPool = false
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}

ENT.HasMeleeAttack = true
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 50 -- How close does it have to be until it attacks?
ENT.MeleeAttackDamageDistance = 80 -- How far does the damage go?
ENT.DisableLeapAttackAnimation = true -- if true, it will disable the animation code
ENT.LeapAttackUseCustomVelocity = true -- Should it disable the default velocity system?

ENT.BringFriendsOnDeath = false
ENT.CallForHelp = false

ENT.HasExtraMeleeAttackSounds = true -- Set to true to use the extra melee attack sounds
ENT.DisableFootStepSoundTimer = true
-- ENT.AnimTbl_Run = {ACT_WALK} -- Set the running animations | Put multiple to let the base pick a random animation when it moves
ENT.AnimTbl_Run = {ACT_RUN,ACT_WALK} -- Set the running animations | Put multiple to let the base pick a random animation when it moves
ENT.HasDeathAnimation = true

-- Flinching
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = "vjseq_flinch"
ENT.FlinchHitGroupMap = {
	{HitGroup={HITGROUP_LEFTARM},IsSchedule=false,Animation={ACT_FLINCH_LEFTARM}},
	{HitGroup={HITGROUP_LEFTLEG},IsSchedule=false,Animation={ACT_FLINCH_LEFTLEG}},
	{HitGroup={HITGROUP_RIGHTARM},IsSchedule=false,Animation={ACT_FLINCH_RIGHTARM}},
	{HitGroup={HITGROUP_RIGHTLEG},IsSchedule=false,Animation={ACT_FLINCH_RIGHTLEG}}
} -- if "IsSchedule" is set to true, "Animation" needs to be a schedule

	-- ====== Velocity Variables ====== --
ENT.LeapAttackVelocityForward = 0 -- How much forward force should it apply?
ENT.LeapAttackVelocityUp = 0 -- How much upward force should it apply?

	-- ====== Eating Variables ====== --
ENT.CanEat = true -- Should it search and eat organic stuff when idle?

	-- ====== NPC Controller Data ====== --
ENT.ControllerParams = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 20, -50),
	FirstP_Bone = "Bip01 Neck",
	FirstP_Offset = Vector(5, 0, 10),
	FirstP_ShrinkBone = true, -- Should the bone shrink? Useful if the bone is obscuring the player's view
	FirstP_CameraBoneAng = 0, -- Should the camera's angle be affected by the bone's angle? | 0 = No, 1 = Pitch, 2 = Yaw, 3 = Roll
	FirstP_CameraBoneAng_Offset = 0, -- How much should the camera's angle be rotated by? | Useful for weird bone angles
}

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
ENT.BodyGroups = {
	[0] = 0,
	[1] = 0,
}
ENT.Crippled = false
ENT.LegHealth = ENT.StartHealth /6
ENT.NextRegenT = CurTime()
ENT.IsHEVZombie = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetBodygroup(0,self.BodyGroups[0])
	self:SetBodygroup(1,self.BodyGroups[1])
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Cripple(crip)
	self.Crippled = crip
	if crip then
		self:PlayAnim(ACT_DIESIMPLE,true,false,false)
		self:SetHullType(HULL_WIDE_SHORT)
		self:SetCollisionBounds(Vector(14,14,20),Vector(-14,-14,0))
		self:SetSurroundingBounds(Vector(58,58,30),Vector(-58,-58,0))
		self.AnimationTranslations[ACT_IDLE] = {ACT_COMBAT_IDLE}
		self.AnimationTranslations[ACT_WALK] = {VJ.SequenceToActivity(self,"limp_leg_walk")}
		self.AnimationTranslations[ACT_RUN] = {VJ.SequenceToActivity(self,"limp_leg_run")}
		self.AnimationTranslations[ACT_TURN_RIGHT] 							= ACT_COMBAT_IDLE
		self.AnimationTranslations[ACT_TURN_LEFT] 							= ACT_COMBAT_IDLE
		self.CanFlinch = false
		self.JumpParams.MaxRise = VJ.SET(0,0)
		self.CanEat = false
	else
		self.LegHealth = 20
		self:PlayAnim(ACT_ROLL_LEFT,true,false,false)
		self:SetHullType(HULL_HUMAN)
		self:SetCollisionBounds(Vector(18,18,66),Vector(-18,-18,0))
		self:SetSurroundingBounds(Vector(20,20,80),Vector(-20,-20,0))
		self.AnimationTranslations[ACT_IDLE] = {ACT_IDLE}
		self.AnimationTranslations[ACT_WALK] = {ACT_WALK}
		self.AnimationTranslations[ACT_RUN] = {ACT_RUN}
		self.AnimationTranslations[ACT_TURN_RIGHT] 							= ACT_TURN_RIGHT
		self.AnimationTranslations[ACT_TURN_LEFT] 							= ACT_TURN_LEFT
		self.CanFlinch = true
		self.JumpParams.MaxRise = VJ.SET(400,550)
		self.CanEat = true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
	if self.Crippled && CurTime() > self.NextRegenT then
		self:SetHealth(math.Clamp(self:Health() +5,1,self:GetMaxHealth()))
		self.NextRegenT = CurTime() +10
	end
	if self.Crippled && self:Health() > self:GetMaxHealth() *0.65 then
		self:Cripple(false)
	end
	--Players detaching headcrabs is now done here instead of in leap attack
	if (self:Alive() && self.VJ_IsBeingControlled == true && self.VJ_TheController:KeyDown(IN_JUMP)) then
		self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
		self:Dropheadcrab()
		self:TakeDamage(self:Health() + 100,self,self)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
	if key == "event_emit step" then
		self:PlayFootstepSound()
	end
	if key == "event_mattack right" or key == "event_mattack left" or key == "event_mattack both" then
		self:ExecuteMeleeAttack()
	end
	if key == "mattack right" or key == "mattack left" or key == "mattack both" then
		self:ExecuteMeleeAttack()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	if self.Crippled then
		if math.random(1,2) == 1 then
			self.AnimationTranslations[ACT_MELEE_ATTACK1] = {ACT_RANGE_ATTACK2}
			self.MeleeAttackDamage = 10
		else
			self.AnimationTranslations[ACT_MELEE_ATTACK1] = {ACT_RANGE_ATTACK2}
			self.MeleeAttackDamage = 20
		end
	else
		if math.random(1,2) == 1 then
			self.AnimationTranslations[ACT_MELEE_ATTACK1] = {ACT_MELEE_ATTACK1}
			self.MeleeAttackDamage = 20
		else
			self.AnimationTranslations[ACT_MELEE_ATTACK1] = {ACT_MELEE_ATTACK2}
			self.MeleeAttackDamage = 40
		end
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
	
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib1.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib2.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,20))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib3.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib4.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,35))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib5.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,50))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib6.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,55))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib7.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib8.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib9.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,25))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib10.mdl",{BloodType="Yellow",CollisionDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,15))})
	self:PlaySoundSystem("Gib", "vj_base/gib/splat.wav")
	return true -- Return to true if it gibbed!
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "DeathAnim" then
		if self.Crippled then return end
		if hitgroup == HITGROUP_HEAD then
			self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
		else
			self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIESIMPLE}
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnBleed(dmginfo,hitgroup)
	if !self.Crippled then
		if hitgroup == 6 && !self.IsHEVZombie then
			self.AnimationTranslations[ACT_WALK] = {ACT_STRAFE_LEFT}
			self.AnimationTranslations[ACT_RUN] = {ACT_STRAFE_LEFT}
		end
		if hitgroup == 7 && !self.IsHEVZombie then
			self.AnimationTranslations[ACT_WALK] = {ACT_STRAFE_RIGHT}
			self.AnimationTranslations[ACT_RUN] = {ACT_STRAFE_RIGHT}
		end
		if self:Health() < 10 && self:Health() > 0 && hitgroup != 1 then
			local headcrabdropchance = math.random(0,4)
			if headcrabdropchance == 3 then
				self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
				self:Dropheadcrab()
				self:TakeDamage(self:Health() + 100,self,self)
			end
		end
	end
	if (hitgroup == 6 || hitgroup == 7) && !self.Crippled && !self.IsHEVZombie then
		self.LegHealth = self.LegHealth -dmginfo:GetDamage()
		if self.LegHealth <= 0 then
			self:Cripple(true)
		end
	end
end

function ENT:Dropheadcrab()
local headcrab = ents.Create("npc_vj_hlrze_headcrab")
headcrab:SetPos(self:GetPos() + Vector(0,0,60))
headcrab:SetAngles(self:GetAngles()) 
headcrab:Spawn()
if self.CanUseGrenade == true then self:SetBodygroup(0,3) end

if self.IsHEVZombie == true then 
	self:SetBodygroup(1,1)
else self:SetBodygroup(1,4)
end

if self.VJ_IsBeingControlled == true then
	local cameramode = self.VJ_TheControllerEntity.VJC_Camera_Mode -- copy the current first/thirdperson view
	self.VJ_TheControllerEntity:SetControlledNPC(headcrab)
	self.VJ_TheControllerEntity:StartControlling()
	timer.Simple(0.01,function() 
		self.VJ_TheControllerEntity.VJC_Camera_Mode = cameramode -- set the headcrab's view to what ours was set to
	end )
end
		
end

function ENT:OnLeapAttack(status, enemy)
	if self.VJ_IsBeingControlled == true then
		self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
		self:Dropheadcrab()
		self:TakeDamage(self:Health() + 100,self,self)
	end
	return false
end

function ENT:Controller_Initialize(ply) 
	self.HasLeapAttack = true
--self.DisableLeapAttackAnimation = true
--self.LeapAttackUseCustomVelocity = true
end

function ENT:Controller_Initialize(ply, controlEnt)
	ply:ChatPrint("JUMP: Detach Headcrab")
end
local gibs1 = {"models/vj_hlr/gibs/agib1.mdl", "models/vj_hlr/gibs/agib2.mdl", "models/vj_hlr/gibs/agib3.mdl", "models/vj_hlr/gibs/agib4.mdl","models/vj_hlr/gibs/agib5.mdl","models/vj_hlr/gibs/agib6.mdl","models/vj_hlr/gibs/agib7.mdl","models/vj_hlr/gibs/agib8.mdl","models/vj_hlr/gibs/agib9.mdl","models/vj_hlr/gibs/agib10.mdl"}
--
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)
	VJ.HLR_ApplyCorpseSystem(self, corpse, gibs1)
end

local vecZ50 = Vector(0, 0, -50)
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

function ENT:BodyTarget( origin, noisy )
	if self.Crippled then
		return self:GetPos() + Vector(0,0,500)
	end
end