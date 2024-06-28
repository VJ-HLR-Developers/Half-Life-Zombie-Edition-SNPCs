AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_hlr/hlze/rusher.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 65
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Yellow" -- The blood type, this will determine what it should use (decal, particle, etc.)
ENT.CustomBlood_Particle = {"vj_hlr_blood_yellow"}
ENT.CustomBlood_Decal = {"VJ_HLR_Blood_Yellow"} -- Decals to spawn when it's damaged
ENT.HasBloodPool = false -- Does it have a blood pool?
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"} -- NPCs with the same class with be allied to each other

ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
ENT.MeleeAttackDamage = 15
ENT.TimeUntilMeleeAttackDamage = false -- This counted in seconds | This calculates the time until it hits something
ENT.MeleeAttackDistance = 50 -- How close does it have to be until it attacks?
ENT.MeleeAttackDamageDistance = 80 -- How far does the damage go?

ENT.HasExtraMeleeAttackSounds = true -- Set to true to use the extra melee attack sounds
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
ENT.AnimTbl_Run = {ACT_RUN} -- Set the running animations | Put multiple to let the base pick a random animation when it moves
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
//ENT.DeathAnimationTime = 0.8 -- Time until the SNPC spawns its corpse and gets removed

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Leap Attack Variables ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasLeapAttack = true
ENT.LeapAttackDamage = 15
ENT.LeapAttackDamageType = DMG_SLASH -- Type of Damage
	-- ====== Animation Variables ====== --
ENT.AnimTbl_LeapAttack = ACT_GLIDE
ENT.LeapAttackAnimationDelay = 0 -- It will wait certain amount of time before playing the animation
ENT.LeapAttackAnimationFaceEnemy = 2 -- 2 = Face the enemy UNTIL it jumps!
ENT.LeapAttackAnimationDecreaseLengthAmount = 0 -- This will decrease the time until starts chasing again. Use it to fix animation pauses until it chases the enemy.
	-- ====== Distance Variables ====== --
ENT.LeapDistance = 2000 -- The distance of the leap
ENT.LeapToMeleeDistance = 500 -- How close does it have to be until it uses melee?
ENT.LeapAttackDamageDistance = 100 -- How far does the damage go?
ENT.LeapAttackAngleRadius = 60
	-- ====== Timer Variables ====== --
	-- Set this to false to make the attack event-based:
ENT.TimeUntilLeapAttackDamage = 1 -- How much time until it runs the leap damage code?
ENT.TimeUntilLeapAttackVelocity = 0 -- How much time until it runs the velocity code?
ENT.NextLeapAttackTime = 1.5 -- How much time until it can use a leap attack?
ENT.NextLeapAttackTime_DoRand = false
ENT.NextAnyAttackTime_Leap = false -- How much time until it can use any attack again? | Counted in Seconds
ENT.NextAnyAttackTime_Leap_DoRand = false
ENT.LeapAttackReps = 1 -- How many times does it run the leap attack code?
ENT.LeapAttackExtraTimers = nil
ENT.StopLeapAttackAfterFirstHit = true -- Should it stop the leap attack from running rest of timers when it hits an enemy?
	-- ====== Velocity Variables ====== --
ENT.LeapAttackVelocityForward = 300 -- How much forward force should it apply?
ENT.LeapAttackVelocityUp = 200 -- How much upward force should it apply?
ENT.LeapAttackVelocityRight = 0 -- How much right force should it apply?

ENT.HasBeforeLeapAttackSound = false

	-- ====== Eating Variables ====== --
ENT.CanEat = true -- Should it search and eat organic stuff when idle?

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_hlr/hl1_npc/roach/rch_walk.wav"}
--ENT.SoundTbl_Alert = {"vj_hlr/hlze/zombie/fz_scream1.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_hlr/hlze/zombie/zombie_melee2.wav"}
ENT.SoundTbl_LeapAttackJump = {"vj_hlr/hlze/zombie/leap1.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"vj_hlr/hl1_npc/zombie/claw_strike1.wav","vj_hlr/hl1_npc/zombie/claw_strike2.wav","vj_hlr/hl1_npc/zombie/claw_strike3.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_hlr/hl1_npc/zombie/claw_miss1.wav","vj_hlr/hl1_npc/zombie/claw_miss2.wav"}
ENT.SoundTbl_Pain = {"vj_hlr/hlze/zombie/zombie_pain4.wav","vj_hlr/hlze/zombie/zombie_pain5.wav","vj_hlr/hlze/zombie/zombie_pain6.wav","vj_hlr/hlze/zombie/zombie_pain7.wav"}
ENT.SoundTbl_Death = {"vj_hlr/hlze/zombie/zombie_voice_idle13.wav","vj_hlr/hlze/zombie/zombie_die1.wav","vj_hlr/hlze/zombie/zombie_die2.wav","vj_hlr/hlze/zombie/zombie_die3.wav"}

ENT.GeneralSoundPitch1 = 100
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetCollisionBounds(Vector(16,16,45),Vector(-16,-16,0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	//print(key)
	if key == "event_emit step" then 
		self:FootStepSoundCode()
	end
	if key == "event_mattack right" or key == "event_mattack left" or key == "event_mattack both" then
		self:MeleeAttackCode()
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
	if hitgroup == HITGROUP_HEAD then
		self.AnimTbl_Death = {ACT_DIE_GUTSHOT,ACT_DIE_HEADSHOT}
	else
		self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIESIMPLE}
	end
end

local gibs1 = {"models/vj_hlr/gibs/agib1.mdl", "models/vj_hlr/gibs/agib2.mdl", "models/vj_hlr/gibs/agib3.mdl", "models/vj_hlr/gibs/agib4.mdl","models/vj_hlr/gibs/agib5.mdl","models/vj_hlr/gibs/agib6.mdl","models/vj_hlr/gibs/agib7.mdl","models/vj_hlr/gibs/agib8.mdl","models/vj_hlr/gibs/agib9.mdl","models/vj_hlr/gibs/agib10.mdl"}
--
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo, hitgroup, corpseEnt)
	VJ_HLR_ApplyCorpseEffects(self, corpseEnt, gibs1)
end

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_OnBleed(dmginfo,hitgroup)
		if self:Health() < 10 && self:Health() > 0 && hitgroup != 1 then
			local headcrabdropchance = math.random(0,3)
			if headcrabdropchance == 3 then
				self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
				self:Dropheadcrab()
				self:TakeDamage(self:Health() + 100,self,self)
			end
		end
end

function ENT:Dropheadcrab()
local headcrab = ents.Create("npc_vj_hlrze_headcrab")
headcrab:SetPos(self:GetPos() + Vector(0,0,60))
headcrab:SetAngles(self:GetAngles()) 
headcrab:Spawn()

self:SetBodygroup(1,1)


if self.VJ_IsBeingControlled == true then
	self.VJ_TheControllerEntity:SetControlledNPC(headcrab)
	self.VJ_TheControllerEntity:StartControlling()
end
		
end

function ENT:Controller_IntMsg(ply)
	ply:ChatPrint("JUMP: Detach Headcrab")
end


local vecZ50 = Vector(0, 0, -50)
function ENT:CustomOnEat(status, statusInfo)
	-- The following code is a ideal example based on Half-Life 1 Zombie
	//print(self, "Eating Status: ", status, statusInfo)
	if status == "CheckFood" then
		return (statusInfo.owner.BloodData && statusInfo.owner.BloodData.Color == "Red") -- only start eating if the corpse is a human, and we're not at full health - epicplayer
	elseif status == "BeginEating" then
		self:SetIdleAnimation({ACT_GESTURE_RANGE_ATTACK1}, true)
		return self:VJ_ACT_PLAYACTIVITY(ACT_ARM, true, false)
	elseif status == "Eat" then
		VJ_EmitSound(self, "vj_hlr/hl1_npc/bullchicken/bc_bite"..math.random(1, 3)..".wav", 100) --more accurate to the mod - epicplayer
		-- Health changes
		local food = self.EatingData.Ent
		local damage = 15 -- How much damage food will receive
		local foodHP = food:Health() -- Food's health
		self:SetHealth(math.Clamp(self:Health() + ((damage > foodHP and foodHP) or damage), self:Health(), (self:GetMaxHealth() * 2))) -- Give health to the NPC, allow an overload of up to 2x max health.
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
		return 0.3 -- Speed that the rusher eats at
	elseif status == "StopEating" then
		if statusInfo != "Dead" && self.EatingData.AnimStatus != "None" then -- Do NOT play anim while dead or has NOT prepared to eat
			return self:VJ_ACT_PLAYACTIVITY(ACT_DISARM, true, false)
		end
	end
	return 0
end

/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/