---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "M16"
SWEP.Author 					= "DrVrej"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for Players and NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "VJ Base"
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire 		= false -- Next time it can use primary fire
SWEP.NPC_ReloadSound			= {"vj_hlr/gsrc/npc/hgrunt/gr_reload1.wav"} -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.NPC_ReloadSoundLevel = 100
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly 			= true -- Is this weapon meant to be for NPCs only?
SWEP.WorldModel					= "models/vj_hlr/hlze/weapons/m16.mdl"
SWEP.HoldType 					= "smg"
SWEP.Spawnable					= false
SWEP.AdminSpawnable				= false
SWEP.ReplacementWeapon = {"weapon_hl1_mp5", "weapon_mp5_hl1"}
	-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
//SWEP.PrimaryEffects_MuzzleParticles = {"vj_hl_muz3"}
SWEP.WorldModel_Invisible = true -- Should the world model be invisible?
SWEP.WorldModel_UseCustomPosition = true -- Should the gun use custom position? This can be used to fix guns that are in the crotch
SWEP.WorldModel_CustomPositionAngle = Vector(2,2,0)
SWEP.WorldModel_CustomPositionOrigin = Vector(0,0,0)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand" -- The bone it will use as the main point
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 5 -- Damage
SWEP.Primary.ClipSize			= 50 -- Max amount of bullets per clip
SWEP.Primary.Ammo				= "SMG1" -- Ammo type
SWEP.Primary.Sound				= {"vj_hlr/hlze/hks1.wav","vj_hlr/hlze/hks2.wav","vj_hlr/hlze/hks3.wav"}
SWEP.Primary.DistantSound		= {"vj_hlr/gsrc/wep/mp5/mp5_distant_fuckme.wav"}

SWEP.NPC_HasSecondaryFireNext = true -- Can the weapon have a secondary fire?
SWEP.NPC_SecondaryFireSoundLevel = 85
SWEP.NPC_SecondaryFireNext = {6,10}
SWEP.NPC_SecondaryFireNextT = CurTime() +3


-- Custom
SWEP.HLR_ValidModels = {"models/vj_hlr/hlze/hgrunt.mdl","models/vj_hlr/hlze/barney.mdl","models/vj_hlr/hlze/scientist.mdl"}
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
	timer.Simple(0.1,function() -- Minag mikani modelner tske, yete ooresh model-e, serpe as zenke
		if IsValid(self) && IsValid(self.Owner) then
			if self:GetOwner():GetModel() == "models/vj_hlr/hlze/scientist.mdl" then
				self.WorldModel_CustomPositionAngle = Vector(2,2,-10)
				self.WorldModel_CustomPositionOrigin = Vector(-2,-2,-2)
			end
			if !VJ_HasValue(self.HLR_ValidModels,self.Owner:GetModel()) then
				if IsValid(self.Owner:GetCreator()) then
					self.Owner:GetCreator():PrintMessage(HUD_PRINTTALK,self.PrintName.." removed! It's made for specific NPCs only!")
				end
				self:Remove()
			else
				self.NPC_NextPrimaryFire = false
			end
		end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_SecondaryFire()
	local pos = self:GetNWVector("VJ_CurBulletPos")
	local proj = ents.Create("obj_vj_hlr1_grenade_40mm")
	proj:SetPos(pos)
	proj:SetAngles(self.Owner:GetAngles())
	proj:SetOwner(self.Owner)
	proj:Spawn()
	proj:Activate()
	local phys = proj:GetPhysicsObject()
	if IsValid(phys) then
		phys:Wake()
		phys:SetVelocity(self.Owner:CalculateProjectile("Curve", pos, self.Owner:GetEnemy():GetPos() + self.Owner:GetEnemy():OBBCenter(), 4000))
	end
	VJ_EmitSound(self.Owner,{"vj_hlr/gsrc/wep/mp5/glauncher.wav","vj_hlr/gsrc/wep/mp5/glauncher2.wav"},90)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnDrawWorldModel() -- This is client only!
    if IsValid(self.Owner) then
        self.WorldModel_Invisible = true
        return false
    else
        self.WorldModel_Invisible = false
        return true -- return false to not draw the world model
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:PrimaryAttackEffects(owner)
	self.PrimaryEffects_MuzzleFlash = false
	muz = ents.Create("env_sprite")
	muz:SetKeyValue("model","vj_hl/sprites/muzzleflash1.vmt")
	muz:SetKeyValue("scale",""..math.Rand(0.45,0.6))
	muz:SetKeyValue("GlowProxySize","2.0") -- Size of the glow to be rendered for visibility testing.
	muz:SetKeyValue("HDRColorScale","1.0")
	muz:SetKeyValue("renderfx","14")
	muz:SetKeyValue("rendermode","3") -- Set the render mode to "3" (Glow)
	muz:SetKeyValue("renderamt","255") -- Transparency
	muz:SetKeyValue("disablereceiveshadows","0") -- Disable receiving shadows
	muz:SetKeyValue("framerate","10.0") -- Rate at which the sprite should animate, if at all.
	muz:SetKeyValue("spawnflags","0")
	muz:SetParent(self)
	muz:Fire("SetParentAttachment",self.PrimaryEffects_MuzzleAttachment)
	muz:SetAngles(Angle(math.random(-100,100),math.random(-100,100),math.random(-100,100)))
	muz:Spawn()
	muz:Activate()
	muz:Fire("Kill","",0.08)
	self.BaseClass.PrimaryAttackEffects(self, owner)
end