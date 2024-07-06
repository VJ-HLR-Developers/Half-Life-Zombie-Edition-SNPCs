AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_hlr/hlze/zombie.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 50
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Yellow" -- The blood type, this will determine what it should use (decal, particle, etc.)
ENT.CustomBlood_Particle = {"vj_hlr_blood_yellow"}
ENT.CustomBlood_Decal = {"VJ_HLR_Blood_Yellow"} -- Decals to spawn when it's damaged
ENT.HasBloodPool = false -- Does it have a blood pool?
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"} -- NPCs with the same class with be allied to each other

ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.TimeUntilMeleeAttackDamage = false -- This counted in seconds | This calculates the time until it hits something
ENT.MeleeAttackDistance = 50 -- How close does it have to be until it attacks?
ENT.MeleeAttackDamageDistance = 80 -- How far does the damage go?
ENT.DisableLeapAttackAnimation = true -- if true, it will disable the animation code
ENT.LeapAttackUseCustomVelocity = true -- Should it disable the default velocity system?

ENT.BringFriendsOnDeath = false
ENT.CallForHelp = false

ENT.HasExtraMeleeAttackSounds = true -- Set to true to use the extra melee attack sounds
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
-- ENT.AnimTbl_Run = {ACT_WALK} -- Set the running animations | Put multiple to let the base pick a random animation when it moves
ENT.AnimTbl_Run = {ACT_RUN,ACT_WALK} -- Set the running animations | Put multiple to let the base pick a random animation when it moves
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
//ENT.DeathAnimationTime = 0.8 -- Time until the SNPC spawns its corpse and gets removed
	-- ====== Flinching Variables ====== --
ENT.CanFlinch = 1 -- 0 = Don't flinch | 1 = Flinch at any damage | 2 = Flinch only from certain damages
ENT.AnimTbl_Flinch = {"vjseq_flinch"} -- If it uses normal based animation, use this
ENT.HasHitGroupFlinching = true -- It will flinch when hit in certain hitgroups | It can also have certain animations to play in certain hitgroups
ENT.HitGroupFlinching_Values = {
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

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_hlr/pl_step1.wav","vj_hlr/pl_step2.wav","vj_hlr/pl_step3.wav","vj_hlr/pl_step4.wav"}
ENT.SoundTbl_Idle = {"vj_hlr/hl1_npc/zombie/zo_idle1.wav","vj_hlr/hl1_npc/zombie/zo_idle2.wav","vj_hlr/hl1_npc/zombie/zo_idle3.wav","vj_hlr/hl1_npc/zombie/zo_idle4.wav"}
ENT.SoundTbl_Alert = {"vj_hlr/hl1_npc/zombie/zo_alert10.wav","vj_hlr/hl1_npc/zombie/zo_alert20.wav","vj_hlr/hl1_npc/zombie/zo_alert30.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_hlr/hl1_npc/zombie/zo_attack1.wav","vj_hlr/hl1_npc/zombie/zo_attack2.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"vj_hlr/hl1_npc/zombie/claw_strike1.wav","vj_hlr/hl1_npc/zombie/claw_strike2.wav","vj_hlr/hl1_npc/zombie/claw_strike3.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_hlr/hl1_npc/zombie/claw_miss1.wav","vj_hlr/hl1_npc/zombie/claw_miss2.wav"}
ENT.SoundTbl_Pain = {"vj_hlr/hl1_npc/zombie/zo_pain1.wav","vj_hlr/hl1_npc/zombie/zo_pain2.wav"}
ENT.SoundTbl_Death = {"vj_hlr/hl1_npc/zombie/zo_pain1.wav","vj_hlr/hl1_npc/zombie/zo_pain2.wav"}

ENT.GeneralSoundPitch1 = 100
ENT.BodyGroups = {
	[0] = 0,
	[1] = 0,
}
ENT.Crippled = false
ENT.LegHealth = ENT.StartHealth /6
ENT.NextRegenT = CurTime()
ENT.IsHEVZombie = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetBodygroup(0,self.BodyGroups[0])
	self:SetBodygroup(1,self.BodyGroups[1])
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Cripple(crip)
	self.Crippled = crip
	if crip then
		self:VJ_ACT_PLAYACTIVITY(ACT_DIESIMPLE,true,false,false)
		self:SetHullType(HULL_WIDE_SHORT)
		self:SetCollisionBounds(Vector(14,14,20),Vector(-14,-14,0))
		self.AnimTbl_IdleStand = {ACT_COMBAT_IDLE}
		self.AnimTbl_Walk = {VJ_SequenceToActivity(self,"limp_leg_walk")}
		self.AnimTbl_Run = {VJ_SequenceToActivity(self,"limp_leg_run")}
		self.CanFlinch = 0
		self.MaxJumpLegalDistance = VJ_Set(0,0)
		self.CanEat = false
	else
		self.LegHealth = 20
		self:VJ_ACT_PLAYACTIVITY(ACT_ROLL_LEFT,true,false,false)
		self:SetHullType(HULL_HUMAN)
		self:SetCollisionBounds(Vector(18,18,66),Vector(-18,-18,0))
		self.AnimTbl_IdleStand = {ACT_IDLE}
		self.AnimTbl_Walk = {ACT_WALK}
		self.AnimTbl_Run = {ACT_RUN}
		self.CanFlinch = 1
		self.MaxJumpLegalDistance = VJ_Set(400,550)
		self.CanEat = true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	if self.Crippled && CurTime() > self.NextRegenT then
		self:SetHealth(math.Clamp(self:Health() +5,1,self:GetMaxHealth()))
		self.NextRegenT = CurTime() +10
	end
	if self.Crippled && self:Health() > self:GetMaxHealth() *0.65 then
		self:Cripple(false)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "event_emit step" then
		self:FootStepSoundCode()
	end
	if key == "event_mattack right" or key == "event_mattack left" or key == "event_mattack both" then
		self:MeleeAttackCode()
	end
	if key == "mattack right" or key == "mattack left" or key == "mattack both" then
		self:MeleeAttackCode()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	if self.Crippled then
		if math.random(1,2) == 1 then
			self.AnimTbl_MeleeAttack = {ACT_RANGE_ATTACK2}
			self.MeleeAttackDamage = 10
		else
			self.AnimTbl_MeleeAttack = {ACT_RANGE_ATTACK2}
			self.MeleeAttackDamage = 20
		end
	else
		if math.random(1,2) == 1 then
			self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
			self.MeleeAttackDamage = 20
		else
			self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK2}
			self.MeleeAttackDamage = 40
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo,hitgroup)
	self.HasDeathSounds = false
	if self.HasGibDeathParticles == true then
		local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetPos() +self:OBBCenter())
		bloodeffect:SetColor(VJ_Color2Byte(Color(255,221,35)))
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
	
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib1.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib2.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,20))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib3.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib4.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,35))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib5.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,50))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib6.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,55))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib7.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib8.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib9.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,25))})
	self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/agib10.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,15))})
	if self.Zombie_Type == 1 then
		self:CreateGibEntity("obj_vj_gib","models/vj_hlr/gibs/zombiegib.mdl",{BloodType="Yellow",BloodDecal="VJ_HLR_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,15))})
	end
	return true -- Return to true if it gibbed!
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomGibOnDeathSounds(dmginfo,hitgroup)
	VJ_EmitSound(self,"vj_gib/default_gib_splat.wav",90,math.random(100,100))
	return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	if self.Crippled then return end
	if hitgroup == HITGROUP_HEAD then
		self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
	else
		self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIESIMPLE}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_OnBleed(dmginfo,hitgroup)
	if !self.Crippled then
		if hitgroup == 6 && !self.IsHEVZombie then
			self.AnimTbl_Walk = {ACT_STRAFE_LEFT}
			self.AnimTbl_Run = {ACT_STRAFE_LEFT}
		end
		if hitgroup == 7 && !self.IsHEVZombie then
			self.AnimTbl_Walk = {ACT_STRAFE_RIGHT}
			self.AnimTbl_Run = {ACT_STRAFE_RIGHT}
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
	self.VJ_TheControllerEntity:SetControlledNPC(headcrab)
	self.VJ_TheControllerEntity:StartControlling()
end
		
end

function ENT:CustomOnLeapAttackVelocityCode()
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

function ENT:Controller_IntMsg(ply)
	ply:ChatPrint("JUMP: Detach Headcrab")
end
local gibs1 = {"models/vj_hlr/gibs/agib1.mdl", "models/vj_hlr/gibs/agib2.mdl", "models/vj_hlr/gibs/agib3.mdl", "models/vj_hlr/gibs/agib4.mdl","models/vj_hlr/gibs/agib5.mdl","models/vj_hlr/gibs/agib6.mdl","models/vj_hlr/gibs/agib7.mdl","models/vj_hlr/gibs/agib8.mdl","models/vj_hlr/gibs/agib9.mdl","models/vj_hlr/gibs/agib10.mdl"}
--
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo, hitgroup, corpseEnt)
	VJ_HLR_ApplyCorpseEffects(self, corpseEnt, gibs1)
end

local vecZ50 = Vector(0, 0, -50)
function ENT:CustomOnEat(status, statusInfo)
	-- The following code is a ideal example based on Half-Life 1 Zombie
	//print(self, "Eating Status: ", status, statusInfo)
	if status == "CheckFood" then
		return (statusInfo.owner.BloodData && statusInfo.owner.BloodData.Color == "Red" && self:Health() != self:GetMaxHealth()) -- only start eating if the corpse is a human, and we're not at full health - epicplayer
	elseif status == "BeginEating" then
		self:SetIdleAnimation({ACT_GESTURE_RANGE_ATTACK1}, true)
		return self:VJ_ACT_PLAYACTIVITY(ACT_ARM, true, false)
	elseif status == "Eat" then
		VJ_EmitSound(self, "vj_hlr/hl1_npc/bullchicken/bc_bite"..math.random(1, 3)..".wav", 100) --more accurate to the mod - epicplayer
		-- Health changes
		local food = self.EatingData.Ent
		local damage = 15 -- How much damage food will receive
		local foodHP = food:Health() -- Food's health
		self:SetHealth(math.Clamp(self:Health() + ((damage > foodHP and foodHP) or damage), self:Health(), self:GetMaxHealth())) -- Give health to the NPC
		food:SetHealth(foodHP - damage) -- Decrease corpse health
		-- Blood effects
		local bloodData = food.BloodData
		if bloodData then
			local bloodPos = food:GetPos() + food:OBBCenter()
			local bloodParticle = VJ_PICK(bloodData.Particle)
			if bloodParticle then
				ParticleEffect(bloodParticle, bloodPos, self:GetAngles())
			end
			local bloodDecal = VJ_PICK(bloodData.Decal)
			if bloodDecal then
				local tr = util.TraceLine({start = bloodPos, endpos = bloodPos + vecZ50, filter = {food, self}})
				util.Decal(bloodDecal, tr.HitPos + tr.HitNormal + Vector(math.random(-45, 45), math.random(-45, 45), 0), tr.HitPos - tr.HitNormal, food)
			end
		end
		return 1 -- Changed to match the speed of the HLZE mod - epicplayer
	elseif status == "StopEating" then
		if statusInfo != "Dead" && self.EatingData.AnimStatus != "None" then -- Do NOT play anim while dead or has NOT prepared to eat
			return self:VJ_ACT_PLAYACTIVITY(ACT_DISARM, true, false)
		end
	end
	return 0
end