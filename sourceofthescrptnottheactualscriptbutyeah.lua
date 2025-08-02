local v_u_1 = Random.new()
local v_u_2 = game:GetService("RunService").Heartbeat
local v_u_3 = game:GetService("TweenService")
local v_u_4 = require(workspace.baseFunctions)
local v_u_5 = game:GetService("UserInputService")
local v_u_6 = game:GetService("Debris")
local v_u_7 = game:GetService("BadgeService")
local v_u_8 = game.Players.LocalPlayer
local v_u_9 = v_u_8:GetMouse()
local v_u_10 = game:GetService("Workspace").CurrentCamera
local v_u_11 = 0
local v_u_12 = 0
local v_u_13 = false
local v_u_14 = {}
local v_u_15 = "unlocked"
local v_u_16 = {}
local v_u_17 = {}
local v_u_18 = 0
local v_u_19 = nil
local v_u_20 = nil
local v_u_21 = nil
local v_u_22 = nil
v_u_9.TargetFilter = nil
ragdollGrabbing = false
falling = false
canragdoll = true
canjump = true
local v_u_23 = {
	6692609032,
	6692432879,
	6692433349,
	6692433876,
	6692480384
}
local v_u_24 = { 374451644, 3303339221 }
local v_u_25 = { 374451644, 3303339221 }
local v_u_26 = 15
local v_u_27 = os.clock()
local v_u_28 = false
local v_u_29 = 30
local v_u_30 = false
function visualizeButton(p_u_31, _)
	-- upvalues: (copy) v_u_3
	local v_u_32 = p_u_31.Size
	local v_u_33 = p_u_31.Position
	local v_u_34 = UDim2.new(v_u_32.X.Scale / 1.1, v_u_32.X.Offset / 1.1, v_u_32.Y.Scale / 1.1, v_u_32.Y.Offset / 1.1)
	local v_u_35 = UDim2.new(v_u_33.X.Scale + v_u_34.X.Scale / 16, v_u_33.X.Offset + v_u_34.X.Offset / 16, v_u_33.Y.Scale + v_u_34.Y.Scale / 16, v_u_33.Y.Offset + v_u_34.Y.Offset / 16)
	p_u_31.MouseLeave:connect(function()
		-- upvalues: (ref) v_u_3, (copy) p_u_31, (copy) v_u_32, (copy) v_u_33
		local v36 = {
			["Size"] = v_u_32
		}
		v_u_3:Create(p_u_31, TweenInfo.new(0.25, Enum.EasingStyle.Circular, Enum.EasingDirection.In, 0, false, 0), v36):Play()
		local v37 = {
			["Position"] = v_u_33
		}
		v_u_3:Create(p_u_31, TweenInfo.new(0.25, Enum.EasingStyle.Circular, Enum.EasingDirection.In, 0, false, 0), v37):Play()
	end)
	p_u_31.MouseButton1Down:connect(function()
		-- upvalues: (copy) p_u_31, (copy) v_u_34, (copy) v_u_35
		p_u_31.Size = v_u_34
		p_u_31.Position = v_u_35
	end)
	p_u_31.MouseButton1Click:connect(function()
		-- upvalues: (ref) v_u_3, (copy) p_u_31, (copy) v_u_32, (copy) v_u_33
		local v38 = {
			["Size"] = v_u_32
		}
		v_u_3:Create(p_u_31, TweenInfo.new(0.25, Enum.EasingStyle.Circular, Enum.EasingDirection.In, 0, false, 0), v38):Play()
		local v39 = {
			["Position"] = v_u_33
		}
		v_u_3:Create(p_u_31, TweenInfo.new(0.25, Enum.EasingStyle.Circular, Enum.EasingDirection.In, 0, false, 0), v39):Play()
	end)
end
workspace.ragdollSystemScript.clientMessage.OnClientEvent:connect(function(p40, p41, p42)
	if p42 then
		game.StarterGui:SetCore("SendNotification", {
			["Title"] = p40,
			["Text"] = p41,
			["Icon"] = p42
		})
	else
		game.StarterGui:SetCore("SendNotification", {
			["Title"] = p40,
			["Text"] = p41
		})
	end
end)
workspace.ragdollSystemScript.RagdollDeath:FireServer("start\208\148\208\176\208\178\208\176\208\185\209\131\208\182\208\181\208\180\208\190\209\129\209\130\208\176\208\187")
workspace.ChildAdded:connect(function(p_u_43)
	-- upvalues: (copy) v_u_2, (copy) v_u_8, (copy) v_u_3
	v_u_2:wait()
	if p_u_43.Name == v_u_8.Name .. "ServerWindEff" then
		if p_u_43:FindFirstChild("Sound") then
			p_u_43.Sound.Volume = 0
		end
		if p_u_43:FindFirstChild("PointLight") then
			p_u_43.PointLight.Enabled = false
		end
		v_u_3:Create(p_u_43, TweenInfo.new(0, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0), {
			["Transparency"] = 1
		}):Play()
		p_u_43:GetPropertyChangedSignal("Transparency"):connect(function()
			-- upvalues: (copy) p_u_43, (ref) v_u_3
			if p_u_43.Transparency < 1 then
				v_u_3:Create(p_u_43, TweenInfo.new(0, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0), {
					["Transparency"] = 1
				}):Play()
			end
		end)
	end
end)
function ungrab()
	-- upvalues: (ref) v_u_21, (copy) v_u_8, (ref) v_u_22, (copy) v_u_9, (ref) v_u_27, (ref) v_u_29, (copy) v_u_10, (copy) v_u_1, (copy) v_u_3, (copy) v_u_6
	if v_u_21 then
		local v44 = workspace.CurrentCamera:FindFirstChild(v_u_8.Name .. "_grabArms") and workspace.CurrentCamera:FindFirstChild(v_u_8.Name .. "_grabArms")
		if v44 then
			if v_u_8.Character:FindFirstChild("Left Arm") and (v44:FindFirstChild("Left Arm") and v_u_8.Character["Left Arm"]:FindFirstChild("mesh")) then
				v_u_8.Character["Left Arm"].mesh:Destroy()
			end
			if v_u_8.Character:FindFirstChild("LeftHand") and (v44:FindFirstChild("LeftHand") and v_u_8.Character.LeftHand:FindFirstChild("mesh")) then
				v_u_8.Character.LeftHand.mesh:Destroy()
			end
			if v_u_8.Character:FindFirstChild("Right Arm") and (v44:FindFirstChild("Right Arm") and v_u_8.Character["Right Arm"]:FindFirstChild("mesh")) then
				v_u_8.Character["Right Arm"].mesh:Destroy()
			end
			if v_u_8.Character:FindFirstChild("RightHand") and (v44:FindFirstChild("RightHand") and v_u_8.Character.RightHand:FindFirstChild("mesh")) then
				v_u_8.Character.RightHand.mesh:Destroy()
			end
			local v45 = next
			local v46, v47 = v44:GetChildren()
			for _, v48 in v45, v46, v47 do
				if v48:IsA("CharacterMesh") then
					v48.Parent = v_u_8.Character
				end
			end
			v44:Destroy()
		end
		local v49 = v_u_21 and (v_u_21:FindFirstChild("NR_grabPos") and (v_u_8.Character:FindFirstChild("HumanoidRootPart") and v_u_21:FindFirstChild("NR_grabPos")))
		if v49 then
			if v49:FindFirstChild("grabBodPos") then
				v49.grabBodPos:Destroy()
			end
			if v49:FindFirstChild("grabBodGyr") then
				v49.grabBodGyr:Destroy()
			end
		end
		if v_u_21 then
			local v50 = v_u_21
			v_u_21 = nil
			v_u_22 = nil
			v_u_9.TargetFilter = nil
			local v51 = v_u_8.NoxyRagdoll_Options.passOption_gravityHands.Value == true and (v_u_8.UserId == 374451644 and 7.5 or 5) or 2.5
			if v_u_8.NoxyRagdoll_Options.badgeOption_gravityBracelet.Value == true then
				v51 = v51 * 2
			end
			local v52 = (os.clock() - v_u_27) * 37.5
			local v53 = v_u_29
			local v54 = math.clamp(v52, 0, v53)
			if v54 > 5 and v50:FindFirstChild("NR_grabPos") then
				local v55 = nil
				local v56
				if v50:FindFirstChild("NR_grabPos") then
					v56 = v50.NR_grabPos
				else
					v56 = nil
				end
				local v57 = v_u_8.NoxyRagdoll_Options.passOption_gravityHands.Value == false and Vector3.new(40000, 40000, 40000) or (v_u_8.NoxyRagdoll_Options.passOption_gravityHands.Value == true and (v_u_8.UserId == 374451644 and Vector3.new(inf, inf, inf) or Vector3.new(400000, 400000, 400000)) or v55)
				if v_u_8.NoxyRagdoll_Options.badgeOption_gravityBracelet.Value == true then
					v57 = v57 * 5
				end
				local v58 = v_u_10.CFrame.LookVector * 2 * v54 * v51
				local v59 = false
				local v60 = Color3.new(1, 1, 1)
				local v61
				if v58.magnitude >= 400 then
					local v62
					if v56 then
						v62 = v56.Position
					else
						v62 = v50.Position
					end
					local v63 = v58.magnitude / 83.33333333333333
					local v64 = math.ceil(v63)
					local v65 = math.clamp(v64, 3, 48)
					local v66 = v58.magnitude / 500
					local v67 = math.ceil(v66)
					local v68 = math.clamp(v67, 1, 32)
					for v69 = 1, v65 do
						local v70 = v_u_1:NextInteger(125, 175) / 100 * (v58.magnitude / 375)
						local v71 = math.clamp(v70, 0, 10)
						local v72 = v_u_1:NextInteger(50, 70)
						local v73 = v_u_1:NextInteger(200, 300) / 100
						local v74 = v_u_1:NextInteger(75, 125) / 100
						local v75 = 360 / v65
						local v76 = CFrame.new(v62, v62 + v58) * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966)
						local v77 = CFrame.Angles
						local v78 = v69 * (v_u_1:NextInteger(v75 * 9, v75 * 11) / 10)
						local v79 = v76:ToWorldSpace(v77(math.rad(v78), 0, 0))
						local v80 = workspace.ragdollSystemScript.windEff:Clone()
						v80.Name = "clientWindEff"
						v80.Size = v80.Size * v74 * (v58.magnitude / 250)
						v80.CFrame = v79
						local v81 = CFrame.Angles(math.rad(v72), 0, 0) * CFrame.new(0, -v80.Size.Y * v73 * (v58.magnitude / 250), 0)
						v80.Transparency = 0.5
						v_u_3:Create(v80, TweenInfo.new(v71, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0, false, 0), {
							["Size"] = v80.Size * v73,
							["CFrame"] = v80.CFrame:ToWorldSpace(v81),
							["Transparency"] = 1
						}):Play()
						v_u_6:AddItem(v80, v71)
						v80.Parent = workspace
					end
					if v58.magnitude >= 600 then
						v59 = true
						if v_u_8.NoxyRagdoll_Options.passOption_gravityHands.Value == true then
							if v_u_8.UserId == 374451644 then
								v60 = Color3.new(0.25, 0.75, 1)
							else
								v60 = Color3.new(0.3333333333333333, 0, 1)
							end
						end
						if v_u_8.NoxyRagdoll_Options.badgeOption_gravityBracelet.Value == true then
							v60 = Color3.new((1 + v60.R) / 2, (0.75 + v60.G) / 2, (0.25 + v60.B) / 2)
						end
						local v82 = v_u_1:NextInteger(125, 175) / 100 * (v58.magnitude / 400)
						local v83 = math.clamp(v82, 0, 10)
						local v84 = v_u_1:NextInteger(0, 90)
						local v85 = v_u_1:NextInteger(300, 400) / 100
						local v86 = v_u_1:NextInteger(75, 125) / 100
						local v87 = 360 / v65
						local v88 = CFrame.new(v62, v62 + v58) * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966)
						local v89 = CFrame.Angles
						local v90 = v_u_1:NextInteger(v87 * 9, v87 * 11) / 10
						local v91 = v88:ToWorldSpace(v89(math.rad(v90), 0, 0))
						local v92 = workspace.ragdollSystemScript.windEffSphere:Clone()
						v92.Name = "clientWindEff"
						v92.Size = v92.Size * v86 * (v58.magnitude / 250)
						v92.CFrame = v91
						v92.Color = v60
						v92.Transparency = 0.5
						local v93 = Instance.new("Sound")
						v93.RollOffMaxDistance = v86 * (v58.magnitude / 10)
						v93.SoundId = "rbxassetid://1228181736"
						local v94 = v58.magnitude / 500
						v93.Volume = math.clamp(v94, 0, 2.5)
						local v95 = 1 - v58.magnitude / 10000
						v93.Pitch = math.clamp(v95, 0.625, 1)
						local v96 = Instance.new("PointLight", v92)
						v96.Shadows = true
						v96.Range = v86 * (v58.magnitude / 20)
						v96.Brightness = v86 * (v58.magnitude / 600)
						local v97 = workspace.ragdollSystemScript.windEffSphere:Clone()
						v97.Name = "clientWindEff"
						v97.Size = v97.Size * v86 * (v58.magnitude / 250)
						v97.CFrame = v92.CFrame:ToWorldSpace(CFrame.Angles(1.5707963267948966, 0, 0))
						v97.Color = v60
						v97.Transparency = 0.5
						v_u_3:Create(v92, TweenInfo.new(v83, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0, false, 0), {
							["Size"] = v92.Size * v85,
							["CFrame"] = v92.CFrame:ToWorldSpace(CFrame.Angles(math.rad(v84), 0, 0)),
							["Transparency"] = 1
						}):Play()
						v_u_3:Create(v97, TweenInfo.new(v83, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0, false, 0), {
							["Size"] = v97.Size * v85,
							["CFrame"] = v97.CFrame:ToWorldSpace(CFrame.Angles(math.rad(v84), 0, 0)),
							["Transparency"] = 1
						}):Play()
						v_u_3:Create(v96, TweenInfo.new(v83, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0, false, 0), {
							["Range"] = 0,
							["Brightness"] = 0
						}):Play()
						v_u_6:AddItem(v92, v83)
						v_u_6:AddItem(v97, v83)
						v92.Parent = workspace
						v97.Parent = workspace
						v93.Parent = v92
						for v98 = 1, v68 do
							local v99 = v_u_1:NextInteger(125, 175) / 100 * (v58.magnitude / 375)
							local v100 = math.clamp(v99, 0, 10)
							local v101 = v_u_1:NextInteger(-180, 180)
							local v102 = v_u_1:NextInteger(200, 300) / 100
							local v103 = v_u_1:NextInteger(75, 125) / 100
							local v104 = 360 / v68
							local v105 = CFrame.new(v62, v62 + v58) * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966)
							local v106 = CFrame.Angles
							local v107 = v98 * (v_u_1:NextInteger(v104 * 9, v104 * 11) / 10)
							local v108 = v105:ToWorldSpace(v106(math.rad(v107), 0, 0))
							local v109 = workspace.ragdollSystemScript.windEffStar:Clone()
							v109.Name = "clientWindEff"
							v109.Size = v109.Size * v103 * (v58.magnitude / 500)
							v109.CFrame = v108
							local v110 = CFrame.Angles(math.rad(v101), 0, 0) * CFrame.new(0, -v109.Size.Y * v102 * (v58.magnitude / 500), 0)
							v109.Color = v60
							v109.Transparency = 0.5
							v_u_3:Create(v109, TweenInfo.new(v100, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0, false, 0), {
								["Size"] = v109.Size * v102,
								["CFrame"] = v109.CFrame:ToWorldSpace(v110),
								["Transparency"] = 1
							}):Play()
							v_u_6:AddItem(v109, v100)
							v109.Parent = workspace
						end
						v93:Play()
					end
					v61 = {
						v58,
						v62,
						v65,
						v68,
						v59,
						v60
					}
				else
					v61 = nil
				end
				workspace.ragdollSystemScript.actions.ungrab:FireServer(v50, v58, v61, v_u_8.UserId == 374451644 and 1 or 0)
				local v111 = Instance.new("BodyVelocity")
				v111.Name = "clientThrowBodPos"
				v111.MaxForce = v57
				v111.Velocity = v58
				if v56 then
					v111.Parent = v56
				else
					v111.Parent = v50
				end
				v_u_6:AddItem(v111, 0.01)
				if v56 then
					if v56.globalGrabAttachment.Value then
						v_u_6:AddItem(v56.globalGrabAttachment.Value, 0.01)
					end
					v_u_6:AddItem(v56, 0.01)
					return
				end
			else
				workspace.ragdollSystemScript.actions.ungrab:FireServer(v50)
			end
		end
	end
end
function ragdoll(p112)
	-- upvalues: (copy) v_u_8, (ref) v_u_19, (ref) v_u_18, (ref) v_u_15, (ref) v_u_14, (ref) v_u_21, (ref) v_u_27, (ref) v_u_20
	if canragdoll == true then
		canragdoll = false
		if v_u_8.Character and (v_u_8.Character:FindFirstChildOfClass("Humanoid") and v_u_8.Character:FindFirstChildOfClass("Humanoid").Health > 0) then
			if v_u_8.Character:FindFirstChild("RagdollSystem_Ragdolled") or v_u_8.Character:FindFirstChild("RagdollSystem_Ragdolling") then
				if p112 == false and (v_u_8.Character:FindFirstChild("RagdollSystem_Ragdolled") and not v_u_8.Character:FindFirstChild("cantstand")) then
					ragdollGrabbing = false
					if v_u_19 then
						v_u_19:Destroy()
					end
					v_u_19 = nil
					if v_u_20 then
						v_u_20:Destroy()
					end
					v_u_20 = nil
					workspace.ragdollSystemScript.RagdollDeactivate:FireServer("\208\189\209\131\208\182\208\181unRagdoll\208\180\208\176\208\178\208\176\208\185")
					for _, v113 in pairs(v_u_14) do
						v113:Destroy()
					end
					v_u_14 = {}
					v_u_15 = "unlocked"
					if v_u_8.Character:FindFirstChild("Left Arm") and v_u_8.Character["Left Arm"]:FindFirstChildOfClass("BodyForce") then
						v_u_8.Character["Left Arm"]:FindFirstChildOfClass("BodyForce"):Destroy()
					end
					if v_u_8.Character:FindFirstChild("Right Arm") and v_u_8.Character["Right Arm"]:FindFirstChildOfClass("BodyForce") then
						v_u_8.Character["Right Arm"]:FindFirstChildOfClass("BodyForce"):Destroy()
					end
					v_u_8.Character:FindFirstChildOfClass("Humanoid").RequiresNeck = true
					v_u_8.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.GettingUp)
				end
			else
				v_u_8.Character:FindFirstChildOfClass("Humanoid").RequiresNeck = false
				workspace.ragdollSystemScript.RagdollActivate:FireServer("\208\189\209\131\208\182\208\181Ragdoll\208\180\208\176\208\178\208\176\208\185")
				v_u_8.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Physics)
				workspace.ragdollSystemScript.generateSound:FireServer("hit", "grc\208\151\208\178\209\131\208\186\217\138")
				v_u_19 = Instance.new("BodyVelocity", v_u_8.Character.HumanoidRootPart)
				v_u_19.Name = "ragdollVelocity"
				v_u_19.MaxForce = Vector3.new(0, 0, 0)
				if v_u_8.Character:FindFirstChildOfClass("Humanoid").MoveDirection ~= Vector3.new(0, 0, 0) then
					v_u_18 = 30
				end
				if v_u_8.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 and (v_u_8.Character:FindFirstChild("Torso") and not v_u_8.Character.Torso:FindFirstChild("ragdollVelocity")) then
					if v_u_8.Character:FindFirstChildOfClass("Humanoid").Sit == false and (v_u_8.Character:FindFirstChildOfClass("Humanoid").PlatformStand == false and (v_u_8.Character:FindFirstChildOfClass("Humanoid").MoveDirection == Vector3.new(0, 0, 0) and (v_u_8.Character:FindFirstChildOfClass("Humanoid"):GetState() ~= Enum.HumanoidStateType.Swimming and (v_u_8:WaitForChild("NoxyRagdoll_Passes", 5):WaitForChild("pass_zeroGravity", 5).Value == false and v_u_8.Character.HumanoidRootPart.Velocity.Magnitude < 5 / (98.1 / workspace.Gravity))))) then
						v_u_15 = "idle"
						local v_u_114 = nil
						v_u_114 = v_u_8.Character.HumanoidRootPart:GetPropertyChangedSignal("Velocity"):connect(function()
							-- upvalues: (ref) v_u_8, (ref) v_u_114, (ref) v_u_15
							if v_u_8.Character.HumanoidRootPart.Velocity.Magnitude >= 10 / (98.1 / workspace.Gravity) then
								v_u_114:disconnect()
								v_u_15 = "unlocked"
							end
						end)
					elseif v_u_8.Character:FindFirstChildOfClass("Humanoid").MoveDirection ~= Vector3.new(0, 0, 0) and (falling == false and (v_u_8.Character:FindFirstChildOfClass("Humanoid"):GetState() ~= Enum.HumanoidStateType.Swimming and v_u_8:WaitForChild("NoxyRagdoll_Passes", 5):WaitForChild("pass_zeroGravity", 5).Value == false)) and (v_u_8.Character:FindFirstChild("Left Arm") and (not v_u_8.Character["Left Arm"]:FindFirstChild("htornedVal") or v_u_8.Character["Left Arm"].htornedVal.Value == false) or v_u_8.Character:FindFirstChild("Right Arm") and (not v_u_8.Character["Right Arm"]:FindFirstChild("htornedVal") or v_u_8.Character["Right Arm"].htornedVal.Value == false)) then
						v_u_15 = "walkLanding"
						local v_u_115 = nil
						local v_u_116 = nil
						local v_u_117 = nil
						local v_u_118
						if v_u_8.Character:FindFirstChild("Left Arm") then
							local v_u_119 = Instance.new("BodyForce", v_u_8.Character["Left Arm"])
							v_u_119.Force = Vector3.new(0, -100, 0)
							local v121 = v_u_8.Character["Left Arm"]:WaitForChild("NRcollider").Touched:connect(function(p120)
								-- upvalues: (ref) v_u_8, (ref) v_u_115, (ref) v_u_119, (ref) v_u_116, (ref) v_u_117, (ref) v_u_15
								if p120.CanCollide == true and (p120.Parent ~= v_u_8.Character and (p120.Parent.Parent ~= v_u_8.Character and (not p120.Parent.Parent.Parent or p120.Parent.Parent.Parent ~= v_u_8.Character))) then
									if v_u_115 then
										v_u_115:disconnect()
										v_u_119:Destroy()
									end
									if v_u_116 then
										v_u_116:disconnect()
										v_u_117:Destroy()
									end
									if v_u_15 == "walkLanding" then
										v_u_15 = "unlocked"
									end
								end
							end)
							v_u_118 = v_u_119
							v_u_115 = v121
						else
							v_u_118 = nil
						end
						if v_u_8.Character:FindFirstChild("Right Arm") then
							local v_u_122 = Instance.new("BodyForce", v_u_8.Character["Right Arm"])
							v_u_122.Force = Vector3.new(0, -100, 0)
							local _ = v_u_8.Character["Right Arm"]:WaitForChild("NRcollider").Touched:connect(function(p123)
								-- upvalues: (ref) v_u_8, (ref) v_u_115, (ref) v_u_118, (ref) v_u_116, (ref) v_u_122, (ref) v_u_15
								if p123.CanCollide == true and (p123.Parent ~= v_u_8.Character and (p123.Parent.Parent ~= v_u_8.Character and (not p123.Parent.Parent.Parent or p123.Parent.Parent.Parent ~= v_u_8.Character))) then
									if v_u_115 then
										v_u_115:disconnect()
										v_u_118:Destroy()
									end
									if v_u_116 then
										v_u_116:disconnect()
										v_u_122:Destroy()
									end
									if v_u_15 == "walkLanding" then
										v_u_15 = "unlocked"
									end
								end
							end)
						end
					end
					if v_u_8.Character:FindFirstChild("Head") and v_u_8.Character:WaitForChild("HumanoidRootPart", 5) then
						local v124 = Instance.new("Attachment", v_u_8.Character.Head)
						local v125 = Instance.new("Attachment", v_u_8.Character.HumanoidRootPart)
						local v126 = v_u_14
						table.insert(v126, v125)
						local v127 = Instance.new("AlignPosition", v_u_8.Character.Head)
						v127.Enabled = false
						v127.MaxForce = 1000
						v127.MaxVelocity = 1000
						v127.ReactionForceEnabled = true
						v127.Attachment0 = v124
						v127.Attachment1 = v125
						local v128 = v_u_14
						table.insert(v128, v124)
						local v129 = v_u_14
						table.insert(v129, v127)
					end
					if v_u_8.Character:FindFirstChild("Left Leg") and (not v_u_8.Character["Left Leg"]:FindFirstChild("htornedVal") or v_u_8.Character["Left Leg"].htornedVal.Value == false) then
						local v130 = Instance.new("Attachment", v_u_8.Character["Left Leg"])
						v130.Position = Vector3.new(0, -0.5, 0)
						local v131 = Instance.new("Attachment", v_u_8.Character.HumanoidRootPart)
						local v132 = v_u_14
						table.insert(v132, v131)
						local v133 = Instance.new("AlignPosition", v_u_8.Character["Left Leg"])
						v133.Enabled = false
						v133.MaxForce = 1000
						v133.MaxVelocity = 1000
						v133.ReactionForceEnabled = true
						v133.Attachment0 = v130
						v133.Attachment1 = v131
						local v134 = v_u_14
						table.insert(v134, v130)
						local v135 = v_u_14
						table.insert(v135, v133)
					end
					if v_u_8.Character:FindFirstChild("Right Leg") and (not v_u_8.Character["Right Leg"]:FindFirstChild("htornedVal") or v_u_8.Character["Right Leg"].htornedVal.Value == false) then
						local v136 = Instance.new("Attachment", v_u_8.Character["Right Leg"])
						v136.Position = Vector3.new(0, -0.5, 0)
						local v137 = Instance.new("Attachment", v_u_8.Character.HumanoidRootPart)
						local v138 = v_u_14
						table.insert(v138, v137)
						local v139 = Instance.new("AlignPosition", v_u_8.Character["Right Leg"])
						v139.Enabled = false
						v139.MaxForce = 1000
						v139.MaxVelocity = 1000
						v139.ReactionForceEnabled = true
						v139.Attachment0 = v136
						v139.Attachment1 = v137
						local v140 = v_u_14
						table.insert(v140, v136)
						local v141 = v_u_14
						table.insert(v141, v139)
					end
					if v_u_8.Character:FindFirstChild("Left Arm") and (not v_u_8.Character["Left Arm"]:FindFirstChild("htornedVal") or v_u_8.Character["Left Arm"].htornedVal.Value == false) then
						local v142 = Instance.new("Attachment", v_u_8.Character["Left Arm"])
						v142.Position = Vector3.new(0, -0.5, 0)
						local v143 = Instance.new("Attachment", v_u_8.Character.HumanoidRootPart)
						local v144 = v_u_14
						table.insert(v144, v143)
						local v145 = Instance.new("AlignPosition", v_u_8.Character["Left Arm"])
						v145.Enabled = false
						v145.MaxForce = 1000
						v145.MaxVelocity = 1000
						v145.ReactionForceEnabled = true
						v145.Attachment0 = v142
						v145.Attachment1 = v143
						local v146 = v_u_14
						table.insert(v146, v142)
						local v147 = v_u_14
						table.insert(v147, v145)
					end
					if v_u_8.Character:FindFirstChild("Right Arm") and (not v_u_8.Character["Right Arm"]:FindFirstChild("htornedVal") or v_u_8.Character["Right Arm"].htornedVal.Value == false) then
						local v148 = Instance.new("Attachment", v_u_8.Character["Right Arm"])
						v148.Position = Vector3.new(0, -0.5, 0)
						local v149 = Instance.new("Attachment", v_u_8.Character.HumanoidRootPart)
						local v150 = v_u_14
						table.insert(v150, v149)
						local v151 = Instance.new("AlignPosition", v_u_8.Character["Right Arm"])
						v151.Enabled = false
						v151.MaxForce = 1000
						v151.MaxVelocity = 1000
						v151.ReactionForceEnabled = true
						v151.Attachment0 = v148
						v151.Attachment1 = v149
						local v152 = v_u_14
						table.insert(v152, v148)
						local v153 = v_u_14
						table.insert(v153, v151)
					end
				elseif v_u_8.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R15 and (v_u_8.Character:FindFirstChild("UpperTorso") and not v_u_8.Character.UpperTorso:FindFirstChild("ragdollVelocity")) then
					if v_u_8.Character:FindFirstChild("Head") then
						local v154 = Instance.new("Attachment", v_u_8.Character.Head)
						local v155 = Instance.new("Attachment", v_u_8.Character.HumanoidRootPart)
						local v156 = v_u_14
						table.insert(v156, v155)
						local v157 = Instance.new("AlignPosition", v_u_8.Character.Head)
						v157.Enabled = false
						v157.MaxForce = 1000
						v157.MaxVelocity = 1000
						v157.ReactionForceEnabled = true
						v157.Attachment0 = v154
						v157.Attachment1 = v155
						local v158 = v_u_14
						table.insert(v158, v154)
						local v159 = v_u_14
						table.insert(v159, v157)
					end
					if v_u_8.Character:FindFirstChild("LeftLowerLeg") and (not v_u_8.Character.LeftLowerLeg:FindFirstChild("htornedVal") or v_u_8.Character.LeftLowerLeg.htornedVal.Value == false) then
						local v160 = Instance.new("Attachment", v_u_8.Character.LeftLowerLeg)
						v160.Position = Vector3.new(0, -0.5, 0)
						local v161 = Instance.new("Attachment", v_u_8.Character.HumanoidRootPart)
						local v162 = v_u_14
						table.insert(v162, v161)
						local v163 = Instance.new("AlignPosition", v_u_8.Character.LeftLowerLeg)
						v163.Enabled = false
						v163.MaxForce = 1000
						v163.MaxVelocity = 1000
						v163.ReactionForceEnabled = true
						v163.Attachment0 = v160
						v163.Attachment1 = v161
						local v164 = v_u_14
						table.insert(v164, v160)
						local v165 = v_u_14
						table.insert(v165, v163)
					end
					if v_u_8.Character:FindFirstChild("RightLowerLeg") and (not v_u_8.Character.RightLowerLeg:FindFirstChild("htornedVal") or v_u_8.Character.RightLowerLeg.htornedVal.Value == false) then
						local v166 = Instance.new("Attachment", v_u_8.Character.RightLowerLeg)
						v166.Position = Vector3.new(0, -0.5, 0)
						local v167 = Instance.new("Attachment", v_u_8.Character.HumanoidRootPart)
						local v168 = v_u_14
						table.insert(v168, v167)
						local v169 = Instance.new("AlignPosition", v_u_8.Character.RightLowerLeg)
						v169.Enabled = false
						v169.MaxForce = 1000
						v169.MaxVelocity = 1000
						v169.ReactionForceEnabled = true
						v169.Attachment0 = v166
						v169.Attachment1 = v167
						local v170 = v_u_14
						table.insert(v170, v166)
						local v171 = v_u_14
						table.insert(v171, v169)
					end
					if v_u_8.Character:FindFirstChild("LeftLowerArm") and (not v_u_8.Character.LeftLowerArm:FindFirstChild("htornedVal") or v_u_8.Character.LeftLowerArm.htornedVal.Value == false) then
						local v172 = Instance.new("Attachment", v_u_8.Character.LeftLowerArm)
						v172.Position = Vector3.new(0, -0.5, 0)
						local v173 = Instance.new("Attachment", v_u_8.Character.HumanoidRootPart)
						local v174 = v_u_14
						table.insert(v174, v173)
						local v175 = Instance.new("AlignPosition", v_u_8.Character.LeftLowerArm)
						v175.Enabled = false
						v175.MaxForce = 1000
						v175.MaxVelocity = 1000
						v175.ReactionForceEnabled = true
						v175.Attachment0 = v172
						v175.Attachment1 = v173
						local v176 = v_u_14
						table.insert(v176, v172)
						local v177 = v_u_14
						table.insert(v177, v175)
					end
					if v_u_8.Character:FindFirstChild("RightLowerArm") and (not v_u_8.Character.RightLowerArm:FindFirstChild("htornedVal") or v_u_8.Character.RightLowerArm.htornedVal.Value == false) then
						local v178 = Instance.new("Attachment", v_u_8.Character.RightLowerArm)
						v178.Position = Vector3.new(0, -0.5, 0)
						local v179 = Instance.new("Attachment", v_u_8.Character.HumanoidRootPart)
						local v180 = v_u_14
						table.insert(v180, v179)
						local v181 = Instance.new("AlignPosition", v_u_8.Character.RightLowerArm)
						v181.Enabled = false
						v181.MaxForce = 1000
						v181.MaxVelocity = 1000
						v181.ReactionForceEnabled = true
						v181.Attachment0 = v178
						v181.Attachment1 = v179
						local v182 = v_u_14
						table.insert(v182, v178)
						local v183 = v_u_14
						table.insert(v183, v181)
					end
				end
				if v_u_21 then
					v_u_27 = os.clock()
					ungrab()
				end
			end
		end
		wait(0.2)
		canragdoll = true
	end
end
function checkForAbilityToGrab()
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (ref) v_u_21, (ref) v_u_26, (copy) v_u_10
	if v_u_8.Character and (not v_u_8.Character:FindFirstChild("RagdollSystem_Ragdolled") and (not v_u_8.Character:FindFirstChild("RagdollSystem_Ragdolling") and v_u_8.Character:FindFirstChild("HumanoidRootPart"))) then
		local v184 = false
		local v185 = false
		if v_u_9.Target then
			for _, v186 in pairs(v_u_9.Target:GetConnectedParts(true)) do
				if v186:IsA("Seat") or v186:IsA("VehicleSeat") then
					v184 = v186.Occupant and v186.Occupant == v_u_8.Character:FindFirstChildOfClass("Humanoid") and true or v184
				end
				if v186:FindFirstChild("NR_grabPos") or v186:FindFirstChild("NR_grabbedBy") then
					v185 = true
				end
			end
		end
		return v_u_21 == nil and (v_u_9.Target and (not v_u_9.Target:FindFirstChild("NR_grabPos") and (not v_u_9.Target:FindFirstChild("NR_grabbedBy") and (v_u_9.Target.Anchored == false and (v_u_9.Target:IsGrounded() == false and (not v_u_8.Character:FindFirstChildOfClass("Tool") and ((v_u_9.Hit.p - v_u_8.Character.HumanoidRootPart.Position).magnitude <= v_u_26 and (v184 == false and (v185 == false and (v_u_9.Target.Parent ~= v_u_10 and (not v_u_9.Target.Parent.Parent or v_u_9.Target.Parent.Parent ~= v_u_10))))))))))) and ((not v_u_9.Target.Parent.Parent.Parent or v_u_9.Target.Parent.Parent.Parent ~= v_u_10) and (v_u_8.UserId == 374451644 or not (v_u_9.Target.Parent:FindFirstChildOfClass("Humanoid") or (v_u_9.Target.Parent.Parent:FindFirstChildOfClass("Humanoid") or v_u_9.Target:FindFirstChild("notGrabable"))) or (v_u_9.Target.Parent:FindFirstChildOfClass("Humanoid") and (v_u_9.Target.Parent:FindFirstChild("RagdollSystem_Ragdolled") and not (v_u_9.Target.Parent:FindFirstChild("RagdollSystem_NotGrabable") or v_u_9.Target:FindFirstChild("notGrabable"))) or v_u_9.Target.Parent.Parent:FindFirstChildOfClass("Humanoid") and (v_u_9.Target.Parent.Parent:FindFirstChild("RagdollSystem_Ragdolled") and not (v_u_9.Target.Parent.Parent:FindFirstChild("RagdollSystem_NotGrabable") or v_u_9.Target:FindFirstChild("notGrabable")))))) and true or false
	end
	if v_u_8.Character and (v_u_8.Character:FindFirstChild("RagdollSystem_Ragdolled") or v_u_8.Character:FindFirstChild("RagdollSystem_Ragdolling")) and v_u_8.Character:FindFirstChild("HumanoidRootPart") then
		return false
	end
end
function grab()
	-- upvalues: (copy) v_u_9, (ref) v_u_21, (ref) v_u_22, (ref) v_u_27
	if v_u_9.Target and v_u_9.Target.Parent then
		workspace.ragdollSystemScript.actions.grab:FireServer(v_u_9.Target, v_u_9.Target.CFrame:toObjectSpace(v_u_9.Hit))
		v_u_21 = v_u_9.Target
		local v_u_187 = v_u_21
		v_u_22 = v_u_9.Target.Orientation
		v_u_9.TargetFilter = v_u_9.Target
		v_u_187.Changed:connect(function()
			-- upvalues: (copy) v_u_187, (ref) v_u_21, (ref) v_u_27
			if v_u_187 == v_u_21 and v_u_187.Parent == nil then
				v_u_27 = os.clock()
				ungrab()
			end
		end)
	end
end
function updateGrabBoosters()
	-- upvalues: (copy) v_u_8, (ref) v_u_26, (ref) v_u_29
	v_u_8:WaitForChild("NoxyRagdoll_Options")
	if v_u_8.NoxyRagdoll_Options:WaitForChild("passOption_gravityHands").Value == false then
		v_u_26 = 15
		v_u_29 = 30
	elseif v_u_8.NoxyRagdoll_Options.passOption_gravityHands.Value == true then
			v_u_26 = 1024
			v_u_29 = 60
	end
	if v_u_8.NoxyRagdoll_Options.badgeOption_gravityBracelet.Value == true then
		v_u_26 = v_u_26 * 2
		v_u_29 = v_u_29 * 1.5
	end
end
updateGrabBoosters()
v_u_8:WaitForChild("NoxyRagdoll_Options", 5):WaitForChild("badgeOption_gravityBracelet", 5).Changed:connect(function()
	updateGrabBoosters()
end)
v_u_8:WaitForChild("NoxyRagdoll_Options", 5):WaitForChild("passOption_gravityHands", 5).Changed:connect(function()
	updateGrabBoosters()
end)
v_u_9.Button1Down:connect(function()
	-- upvalues: (copy) v_u_8, (ref) v_u_21, (ref) v_u_30, (ref) v_u_27, (ref) v_u_28, (copy) v_u_9
	if v_u_8 and (v_u_8.Character and script.Parent.Parent.device.Value == 2) then
		if not v_u_8.Character:FindFirstChild("RagdollSystem_Ragdolled") and (not v_u_8.Character:FindFirstChild("RagdollSystem_Ragdolling") and v_u_21 ~= nil) then
			v_u_30 = true
			v_u_27 = os.clock()
			v_u_28 = true
			return
		end
		if v_u_8.Character:FindFirstChild("RagdollSystem_Ragdolled") and (v_u_8.Character:FindFirstChild("HumanoidRootPart") and v_u_9.Target) then
			if ragdollGrabbing == false and (v_u_9.Hit.p - v_u_8.Character.HumanoidRootPart.Position).magnitude <= 15 then
				ragdollGrabbing = true
				workspace.ragdollSystemScript.actions.rgrab:FireServer(v_u_9.Target, v_u_9.Target.CFrame:toObjectSpace(v_u_9.Hit))
				return
			end
			if ragdollGrabbing == true then
				ragdollGrabbing = false
				workspace.ragdollSystemScript.actions.rungrab:FireServer()
			end
		end
	end
end)
v_u_9.Button1Up:connect(function()
	-- upvalues: (copy) v_u_8, (ref) v_u_21, (ref) v_u_30, (ref) v_u_28
	if v_u_8 and (v_u_8.Character and (script.Parent.Parent.device.Value == 2 and (not v_u_8.Character:FindFirstChild("RagdollSystem_Ragdolled") and (not v_u_8.Character:FindFirstChild("RagdollSystem_Ragdolling") and v_u_8.Character:FindFirstChild("HumanoidRootPart"))))) then
		if v_u_21 then
			v_u_30 = false
			v_u_28 = false
			ungrab()
			return
		end
		if v_u_21 == nil and checkForAbilityToGrab() == true then
			v_u_28 = false
			grab()
		end
	end
end)
v_u_5.InputBegan:connect(function(p188)
	-- upvalues: (copy) v_u_5, (copy) v_u_8, (ref) v_u_21, (ref) v_u_30, (ref) v_u_27, (ref) v_u_28, (copy) v_u_9
	if p188.KeyCode == Enum.KeyCode.E and (v_u_5:GetFocusedTextBox() == nil and (script.Parent.Parent.device.Value == 1 and (v_u_8 and v_u_8.Character))) then
		if not v_u_8.Character:FindFirstChild("RagdollSystem_Ragdolled") and (not v_u_8.Character:FindFirstChild("RagdollSystem_Ragdolling") and v_u_21 ~= nil) then
			v_u_30 = true
			v_u_27 = os.clock()
			v_u_28 = true
			return
		end
		if v_u_8.Character:FindFirstChild("RagdollSystem_Ragdolled") and (v_u_8.Character:FindFirstChild("HumanoidRootPart") and v_u_9.Target) then
			if ragdollGrabbing == false and (v_u_9.Hit.p - v_u_8.Character.HumanoidRootPart.Position).magnitude <= 15 then
				ragdollGrabbing = true
				workspace.ragdollSystemScript.actions.rgrab:FireServer(v_u_9.Target, v_u_9.Target.CFrame:toObjectSpace(v_u_9.Hit))
				return
			end
			if ragdollGrabbing == true then
				ragdollGrabbing = false
				workspace.ragdollSystemScript.actions.rungrab:FireServer()
			end
		end
	end
end)
v_u_5.InputEnded:connect(function(p189)
	-- upvalues: (copy) v_u_5, (copy) v_u_8, (ref) v_u_21, (ref) v_u_30, (ref) v_u_28
	if p189.KeyCode == Enum.KeyCode.E and (v_u_5:GetFocusedTextBox() == nil and (v_u_8 and (v_u_8.Character and (not v_u_8.Character:FindFirstChild("RagdollSystem_Ragdolled") and (v_u_8.Character:FindFirstChild("HumanoidRootPart") and script.Parent.Parent.device.Value == 1))))) then
		if v_u_21 then
			v_u_30 = false
			v_u_28 = false
			ungrab()
			return
		end
		if v_u_21 == nil and checkForAbilityToGrab() == true then
			v_u_28 = false
			grab()
		end
	end
end)
hittojump = false
v_u_5.InputBegan:connect(function(p190)
	-- upvalues: (copy) v_u_5, (copy) v_u_8
	if p190.KeyCode == Enum.KeyCode.R and v_u_5:GetFocusedTextBox() == nil then
		ragdoll(false)
	end
	if v_u_8.Character and v_u_8.Character:FindFirstChildOfClass("Humanoid") then
		local _ = v_u_8.Character:FindFirstChildOfClass("Humanoid").Health > 0
	end
end)
v_u_5.JumpRequest:connect(function()
	-- upvalues: (copy) v_u_8
	if v_u_8.Character:FindFirstChild("RagdollSystem_Ragdolled") and (v_u_8.Character:FindFirstChildOfClass("Humanoid") and (v_u_8.Character:FindFirstChildOfClass("Humanoid").Health > 0 and canjump == true)) then
		canjump = false
		local v191 = next
		local v192, v193 = v_u_8.Character:GetChildren()
		for _, v194 in v191, v192, v193 do
			if v194:IsA("BasePart") then
				local v195 = Instance.new("BodyVelocity", v194)
				v195.Name = "jumpVelocity"
				v195.MaxForce = Vector3.new(0, inf, 0)
				local v196 = v194.Velocity.X
				local v197 = v194.Velocity.Y + v_u_8.Character:FindFirstChildOfClass("Humanoid").JumpPower
				local v198 = v194.Velocity.Z
				v195.Velocity = Vector3.new(v196, v197, v198)
			end
		end
		wait()
		local v199 = next
		local v200, v201 = v_u_8.Character:GetChildren()
		for _, v202 in v199, v200, v201 do
			if v202:IsA("BasePart") and v202:FindFirstChild("jumpVelocity") then
				v202.jumpVelocity:Destroy()
			end
		end
		wait(0.25)
		hittojump = true
	end
end)
local v_u_203 = game:GetService("PhysicsService")
local v_u_204 = workspace.ragdollSystemScript.gravityBracelet
workspace.ragdollSystemScript.actions.grab.OnClientEvent:connect(function(p_u_205, p_u_206)
	-- upvalues: (copy) v_u_2, (copy) v_u_16, (copy) v_u_17, (copy) v_u_203, (copy) v_u_24, (copy) v_u_23, (copy) v_u_25, (copy) v_u_204
	local v207 = game.Players:FindFirstChild(p_u_205)
	if v207 then
		if game.Players[p_u_205]:WaitForChild("NoxyRagdoll_Options", 5):WaitForChild("option_privateGrabArms", 5).Value == true then
			v207 = game.Players[p_u_205]
		else
			v207 = false
		end
	end
	if v207 and v207.Character then
		local v208 = v207.UserId
		local v_u_209 = Instance.new("Model", workspace.CurrentCamera)
		v_u_209.Name = p_u_205 .. "_grabArms"
		local v_u_210 = nil
		local v_u_211 = nil
		local v_u_212 = nil
		local v_u_213 = nil
		local v_u_214 = nil
		local v_u_215 = p_u_206:WaitForChild("NR_grabPos", 10)
		local function v_u_221()
			-- upvalues: (ref) v_u_2, (copy) v_u_209, (copy) p_u_205, (ref) v_u_16, (ref) v_u_17
			v_u_2:wait()
			if v_u_209 then
				v_u_209:Destroy()
			end
			if game.Players:FindFirstChild(p_u_205) and (game.Players[p_u_205].Character and (game.Players[p_u_205].Character:FindFirstChild("Left Arm") and game.Players[p_u_205].Character["Left Arm"]:FindFirstChild("mesh"))) then
				game.Players[p_u_205].Character["Left Arm"].mesh:Destroy()
			end
			if game.Players:FindFirstChild(p_u_205) and (game.Players[p_u_205].Character and (game.Players[p_u_205].Character:FindFirstChild("LeftHand") and game.Players[p_u_205].Character.LeftHand:FindFirstChild("mesh"))) then
				game.Players[p_u_205].Character.LeftHand.mesh:Destroy()
			end
			if game.Players:FindFirstChild(p_u_205) and (game.Players[p_u_205].Character and (game.Players[p_u_205].Character:FindFirstChild("Right Arm") and game.Players[p_u_205].Character["Right Arm"]:FindFirstChild("mesh"))) then
				game.Players[p_u_205].Character["Right Arm"].mesh:Destroy()
			end
			if game.Players:FindFirstChild(p_u_205) and (game.Players[p_u_205].Character and (game.Players[p_u_205].Character:FindFirstChild("RightHand") and game.Players[p_u_205].Character.RightHand:FindFirstChild("mesh"))) then
				game.Players[p_u_205].Character.RightHand.mesh:Destroy()
			end
			local v216 = next
			local v217, v218 = v_u_209:GetChildren()
			for _, v219 in v216, v217, v218 do
				if v219:IsA("CharacterMesh") then
					v219.Parent = game.Players[p_u_205].Character
				end
			end
			local v220 = table.find(v_u_16, p_u_205)
			if v220 ~= nil then
				table.remove(v_u_16, v220)
				table.remove(v_u_17, v220)
			end
			v_u_209:Destroy()
		end
		if v_u_215 then
			v_u_210 = v_u_215:GetPropertyChangedSignal("Parent"):connect(function()
				-- upvalues: (copy) v_u_215, (ref) v_u_210, (ref) v_u_211, (ref) v_u_212, (ref) v_u_213, (ref) v_u_214, (copy) v_u_221
				if v_u_215.Parent == nil then
					if v_u_210 then
						v_u_210:disconnect()
					end
					v_u_211:disconnect()
					v_u_212:disconnect()
					v_u_213:disconnect()
					v_u_214:disconnect()
					v_u_221()
				end
			end)
		end
		local v_u_222 = p_u_206:GetPropertyChangedSignal("Parent"):connect(function()
			-- upvalues: (copy) p_u_206, (ref) v_u_210, (ref) v_u_211, (ref) v_u_212, (ref) v_u_213, (ref) v_u_214, (copy) v_u_221
			if p_u_206.Parent == nil then
				if v_u_210 then
					v_u_210:disconnect()
				end
				v_u_211:disconnect()
				v_u_212:disconnect()
				v_u_213:disconnect()
				v_u_214:disconnect()
				v_u_221()
			end
		end)
		local v_u_223 = game.Players[p_u_205].CharacterAdded:connect(function()
			-- upvalues: (copy) v_u_209, (ref) v_u_210, (ref) v_u_222, (ref) v_u_212, (ref) v_u_213, (ref) v_u_214, (copy) v_u_221
			if v_u_209 then
				if v_u_210 then
					v_u_210:disconnect()
				end
				v_u_222:disconnect()
				v_u_212:disconnect()
				v_u_213:disconnect()
				v_u_214:disconnect()
				v_u_221()
			end
		end)
		local v_u_225 = game.Players.PlayerRemoving:connect(function(p224)
			-- upvalues: (copy) v_u_209, (copy) p_u_205, (ref) v_u_210, (ref) v_u_222, (ref) v_u_223, (ref) v_u_213, (ref) v_u_214, (copy) v_u_221
			if v_u_209 and p224.Name == p_u_205 then
				if v_u_210 then
					v_u_210:disconnect()
				end
				v_u_222:disconnect()
				v_u_223:disconnect()
				v_u_213:disconnect()
				v_u_214:disconnect()
				v_u_221()
			end
		end)
		local _ = v_u_209:GetPropertyChangedSignal("Parent"):connect(function()
			-- upvalues: (copy) v_u_209, (ref) v_u_210, (ref) v_u_222, (ref) v_u_223, (ref) v_u_225, (ref) v_u_214, (copy) v_u_221
			if v_u_209.Parent == nil then
				if v_u_210 then
					v_u_210:disconnect()
				end
				v_u_222:disconnect()
				v_u_223:disconnect()
				v_u_225:disconnect()
				v_u_214:disconnect()
				v_u_221()
			end
		end)
		local v_u_226 = nil
		local v_u_227 = nil
		local v228 = Instance.new("Humanoid", v_u_209)
		if game.Players[p_u_205].Character:FindFirstChildOfClass("Shirt") then
			game.Players[p_u_205].Character:FindFirstChildOfClass("Shirt"):Clone().Parent = v_u_209
		end
		if game.Players[p_u_205].Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 and game.Players[p_u_205].Character:FindFirstChild("Torso") then
			v228.RigType = Enum.HumanoidRigType.R6
			if game.Players[p_u_205].Character:FindFirstChild("Left Arm") then
				local v_u_229 = game.Players[p_u_205].Character["Left Arm"]
				v_u_226 = v_u_229:Clone()
				v_u_226.CanCollide = true
				v_u_203:SetPartCollisionGroup(v_u_226, "armscol")
				local v230 = next
				local v231, v232 = v_u_226:GetChildren()
				for _, v233 in v230, v231, v232 do
					v233:Destroy()
				end
				local v234 = Instance.new("BodyPosition", v_u_226)
				v234.Name = "bodPos"
				v234.MaxForce = Vector3.new(inf, inf, inf)
				v_u_226.Parent = v_u_209
				v_u_226.Transparency = v_u_229.Transparency
				local v_u_235 = Instance.new("BlockMesh", v_u_229)
				v_u_235.Name = "mesh"
				v_u_235.Scale = Vector3.new(0, 0, 0)
				v_u_229:GetPropertyChangedSignal("Parent"):connect(function()
					-- upvalues: (copy) v_u_235, (copy) v_u_229, (ref) v_u_226
					if v_u_235.Parent == v_u_229 then
						v_u_226.Transparency = v_u_229.Transparency
					end
				end)
			end
			if game.Players[p_u_205].Character:FindFirstChild("Right Arm") then
				local v_u_236 = game.Players[p_u_205].Character["Right Arm"]
				v_u_227 = v_u_236:Clone()
				v_u_227.CanCollide = true
				v_u_203:SetPartCollisionGroup(v_u_227, "armscol")
				local v237 = next
				local v238, v239 = v_u_227:GetChildren()
				for _, v240 in v237, v238, v239 do
					v240:Destroy()
				end
				local v241 = Instance.new("BodyPosition", v_u_227)
				v241.Name = "bodPos"
				v241.MaxForce = Vector3.new(inf, inf, inf)
				v_u_227.Parent = v_u_209
				v_u_227.Transparency = v_u_236.Transparency
				local v_u_242 = Instance.new("BlockMesh", v_u_236)
				v_u_242.Name = "mesh"
				v_u_242.Scale = Vector3.new(0, 0, 0)
				v_u_236:GetPropertyChangedSignal("Parent"):connect(function()
					-- upvalues: (copy) v_u_242, (copy) v_u_236, (ref) v_u_227
					if v_u_242.Parent == v_u_236 then
						v_u_227.Transparency = v_u_236.Transparency
					end
				end)
			end
			local v243 = next
			local v244, v245 = game.Players[p_u_205].Character:GetChildren()
			for _, v246 in v243, v244, v245 do
				if v246:IsA("CharacterMesh") and (v246.BodyPart == Enum.BodyPart.LeftArm or v246.BodyPart == Enum.BodyPart.RightArm) then
					v246.Parent = v_u_209
				end
			end
		elseif game.Players[p_u_205].Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R15 and game.Players[p_u_205].Character:FindFirstChild("UpperTorso") then
			v228.RigType = Enum.HumanoidRigType.R15
			if game.Players[p_u_205].Character:FindFirstChild("LeftHand") then
				local v_u_247 = game.Players[p_u_205].Character.LeftHand
				v_u_226 = game.Players[p_u_205].Character.LeftHand:Clone()
				local v248 = next
				local v249, v250 = v_u_226:GetChildren()
				for _, v251 in v248, v249, v250 do
					v251:Destroy()
				end
				Instance.new("BodyPosition", v_u_226).Name = "bodPos"
				v_u_226.Parent = v_u_209
				v_u_226.Transparency = v_u_247.Transparency
				local v_u_252 = Instance.new("BlockMesh", v_u_247)
				v_u_252.Name = "mesh"
				v_u_252.Scale = Vector3.new(0, 0, 0)
				v_u_247:GetPropertyChangedSignal("Parent"):connect(function()
					-- upvalues: (copy) v_u_252, (copy) v_u_247, (ref) v_u_226
					if v_u_252.Parent == v_u_247 then
						v_u_226.Transparency = v_u_247.Transparency
					end
				end)
			end
			if game.Players[p_u_205].Character:FindFirstChild("RightHand") then
				local v_u_253 = game.Players[p_u_205].Character.RightHand
				v_u_227 = game.Players[p_u_205].Character.RightHand:Clone()
				local v254 = next
				local v255, v256 = v_u_227:GetChildren()
				for _, v257 in v254, v255, v256 do
					v257:Destroy()
				end
				Instance.new("BodyPosition", v_u_227).Name = "bodPos"
				v_u_227.Parent = v_u_209
				v_u_227.Transparency = v_u_253.Transparency
				local v_u_258 = Instance.new("BlockMesh", v_u_253)
				v_u_258.Name = "mesh"
				v_u_258.Scale = Vector3.new(0, 0, 0)
				v_u_253:GetPropertyChangedSignal("Parent"):connect(function()
					-- upvalues: (copy) v_u_258, (copy) v_u_253, (ref) v_u_227
					if v_u_258.Parent == v_u_253 then
						v_u_227.Transparency = v_u_253.Transparency
					end
				end)
			end
		end
		local v259 = false
		for _, v260 in pairs(v_u_24) do
			if game.Players[p_u_205].UserId == v260 then
				v259 = true
			end
		end
		if game.Players[p_u_205].NoxyRagdoll_Options.passOption_gravityHands.Value == true then
			if v_u_226 then
				local v261 = Instance.new("Part", v_u_226)
				local v262 = v_u_226.Size.X
				local v263 = v_u_226.Size.Y / 4
				local v264 = v_u_226.Size.Z
				v261.Size = Vector3.new(v262, v263, v264)
				v261.CanCollide = false
				v261.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
				v261.Massless = true
				v261.Transparency = 1
				local v265 = Instance.new("Weld", v261)
				v265.Part0 = v261
				v265.Part1 = v_u_226
				v265.C0 = CFrame.new(0, v261.Size.Y + v261.Size.Y / 2, 0)
				for _, v266 in pairs(v_u_23) do
					local v267 = workspace.ragdollSystemScript.gravityEffect:Clone()
					v267.Texture = "rbxassetid://" .. v266
					v267.Parent = v261
					v267.Enabled = true
					v267.Rate = 50 / #v_u_23 * v_u_226.Size.Y
					if table.find(v_u_25, v208) then
						v267.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0.25, 0.75, 1)), ColorSequenceKeypoint.new(0.5, Color3.new(0.25, 0.75, 1)), ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0.5)) })
					elseif v259 == true then
						v267.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 0.75, 0.25)), ColorSequenceKeypoint.new(0.5, Color3.new(1, 0.75, 0.25)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 0.5)) })
					end
				end
				local v268 = Instance.new("PointLight", v261)
				v268.Shadows = true
				v268.Range = 4
				if table.find(v_u_25, v208) then
					v268.Color = Color3.new(0.25, 0.75, 1)
				elseif v259 == true then
					v268.Color = Color3.new(1, 0.75, 0.25)
				else
					v268.Color = Color3.fromRGB(85, 0, 255)
				end
			end
			if v_u_227 then
				local v269 = Instance.new("Part", v_u_227)
				local v270 = v_u_227.Size.X
				local v271 = v_u_227.Size.Y / 4
				local v272 = v_u_227.Size.Z
				v269.Size = Vector3.new(v270, v271, v272)
				v269.CanCollide = false
				v269.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
				v269.Massless = true
				v269.Transparency = 1
				local v273 = Instance.new("Weld", v269)
				v273.Part0 = v269
				v273.Part1 = v_u_227
				v273.C0 = CFrame.new(0, v269.Size.Y + v269.Size.Y / 2, 0)
				for _, v274 in pairs(v_u_23) do
					local v275 = workspace.ragdollSystemScript.gravityEffect:Clone()
					v275.Texture = "rbxassetid://" .. v274
					v275.Parent = v269
					v275.Enabled = true
					v275.Rate = 50 / #v_u_23 * v_u_227.Size.Y
					if table.find(v_u_25, v208) then
						v275.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0.25, 0.75, 1)), ColorSequenceKeypoint.new(0.5, Color3.new(0.25, 0.75, 1)), ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0.5)) })
					elseif v259 == true then
						v275.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 0.75, 0.25)), ColorSequenceKeypoint.new(0.5, Color3.new(1, 0.75, 0.25)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 0.5)) })
					end
				end
				local v276 = Instance.new("PointLight", v269)
				v276.Shadows = true
				v276.Range = 4
				if table.find(v_u_25, v208) then
					v276.Color = Color3.new(0.25, 0.75, 1)
				elseif v259 == true then
					v276.Color = Color3.new(1, 0.75, 0.25)
				else
					v276.Color = Color3.fromRGB(85, 0, 255)
				end
			end
		end
		if game.Players[p_u_205].NoxyRagdoll_Options.badgeOption_gravityBracelet.Value == true then
			local v277 = nil
			local v278
			if v_u_226 then
				v278 = v_u_204:Clone()
				v278.CanCollide = true
				v_u_203:SetPartCollisionGroup(v278, "armscol")
				local v279 = v_u_226.Size.X * 1.15
				local v280 = v_u_226.Size.Y / 4
				local v281 = v_u_226.Size.Z * 1.15
				v278.Size = Vector3.new(v279, v280, v281)
				v278.Anchored = false
				v278.Transparency = 0
				v278.Parent = v_u_226
				local v282 = Instance.new("Weld", v278)
				v282.Part0 = v278
				v282.Part1 = v_u_226
				v282.C0 = CFrame.new(0, v278.Size.Y - v278.Size.Y / 2, 0)
				for _, v283 in pairs(v_u_23) do
					local v284 = workspace.ragdollSystemScript.gravityEffect:Clone()
					v284.Texture = "rbxassetid://" .. v283
					v284.Parent = v278
					v284.Enabled = true
					v284.Rate = 25 / #v_u_23 * v_u_226.Size.Y
					if table.find(v_u_25, v208) then
						v284.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 0.375, 0.125)), ColorSequenceKeypoint.new(0.5, Color3.new(1, 0.375, 0.125)), ColorSequenceKeypoint.new(1, Color3.new(1, 0.1875, 0)) })
					else
						v284.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 0.75, 0.25)), ColorSequenceKeypoint.new(0.5, Color3.new(1, 0.75, 0.25)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 0.5)) })
					end
				end
				local v285 = Instance.new("PointLight", v278)
				v285.Shadows = true
				v285.Range = 4
				v285.Color = Color3.new(1, 0.75, 0.25)
			else
				v278 = nil
			end
			if v_u_227 then
				v277 = v_u_204:Clone()
				v277.CanCollide = true
				v_u_203:SetPartCollisionGroup(v277, "armscol")
				local v286 = v_u_227.Size.X * 1.15
				local v287 = v_u_227.Size.Y / 4
				local v288 = v_u_227.Size.Z * 1.15
				v277.Size = Vector3.new(v286, v287, v288)
				v277.Anchored = false
				v277.Transparency = 0
				v277.Parent = v_u_227
				local v289 = Instance.new("Weld", v277)
				v289.Part0 = v277
				v289.Part1 = v_u_227
				v289.C0 = CFrame.new(0, v277.Size.Y - v277.Size.Y / 2, 0)
				for _, v290 in pairs(v_u_23) do
					local v291 = workspace.ragdollSystemScript.gravityEffect:Clone()
					v291.Texture = "rbxassetid://" .. v290
					v291.Parent = v277
					v291.Enabled = true
					v291.Rate = 25 / #v_u_23 * v_u_227.Size.Y
					if table.find(v_u_25, v208) then
						v291.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 0.375, 0.125)), ColorSequenceKeypoint.new(0.5, Color3.new(1, 0.375, 0.125)), ColorSequenceKeypoint.new(1, Color3.new(1, 0.1875, 0)) })
					else
						v291.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 0.75, 0.25)), ColorSequenceKeypoint.new(0.5, Color3.new(1, 0.75, 0.25)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 0.5)) })
					end
				end
				local v292 = Instance.new("PointLight", v277)
				v292.Shadows = true
				v292.Range = 4
				v292.Color = Color3.new(1, 0.75, 0.25)
			end
			if table.find(v_u_25, v208) then
				if v_u_227 then
					local v293 = Instance.new("Attachment", v277)
					local v294 = -v277.Size.X / 2
					local v295 = -v277.Size.Z / 4
					v293.Position = Vector3.new(v294, 0, v295)
					local v296 = workspace.ragdollSystemScript.charms.braceletNekoCharm:Clone()
					v296.Anchored = false
					v296.CanCollide = true
					v296.Transparency = 0
					v296.CFrame = v277.CFrame:ToWorldSpace(v293.CFrame * v296.charmAtt.CFrame)
					v296.light.Enabled = true
					v296.eff.Enabled = true
					v296.Parent = v_u_227
					v_u_203:SetPartCollisionGroup(v296, "armscol")
					local v297 = Instance.new("RopeConstraint", v296)
					v297.Length = 0.375
					v297.Thickness = 0.0625
					v297.Color = BrickColor.new("Dark stone grey")
					v297.Visible = true
					v297.Attachment0 = v293
					v297.Attachment1 = v296.charmAtt
				end
				if v_u_226 then
					local v298 = Instance.new("Attachment", v278)
					local v299 = v278.Size.X / 4
					local v300 = v278.Size.Z / 2
					v298.Position = Vector3.new(v299, 0, v300)
					local v301 = workspace.ragdollSystemScript.charms.momijifumoplushCharm:Clone()
					v301.Anchored = false
					v301.CanCollide = true
					v301.Transparency = 0
					v301.CFrame = v278.CFrame:ToWorldSpace(v298.CFrame * v301.charmAtt.CFrame)
					v301.eff.Enabled = true
					v301.Parent = v_u_226
					v_u_203:SetPartCollisionGroup(v301, "armscol")
					local v302 = Instance.new("RopeConstraint", v301)
					v302.Length = 0.375
					v302.Thickness = 0.0625
					v302.Color = BrickColor.new("Dark stone grey")
					v302.Visible = true
					v302.Attachment0 = v298
					v302.Attachment1 = v301.charmAtt
					local v303 = Instance.new("Attachment", v278)
					local v304 = -v278.Size.X / 2
					local v305 = -v278.Size.Z / 8
					v303.Position = Vector3.new(v304, 0, v305)
					local v306 = Instance.new("Part")
					v306.Transparency = 1
					v306.Size = Vector3.new(0.875, 0.75, 0.05)
					v_u_203:SetPartCollisionGroup(v306, "armscol")
					local v307 = Instance.new("Attachment", v306)
					v307.Position = Vector3.new(0.0625, 0.25, 0)
					Instance.new("BlockMesh", v306).Scale = Vector3.new(1, 1, 0)
					v306.CFrame = v278.CFrame:ToWorldSpace(v303.CFrame * v307.CFrame)
					v306.Parent = v_u_226
					Instance.new("Decal", v306).Texture = "rbxassetid://6650272523"
					local v308 = Instance.new("Decal", v306)
					v308.Face = "Back"
					v308.Texture = "rbxassetid://6650288331"
					local v309 = Instance.new("RopeConstraint", v306)
					v309.Length = 0.25
					v309.Thickness = 0.0625
					v309.Color = BrickColor.new("Dark stone grey")
					v309.Visible = true
					v309.Attachment0 = v303
					v309.Attachment1 = v307
				end
			elseif p_u_205 == "Slippery_Sun" then
				if v_u_227 then
					local v310 = Instance.new("Attachment", v278)
					local v311 = -v278.Size.X / 2
					v310.Position = Vector3.new(v311, 0, 0)
					local v312 = workspace.ragdollSystemScript.charms.teapotCharm:Clone()
					v312.Anchored = false
					v312.CanCollide = true
					v312.Transparency = 0
					v312.CFrame = v278.CFrame:ToWorldSpace(v310.CFrame * v312.charmAtt.CFrame)
					v312.eff1.Enabled = true
					v312.eff2.Enabled = true
					v312.Parent = v_u_227
					v_u_203:SetPartCollisionGroup(v312, "armscol")
					local v313 = Instance.new("RopeConstraint", v312)
					v313.Length = 0.375
					v313.Thickness = 0.0625
					v313.Color = BrickColor.new("Dark stone grey")
					v313.Visible = true
					v313.Attachment0 = v310
					v313.Attachment1 = v312.charmAtt
					local v314 = Instance.new("Attachment", v277)
					local v315 = v277.Size.X / 4
					local v316 = v277.Size.Z / 2
					v314.Position = Vector3.new(v315, 0, v316)
					local v317 = workspace.ragdollSystemScript.charms.hatkidplushCharm:Clone()
					v317.Anchored = false
					v317.CanCollide = true
					v317.Transparency = 0
					v317.CFrame = v277.CFrame:ToWorldSpace(v314.CFrame * v317.charmAtt.CFrame)
					v317.eff.Enabled = true
					v317.Parent = v_u_227
					v_u_203:SetPartCollisionGroup(v317, "armscol")
					local v318 = Instance.new("RopeConstraint", v317)
					v318.Length = 0.375
					v318.Thickness = 0.0625
					v318.Color = BrickColor.new("Dark stone grey")
					v318.Visible = true
					v318.Attachment0 = v314
					v318.Attachment1 = v317.charmAtt
				end
			elseif p_u_205 == "Playerbrand1" then
				if v_u_227 then
					local v319 = Instance.new("Attachment", v277)
					local v320 = -v277.Size.X / 2
					v319.Position = Vector3.new(v320, 0, 0)
					local v321 = Instance.new("Part")
					v321.Transparency = 1
					v321.Size = Vector3.new(0.75, 0.75, 0.05)
					v_u_203:SetPartCollisionGroup(v321, "armscol")
					local v322 = Instance.new("Attachment", v321)
					v322.Position = Vector3.new(0.15625, 0.375, 0)
					Instance.new("BlockMesh", v321).Scale = Vector3.new(1, 1, 0)
					v321.CFrame = v277.CFrame:ToWorldSpace(v319.CFrame * v322.CFrame)
					v321.Parent = v_u_227
					Instance.new("Decal", v321).Texture = "rbxassetid://6662945386"
					local v323 = Instance.new("Decal", v321)
					v323.Face = "Back"
					v323.Texture = "rbxassetid://6662995521"
					local v324 = Instance.new("RopeConstraint", v321)
					v324.Length = 0.25
					v324.Thickness = 0.0625
					v324.Color = BrickColor.new("Dark stone grey")
					v324.Visible = true
					v324.Attachment0 = v319
					v324.Attachment1 = v322
				end
			elseif p_u_205 == "ZethyHere" then
				if v_u_227 then
					local v325 = Instance.new("Attachment", v277)
					local v326 = v277.Size.X / 2
					v325.Position = Vector3.new(v326, 0, 0)
					local v327 = Instance.new("Part")
					v327.Transparency = 1
					v327.Size = Vector3.new(0.75, 0.75, 0.05)
					v_u_203:SetPartCollisionGroup(v327, "armscol")
					local v328 = Instance.new("Attachment", v327)
					v328.Position = Vector3.new(0.125, 0.25, 0)
					Instance.new("BlockMesh", v327).Scale = Vector3.new(1, 1, 0)
					v327.CFrame = v277.CFrame:ToWorldSpace(v325.CFrame * v328.CFrame)
					v327.Parent = v_u_227
					Instance.new("Decal", v327).Texture = "rbxassetid://6542827675"
					local v329 = Instance.new("Decal", v327)
					v329.Face = "Back"
					v329.Texture = "rbxassetid://6650289166"
					local v330 = Instance.new("RopeConstraint", v327)
					v330.Length = 0.25
					v330.Thickness = 0.0625
					v330.Color = BrickColor.new("Dark stone grey")
					v330.Visible = true
					v330.Attachment0 = v325
					v330.Attachment1 = v328
				end
			elseif p_u_205 == "RencessBerres" or p_u_205 == "Tinukie" then
				if v_u_227 then
					local v331 = Instance.new("Attachment", v277)
					local v332 = -v277.Size.X / 2
					local v333 = -v278.Size.Z / 4
					v331.Position = Vector3.new(v332, 0, v333)
					local v334 = workspace.ragdollSystemScript.charms.paintbrushCharm:Clone()
					v334.Anchored = false
					v334.CanCollide = true
					v334.Transparency = 0
					v334.CFrame = v277.CFrame:ToWorldSpace(v331.CFrame * v334.charmAtt.CFrame)
					v334.eff.Enabled = true
					v334.Parent = v_u_227
					v_u_203:SetPartCollisionGroup(v334, "armscol")
					local v335 = Instance.new("RopeConstraint", v334)
					v335.Length = 0.25
					v335.Thickness = 0.0625
					v335.Color = BrickColor.new("Dark stone grey")
					v335.Visible = true
					v335.Attachment0 = v331
					v335.Attachment1 = v334.charmAtt
				end
			elseif (p_u_205 == "MissMisfortunes" or p_u_205 == "siphonoid") and v_u_227 then
				local v336 = Instance.new("Attachment", v277)
				local v337 = -v277.Size.X / 2
				local v338 = -v278.Size.Z / 4
				v336.Position = Vector3.new(v337, 0, v338)
				local v339 = Instance.new("Part")
				v339.Size = Vector3.new(0.175, 1, 0.175)
				v_u_203:SetPartCollisionGroup(v339, "armscol")
				local v340 = Instance.new("Attachment", v339)
				v340.Position = Vector3.new(0, -0.5, 0)
				v339.CFrame = v277.CFrame:ToWorldSpace(v336.CFrame * v340.CFrame)
				v339.Parent = v_u_227
				local v341 = Instance.new("SpecialMesh", v339)
				v341.Scale = Vector3.new(0.13261202, 0.122797735, 0.13261202)
				v341.MeshId = "rbxassetid://6652945216"
				v341.TextureId = "rbxassetid://6652941215"
				local v342 = Instance.new("RopeConstraint", v339)
				v342.Length = 0.25
				v342.Thickness = 0.0625
				v342.Color = BrickColor.new("Dark stone grey")
				v342.Visible = true
				v342.Attachment0 = v336
				v342.Attachment1 = v340
			end
			if game.Players[p_u_205]:FindFirstChild("mvpUser") and v_u_227 then
				local v343 = Instance.new("Attachment", v277)
				local v344 = v277.Size.X / 2
				v343.Position = Vector3.new(v344, 0, 0)
				local v345 = workspace.ragdollSystemScript.charms.mvpCharm:Clone()
				v345.Anchored = false
				v345.CanCollide = true
				v345.Transparency = 0
				v345.CFrame = v277.CFrame:ToWorldSpace(v343.CFrame * v345.charmAtt.CFrame)
				v345.eff.Enabled = true
				v345.Parent = v_u_227
				v_u_203:SetPartCollisionGroup(v345, "armscol")
				local v346 = Instance.new("RopeConstraint", v345)
				v346.Length = 0.25
				v346.Thickness = 0.0625
				v346.Color = BrickColor.new("Dark stone grey")
				v346.Visible = true
				v346.Attachment0 = v343
				v346.Attachment1 = v345.charmAtt
			end
		end
		local v347 = v_u_16
		table.insert(v347, p_u_205)
		local v348 = v_u_17
		table.insert(v348, p_u_206)
	end
end)
workspace.ragdollSystemScript.actions.ungrab.OnClientEvent:connect(function(p349, p350, p351, p352, p353)
	-- upvalues: (copy) v_u_16, (copy) v_u_17, (copy) v_u_4, (copy) v_u_2
	if workspace.CurrentCamera:FindFirstChild(p349 .. "_grabArms") and game.Players:FindFirstChild(p349) then
		local v354 = workspace.CurrentCamera:FindFirstChild(p349 .. "_grabArms")
		if v354 and (game.Players[p349].Character:FindFirstChild("Left Arm") and game.Players[p349].Character["Left Arm"]:FindFirstChild("mesh")) then
			game.Players[p349].Character["Left Arm"].mesh:Destroy()
		end
		if v354 and (game.Players[p349].Character:FindFirstChild("LeftHand") and game.Players[p349].Character.LeftHand:FindFirstChild("mesh")) then
			game.Players[p349].Character.LeftHand.mesh:Destroy()
		end
		if v354 and (game.Players[p349].Character:FindFirstChild("Right Arm") and game.Players[p349].Character["Right Arm"]:FindFirstChild("mesh")) then
			game.Players[p349].Character["Right Arm"].mesh:Destroy()
		end
		if v354 and (game.Players[p349].Character:FindFirstChild("RightHand") and game.Players[p349].Character.RightHand:FindFirstChild("mesh")) then
			game.Players[p349].Character.RightHand.mesh:Destroy()
		end
		local v355 = next
		local v356, v357 = v354:GetChildren()
		for _, v358 in v355, v356, v357 do
			if v358:IsA("CharacterMesh") then
				v358.Parent = game.Players[p349].Character
			end
		end
		local v359 = table.find(v_u_16, p349)
		if v359 ~= nil then
			table.remove(v_u_16, v359)
			table.remove(v_u_17, v359)
		end
		v354:Destroy()
	elseif p349 == "nt" then
		local v360 = Instance.new("Part", p350)
		v360.Name = "NR_grabPos"
		v360.Size = Vector3.new(0.001, 0.001, 0.001)
		v360.CanCollide = false
		v360.Massless = true
		v360.Transparency = 1
		Instance.new("Configuration", v360).Name = "notGrabable"
		v_u_4.superWeld(v360, v360, p350, CFrame.new(), p353)
		local v361 = Instance.new("BodyVelocity")
		v361.Name = "clientThrowBodPos"
		v361.MaxForce = p352
		v361.Velocity = p351
		v361.Parent = v360
		repeat
			v_u_2:wait()
		until (p350.Velocity - v361.Velocity).Magnitude <= 2
		v_u_2:wait()
		v361:Destroy()
		v360:Destroy()
	end
end)
visualizeButton(script.Parent.hideb)
local v_u_362 = false
script.Parent.hideb.MouseButton1Click:connect(function()
	-- upvalues: (ref) v_u_362
	v_u_362 = not v_u_362
	if v_u_362 then
		script.Parent.hideb.TextColor3 = Color3.new(0, 1, 0)
		script.Parent.optionb.Visible = false
		script.Parent.upgradeb.Visible = false
	else
		script.Parent.hideb.TextColor3 = Color3.new(1, 0, 0)
		script.Parent.optionb.Visible = true
		script.Parent.upgradeb.Visible = true
	end
end)
visualizeButton(script.Parent.ragdollb)
script.Parent.ragdollb.MouseButton1Click:connect(function()
	ragdoll(false)
end)
workspace.ragdollSystemScript.brainDamage.weak.OnClientEvent:connect(function()
	-- upvalues: (copy) v_u_8
	if not blur then
		blur = script.blur:Clone()
		sou = script.beep:Clone()
		blur.Parent = game.Lighting
		local v_u_363 = nil
		v_u_363 = v_u_8.CharacterAdded:connect(function()
			-- upvalues: (ref) v_u_363
			v_u_363:disconnect()
			if blur then
				blur:Destroy()
			end
			if sou then
				sou:Destroy()
			end
			blur = nil
			sou = nil
		end)
		sou.Parent = script
		sou:Play()
		wait(1)
		if blur then
			while true do
				wait()
				if not blur then
					break
				end
				blur.Size = blur.Size / 1.1
				if blur.Size <= 5 then
					break
				end
			end
		end
		if blur then
			blur:Destroy()
		end
		if sou then
			repeat
				wait()
			until not sou or sou.Playing == false
		end
		if sou then
			sou:Destroy()
		end
		if blur then
			blur:Destroy()
		end
		if sou then
			sou:Destroy()
		end
		blur = nil
		sou = nil
	end
end)
workspace.ragdollSystemScript.brainDamage.midweak.OnClientEvent:connect(function()
	-- upvalues: (copy) v_u_8
	if not blur then
		blur = script.blur:Clone()
		damage = script.damage:Clone()
		sou = script.beep:Clone()
		blur.Parent = game.Lighting
		damage.Parent = game.Lighting
		local v_u_364 = nil
		v_u_364 = v_u_8.CharacterAdded:connect(function()
			-- upvalues: (ref) v_u_364
			v_u_364:disconnect()
			if blur then
				blur:Destroy()
			end
			if damage then
				damage:Destroy()
			end
			if sou then
				sou:Destroy()
			end
			blur = nil
			damage = nil
			sou = nil
		end)
		sou.Parent = script
		sou:Play()
		wait(1)
		if blur and damage then
			while true do
				wait()
				if not (blur and damage) then
					break
				end
				blur.Size = blur.Size / 1.1
				damage.Contrast = damage.Contrast / 1.1
				if blur.Size <= 5 and damage.Contrast <= 1 then
					break
				end
			end
		end
		if blur then
			blur:Destroy()
		end
		if damage then
			damage:Destroy()
		end
		if sou then
			repeat
				wait()
			until not sou or sou.Playing == false
		end
		if sou then
			sou:Destroy()
		end
		if blur then
			blur:Destroy()
		end
		if damage then
			damage:Destroy()
		end
		if sou then
			sou:Destroy()
		end
		blur = nil
		damage = nil
		sou = nil
	end
end)
workspace.ragdollSystemScript.brainDamage.mid.OnClientEvent:connect(function()
	-- upvalues: (copy) v_u_8
	if not blur then
		blur = script.blur:Clone()
		damage = script.damage:Clone()
		damage.Contrast = 15
		sou = script.beep:Clone()
		blur.Parent = game.Lighting
		damage.Parent = game.Lighting
		local v_u_365 = nil
		v_u_365 = v_u_8.CharacterAdded:connect(function()
			-- upvalues: (ref) v_u_365
			v_u_365:disconnect()
			if blur then
				blur:Destroy()
			end
			if damage then
				damage:Destroy()
			end
			if sou then
				sou:Destroy()
			end
			blur = nil
			damage = nil
			sou = nil
		end)
		sou.Parent = script
		sou:Play()
		wait(1)
		if blur and damage then
			while true do
				wait()
				if not (blur and damage) then
					break
				end
				blur.Size = blur.Size / 1.1
				damage.Contrast = damage.Contrast / 1.1
				if blur.Size <= 5 and damage.Contrast <= 1 then
					break
				end
			end
		end
		if blur then
			blur:Destroy()
		end
		if damage then
			damage:Destroy()
		end
		if sou then
			repeat
				wait()
			until not sou or sou.Playing == false
		end
		if sou then
			sou:Destroy()
		end
		if blur then
			blur:Destroy()
		end
		if damage then
			damage:Destroy()
		end
		if sou then
			sou:Destroy()
		end
		blur = nil
		damage = nil
		sou = nil
	end
end)
workspace.ragdollSystemScript.brainDamage.midstrong.OnClientEvent:connect(function()
	-- upvalues: (copy) v_u_8
	if not blur then
		blur = script.blur:Clone()
		damage = script.damage:Clone()
		damage.Contrast = -5
		sou = script.beep:Clone()
		pain = script.Parent:Clone()
		blur.Parent = game.Lighting
		damage.Parent = game.Lighting
		local v_u_366 = nil
		v_u_366 = v_u_8.CharacterAdded:connect(function()
			-- upvalues: (ref) v_u_366
			v_u_366:disconnect()
			if blur then
				blur:Destroy()
			end
			if damage then
				damage:Destroy()
			end
			if sou then
				sou:Destroy()
			end
			if pain then
				pain:Destroy()
			end
			blur = nil
			damage = nil
			sou = nil
			pain = nil
		end)
		sou.Parent = script
		sou:Play()
		wait(1)
		if blur and damage then
			while true do
				wait()
				if not (blur and damage) then
					break
				end
				blur.Size = blur.Size / 1.1
				damage.Contrast = damage.Contrast / 1.1
				if blur.Size <= 5 and damage.Contrast <= 1 then
					break
				end
			end
		end
		if blur then
			blur:Destroy()
		end
		if damage then
			damage:Destroy()
		end
		if sou then
			repeat
				wait()
			until not sou or (not sou or sou.Playing == false)
		end
		if sou then
			sou:Destroy()
		end
		if pain then
			pain:Destroy()
		end
		if blur then
			blur:Destroy()
		end
		if damage then
			damage:Destroy()
		end
		if sou then
			sou:Destroy()
		end
		if pain then
			pain:Destroy()
		end
		blur = nil
		damage = nil
		sou = nil
		pain = nil
	end
end)
workspace.ragdollSystemScript.brainDamage.strong.OnClientEvent:connect(function()
	-- upvalues: (copy) v_u_8
	if not blur then
		blur = script.blur:Clone()
		damage = script.damage:Clone()
		damage.Contrast = -100
		sou = script.beep:Clone()
		pain = script.Parent:Clone()
		blur.Parent = game.Lighting
		damage.Parent = game.Lighting
		local v_u_367 = nil
		v_u_367 = v_u_8.CharacterAdded:connect(function()
			-- upvalues: (ref) v_u_367
			v_u_367:disconnect()
			if blur then
				blur:Destroy()
			end
			if damage then
				damage:Destroy()
			end
			if sou then
				sou:Destroy()
			end
			if pain then
				pain:Destroy()
			end
			blur = nil
			damage = nil
			sou = nil
			pain = nil
		end)
		sou.Parent = script
		sou:Play()
		wait(1)
		if blur and damage then
			while true do
				wait()
				if not (blur and damage) then
					break
				end
				blur.Size = blur.Size / 1.1
				damage.Contrast = damage.Contrast / 1.1
				if blur.Size <= 5 and damage.Contrast <= 1 then
					break
				end
			end
		end
		if blur then
			blur:Destroy()
		end
		if damage then
			damage:Destroy()
		end
		if sou then
			repeat
				wait()
			until not sou or (not sou or sou.Playing == false)
		end
		if sou then
			sou:Destroy()
		end
		if pain then
			pain:Destroy()
		end
		if blur then
			blur:Destroy()
		end
		if damage then
			damage:Destroy()
		end
		if sou then
			sou:Destroy()
		end
		if pain then
			pain:Destroy()
		end
		blur = nil
		damage = nil
		sou = nil
		pain = nil
	end
end)
local v_u_368 = script.Parent.Parent.deathCover
local v_u_369 = Instance.new("Animation")
v_u_369.AnimationId = "rbxassetid://6902920110"
local v_u_370 = Instance.new("Animation")
v_u_370.AnimationId = "rbxassetid://6907352338"
workspace.ragdollSystemScript.createGibSound.OnClientEvent:connect(function(p371, p372, p373)
	-- upvalues: (copy) v_u_8, (copy) v_u_1
	local v374 = nil
	if v_u_8.NoxyRagdoll_Options:WaitForChild("option_violenty", 5).Value == false then
		p372 = p373
	elseif v_u_8.NoxyRagdoll_Options:WaitForChild("option_violenty", 5).Value ~= true then
		p372 = v374
	end
	wait()
	local v_u_375 = Instance.new("Sound", p371)
	v_u_375.RollOffMaxDistance = 100
	v_u_375.Volume = 0.375
	v_u_375.SoundId = "rbxassetid://" .. p372[v_u_1:NextInteger(1, #p372)]
	v_u_375:Play()
	v_u_375.Stopped:connect(function()
		-- upvalues: (copy) v_u_375
		v_u_375:Destroy()
	end)
end)
local v_u_376 = v_u_8.NoxyRagdoll_Options:WaitForChild("badgeOption_ultimateBalancing")
local v_u_377, v_u_378 = pcall(function()
	-- upvalues: (copy) v_u_7, (copy) v_u_8
	return v_u_7:UserHasBadgeAsync(v_u_8.UserId, 2124728887) and "does own" or "doesnt own"
end)
if v_u_378 == "doesnt own" then
	local v_u_379 = nil
	v_u_379 = v_u_376.Changed:connect(function(p380)
		-- upvalues: (ref) v_u_377, (ref) v_u_378, (copy) v_u_7, (copy) v_u_8, (ref) v_u_379
		if p380 == true then
			local v381, v382 = pcall(function()
				-- upvalues: (ref) v_u_7, (ref) v_u_8, (ref) v_u_379
				if not v_u_7:UserHasBadgeAsync(v_u_8.UserId, 2124728887) then
					return "doesnt own"
				end
				v_u_379:disconnect()
				return "does own"
			end)
			v_u_377 = v381
			v_u_378 = v382
		end
	end)
end
function charCheck(p_u_383)
	-- upvalues: (copy) v_u_368, (copy) v_u_3, (ref) v_u_13, (copy) v_u_369, (copy) v_u_370, (copy) v_u_2, (copy) v_u_376, (ref) v_u_378, (copy) v_u_23, (copy) v_u_25, (copy) v_u_8, (copy) v_u_4, (ref) v_u_21, (ref) v_u_27
	v_u_368.Position = UDim2.new(-0.5, 0, -0.5, 0)
	v_u_3:Create(v_u_368, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
		["Position"] = UDim2.new(0.625, 0, 0.625, 0)
	}):Play()
	local v_u_384 = p_u_383:WaitForChild("HumanoidRootPart", 30)
	local v_u_385 = p_u_383:WaitForChild("Humanoid", 30)
	v_u_13 = true
	local v_u_386 = false
	local v_u_387
	if v_u_385.RigType == Enum.HumanoidRigType.R6 then
		v_u_387 = v_u_385:LoadAnimation(v_u_369)
		v_u_387.Priority = Enum.AnimationPriority.Action
	else
		v_u_387 = v_u_385:LoadAnimation(v_u_370)
		v_u_387.Priority = Enum.AnimationPriority.Action
	end
	p_u_383.ChildAdded:connect(function(p388)
		-- upvalues: (ref) v_u_2
		v_u_2:wait()
		if p388.Name == "serverUmbrellaEff" then
			p388.Transparency = 1
			p388:WaitForChild("sou").Volume = 0
			p388:WaitForChild("gravityEffect")
			v_u_2:wait()
			for _, v389 in pairs(p388:GetChildren()) do
				if v389:IsA("ParticleEmitter") then
					v389.Transparency = NumberSequence.new(0)
				end
			end
		end
	end)
	v_u_384.ChildAdded:connect(function(p390)
		-- upvalues: (ref) v_u_2
		v_u_2:wait()
		if p390.Name == "balanceLandedServerEff" then
			p390:WaitForChild("Attachment"):WaitForChild("Sound").Volume = 0
			p390:WaitForChild("Attachment"):WaitForChild("PointLight").Enabled = false
			for _, v391 in pairs(p390.Attachment:GetChildren()) do
				if v391:IsA("ParticleEmitter") then
					v391.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 1) })
				end
			end
		end
	end)
	v_u_385.StateChanged:connect(function(_, p392)
		-- upvalues: (copy) v_u_384, (ref) v_u_376, (ref) v_u_378, (copy) p_u_383, (ref) v_u_386, (ref) v_u_387, (ref) v_u_23, (ref) v_u_25, (ref) v_u_8, (copy) v_u_385, (ref) v_u_4
		if p392 == Enum.HumanoidStateType.Freefall then
			falling = true
		else
			falling = false
		end
		if p392 == Enum.HumanoidStateType.FallingDown then
			ragdoll(true)
		elseif p392 == Enum.HumanoidStateType.Landed and (v_u_384.Velocity.Y < -75 and (v_u_376.Value == true and v_u_378 == "does own")) then
			wait()
			local v393 = p_u_383:FindFirstChild("Right Arm") or p_u_383:FindFirstChild("RightHand")
			if v393 then
				v_u_386 = true
				v_u_387:Play()
				v_u_384.CFrame = v_u_384.CFrame:ToWorldSpace(CFrame.new(0, 2, 0))
				local v394 = workspace.ragdollSystemScript.umbrellaHover:Clone()
				v394.Name = "clientUmbrellaEff"
				v394.Anchored = false
				for _, v395 in pairs(v_u_23) do
					local v396 = workspace.ragdollSystemScript.gravityEffect:Clone()
					v396.Texture = "rbxassetid://" .. v395
					v396.Parent = v394
					v396.Enabled = true
					v396.Rate = 25 / #v_u_23 * v394.Size.magnitude
					if table.find(v_u_25, v_u_8.UserId) then
						v396.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0.25, 0.75, 1)), ColorSequenceKeypoint.new(0.5, Color3.new(0.25, 0.75, 1)), ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0.5)) })
					end
				end
				if table.find(v_u_25, v_u_8.UserId) then
					v394.Color = Color3.new(0.25, 0.75, 1)
				end
				v394.Transparency = 0
				v394.CFrame = v393.CFrame:ToWorldSpace(CFrame.new(0, 2.5, 0) * CFrame.Angles(0, 0, 3.141592653589793))
				v394.Parent = p_u_383
				v394.sou:Play()
				local v397 = Instance.new("Attachment", v393)
				if v393.Name == "Right Arm" then
					v397.Position = Vector3.new(0, -0.75, 0)
				end
				v394.bodPos.Attachment1 = v397
				v394.bodRot.Attachment1 = v397
				workspace.ragdollSystemScript.umbrellaEffect:FireServer("umbrellaHoverEff\216\167\217\134\216\167", "start")
				local v398 = Instance.new("BodyGyro", v_u_384)
				v398.MaxTorque = Vector3.new(10000000, 10000000, 10000000)
				v398.CFrame = v_u_384.CFrame
				local v399 = Instance.new("BodyVelocity", v_u_384)
				v399.MaxForce = Vector3.new(0, 10000000, 0)
				v399.Velocity = Vector3.new(0, -4, 0)
				local v_u_400 = Instance.new("BodyForce", v_u_384)
				v_u_400.Force = v_u_385.MoveDirection * 10
				v_u_385.PlatformStand = true
				local v_u_401 = v_u_385.MoveDirection.X < 0
				local v_u_402 = v_u_385.MoveDirection.Z < 0 and true or false
				local function v411()
					-- upvalues: (copy) v_u_400, (ref) v_u_401, (ref) v_u_385, (ref) v_u_402
					local v403 = v_u_400.Force.X
					local v404 = (math.abs(v403) <= 0 or (v_u_401 ~= false or v_u_385.MoveDirection.X >= 0) and (v_u_401 ~= true or v_u_385.MoveDirection.X <= 0)) and 15 or v_u_400.Force.X * 2
					if v_u_385.MoveDirection.X < 0 then
						v_u_401 = true
					else
						v_u_401 = false
					end
					local v405 = v_u_400.Force.Z
					local v406 = (math.abs(v405) <= 0 or (v_u_402 ~= false or v_u_385.MoveDirection.Z >= 0) and (v_u_402 ~= true or v_u_385.MoveDirection.Z <= 0)) and 15 or v_u_400.Force.Z * 2
					if v_u_385.MoveDirection.Z < 0 then
						v_u_402 = true
					else
						v_u_402 = false
					end
					local v407 = v_u_400
					local v408 = v_u_400.Force
					local v409 = v_u_385.MoveDirection.X * v404
					local v410 = v_u_385.MoveDirection.Z * v406
					v407.Force = v408 + Vector3.new(v409, 0, v410)
				end
				for _ = 1, 20 do
					v399.Velocity = v399.Velocity + Vector3.new(0, 0.2, 0)
					v411()
					v_u_4.await(0.01)
				end
				for _ = 1, 30 do
					v399.Velocity = v399.Velocity + Vector3.new(0, 0.25, 0)
					v411()
					v_u_4.await(0.01)
				end
				v_u_4.await(0.25)
				v_u_385.PlatformStand = false
				v398:Destroy()
				v399:Destroy()
				v_u_400:Destroy()
				v394:Destroy()
				v_u_387:Stop()
				v_u_386 = false
				workspace.ragdollSystemScript.umbrellaEffect:FireServer("umbrellaHoverEff\216\167\217\134\216\167", "finish")
			end
		end
	end)
	p_u_383:WaitForChild("HumanoidRootPart", 10):WaitForChild("Died", 10).Volume = 0
	local v412 = next
	local v413, v414 = p_u_383:GetChildren()
	for _, v415 in v412, v413, v414 do
		if v415:IsA("BasePart") then
			v415.ChildAdded:connect(function(p_u_416)
				-- upvalues: (copy) p_u_383
				if p_u_416.Name == "NRcollider" or p_u_416.Name == "torsoCollider" then
					p_u_416.Touched:connect(function(p417)
						-- upvalues: (copy) p_u_416, (ref) p_u_383
						if hittojump == true and (p_u_416:CanCollideWith(p417) == true and (p417.Parent and (p417.Parent ~= p_u_383 and (not p417.Parent.Parent or p417.Parent.Parent ~= p_u_383)))) and ((not p417.Parent.Parent or (not p417.Parent.Parent.Parent or p417.Parent.Parent.Parent ~= p_u_383)) and (p417.Name ~= "bloodParticle" and p417.Name ~= "bloodPool")) then
							hittojump = false
							canjump = true
						end
					end)
				end
			end)
		end
	end
	if v_u_21 then
		v_u_27 = os.clock()
		ungrab()
	end
	if ragdollGrabbing == true then
		ragdollGrabbing = false
		workspace.ragdollSystemScript.actions.rungrab:FireServer()
	end
	p_u_383:FindFirstChildOfClass("Humanoid").Died:connect(function()
		-- upvalues: (ref) v_u_21, (ref) v_u_27, (ref) v_u_8, (ref) v_u_368, (ref) v_u_3
		if v_u_21 then
			v_u_27 = os.clock()
			ungrab()
		end
		if ragdollGrabbing == true then
			ragdollGrabbing = false
			workspace.ragdollSystemScript.actions.rungrab:FireServer()
		end
		wait(game.Players.RespawnTime - 0.5)
		if v_u_8.Character:FindFirstChildOfClass("Humanoid").Health <= 0 then
			v_u_368.Position = UDim2.new(-1.625, 0, -1.625, 0)
			v_u_3:Create(v_u_368, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0), {
				["Position"] = UDim2.new(-0.5, 0, -0.5, 0)
			}):Play()
		end
	end)
	p_u_383.ChildAdded:connect(function(p418)
		-- upvalues: (ref) v_u_21, (ref) v_u_27
		if p418:IsA("Tool") and v_u_21 then
			v_u_27 = os.clock()
			ungrab()
		end
	end)
end
workspace.ragdollSystemScript.RagdollForce.OnClientEvent:connect(function()
	ragdoll(true)
end)
if v_u_8.Character then
	charCheck(v_u_8.Character)
end
v_u_8.CharacterAdded:connect(function(p419)
	charCheck(p419)
end)
local v_u_420 = v_u_19
local v_u_421 = v_u_14
local v_u_422 = v_u_27
local v_u_423 = v_u_21
local v_u_424 = v_u_29
local v_u_425 = v_u_15
local v_u_426 = v_u_28
local v_u_427 = v_u_18
for _, v_u_428 in pairs(game.Players:GetPlayers()) do
	if v_u_428.Character and (v_u_428.Character:WaitForChild("HumanoidRootPart", 10) and v_u_428.Character.HumanoidRootPart:WaitForChild("Died", 10)) then
		v_u_428.Character.HumanoidRootPart.Died.Volume = 0
	end
	v_u_428.CharacterAdded:connect(function()
		-- upvalues: (copy) v_u_428
		if v_u_428.Character:WaitForChild("HumanoidRootPart", 10) and v_u_428.Character.HumanoidRootPart:WaitForChild("Died", 10) then
			v_u_428.Character.HumanoidRootPart.Died.Volume = 0
		end
	end)
end
game.Players.PlayerAdded:connect(function(p_u_429)
	if p_u_429.Character and (p_u_429.Character:WaitForChild("HumanoidRootPart", 10) and p_u_429.Character.HumanoidRootPart:WaitForChild("Died", 10)) then
		p_u_429.Character.HumanoidRootPart.Died.Volume = 0
	end
	p_u_429.CharacterAdded:connect(function()
		-- upvalues: (copy) p_u_429
		if p_u_429.Character:WaitForChild("HumanoidRootPart", 10) and p_u_429.Character.HumanoidRootPart:WaitForChild("Died", 10) then
			p_u_429.Character.HumanoidRootPart.Died.Volume = 0
		end
	end)
end)
local v_u_430 = Instance.new("BindableEvent")
v_u_430.Event:connect(function()
	-- upvalues: (copy) v_u_8, (ref) v_u_13, (copy) v_u_368, (copy) v_u_3
	local v431 = false
	if v_u_8.Character then
		for _, v433 in pairs(v_u_8.Character:GetChildren()) do
			if v433:IsA("Accessory") and v433:FindFirstChild("Handle") then
				local v433 = v433.Handle
			end
			if v433:FindFirstChild("NR_grabPos") or v433:FindFirstChild("NR_grabbedBy") then
				v431 = true
			end
		end
	end
	if v_u_13 == true and v431 == false then
		v_u_13 = false
		v_u_368.Position = UDim2.new(-1.625, 0, -1.625, 0)
		v_u_3:Create(v_u_368, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0), {
			["Position"] = UDim2.new(-0.5, 0, -0.5, 0)
		}):Play()
		wait(0.25)
		workspace.ragdollSystemScript.RespawnCharacter:FireServer("\208\180\208\176\208\178\208\176\208\185Respawn\208\188\208\181\208\189\209\143")
	end
end)
local v_u_434, v_u_435 = pcall(function()
	-- upvalues: (copy) v_u_430
	game:GetService("StarterGui"):SetCore("ResetButtonCallback", v_u_430)
	game:GetService("StarterGui"):SetCore("BadgesNotificationsActive", false)
	return "resetButtonUpdated"
end)
local v_u_436 = tick()
local v_u_437 = {}
local v_u_438 = 30
local v_u_439 = 0
local v_u_440 = script.Parent.Parent.propComment
local v_u_441, v_u_442, v_u_443
if workspace:FindFirstChild("grabCursorPart") then
	v_u_441 = workspace.grabCursorPart
	v_u_442 = v_u_441:FindFirstChildOfClass("BillboardGui")
	v_u_443 = v_u_442:FindFirstChildOfClass("ImageLabel")
else
	v_u_441 = Instance.new("Part", workspace)
	v_u_441.Name = "grabCursorPart"
	v_u_441.Anchored = true
	v_u_441.CanCollide = false
	v_u_441.Size = Vector3.new(0.001, 0.001, 0.001)
	v_u_441.Transparency = 1
	v_u_442 = Instance.new("BillboardGui", v_u_441)
	v_u_442.AlwaysOnTop = true
	v_u_442.Size = UDim2.new(0, 64, 0, 64)
	v_u_443 = Instance.new("ImageLabel", v_u_442)
	v_u_443.BackgroundTransparency = 1
	v_u_443.BorderSizePixel = 0
	v_u_443.Size = UDim2.new(1, 0, 1, 0)
	v_u_443.Image = "rbxassetid://5716726525"
end
v_u_8:WaitForChild("NoxyRagdoll_Upgrades", 3600):WaitForChild("coins", 3600)
local v_u_444 = v_u_8.NoxyRagdoll_Upgrades.coins.Value
local v_u_445 = Instance.new("NumberValue")
v_u_445.Value = v_u_8.NoxyRagdoll_Upgrades.coins.Value
v_u_8.NoxyRagdoll_Upgrades.coins.Changed:connect(function(p446)
	-- upvalues: (ref) v_u_444, (copy) v_u_3, (copy) v_u_445, (copy) v_u_8, (copy) v_u_4, (copy) v_u_6
	if v_u_444 < p446 or p446 < v_u_444 then
		v_u_3:Create(v_u_445, TweenInfo.new(0.5, Enum.EasingStyle.Circular, Enum.EasingDirection.In, 0, false, 0), {
			["Value"] = v_u_8.NoxyRagdoll_Upgrades.coins.Value
		}):Play()
		local v447 = script.Parent.coinschange:Clone()
		if v_u_444 < p446 then
			v447.TextColor3 = Color3.new(0.5, 1, 0.5)
			v447.Text = "+ " .. v_u_4.enhanceNumberReadability(p446 - v_u_444)
		elseif p446 < v_u_444 then
			v447.TextColor3 = Color3.new(1, 0.5, 0.5)
			v447.Text = "- " .. v_u_4.enhanceNumberReadability(-(p446 - v_u_444))
		end
		v447.Parent = script.Parent
		v447.Visible = true
		v_u_3:Create(v447, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0), {
			["Position"] = UDim2.new(4, 0, 1.5, 0)
		}):Play()
		v_u_3:Create(v447, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0), {
			["TextTransparency"] = 1,
			["TextStrokeTransparency"] = 1
		}):Play()
		v_u_6:AddItem(v447, 0.5)
		v_u_444 = p446
	end
end)
script.Parent.coins.username.Text = v_u_8.Name
script.Parent.Parent.wind:Play()
game:GetService("RunService").RenderStepped:connect(function()
	-- upvalues: (ref) v_u_436, (ref) v_u_437, (copy) v_u_8, (ref) v_u_435, (ref) v_u_434, (copy) v_u_430, (ref) v_u_13, (ref) v_u_425, (ref) v_u_11, (ref) v_u_12, (ref) v_u_421, (copy) v_u_1, (ref) v_u_420, (ref) v_u_427, (copy) v_u_4, (copy) v_u_445, (copy) v_u_9, (copy) v_u_440, (copy) v_u_10, (ref) v_u_443, (ref) v_u_423, (ref) v_u_439, (copy) v_u_3, (ref) v_u_442, (ref) v_u_438, (ref) v_u_426, (ref) v_u_422, (ref) v_u_424, (ref) v_u_441, (copy) v_u_376, (ref) v_u_378, (copy) v_u_16, (copy) v_u_17
	local v448 = 1 / (tick() - v_u_436)
	local v449 = v_u_437
	local v450 = math.ceil(v448)
	table.insert(v449, v450)
	v_u_436 = tick()
	script.Parent.Parent.datastores.Visible = v_u_8:HasTag("grcdsdied")
	local v451 = v_u_8.Character
	if v_u_435 ~= "resetButtonUpdated" then
		local v452, v453 = pcall(function()
			-- upvalues: (ref) v_u_430
			game:GetService("StarterGui"):SetCore("ResetButtonCallback", v_u_430)
			game:GetService("StarterGui"):SetCore("BadgesNotificationsActive", false)
			return "resetButtonUpdated"
		end)
		v_u_434 = v452
		v_u_435 = v453
	end
	if v451:FindFirstChild("HumanoidRootPart") and v451.HumanoidRootPart.Velocity.Magnitude >= 37.5 then
		local v454 = script.Parent.Parent.wind
		local v455 = v451.HumanoidRootPart.Velocity.Magnitude / 400
		v454.Volume = math.clamp(v455, 0, 1)
		if v451.HumanoidRootPart.Position.Y <= workspace.FallenPartsDestroyHeight / 2 and (v_u_13 == true and (not v451:FindFirstChildOfClass("Humanoid") or v451:FindFirstChildOfClass("Humanoid").Health > 0)) then
			v_u_13 = false
			workspace.ragdollSystemScript.RespawnCharacter:FireServer("\208\180\208\176\208\178\208\176\208\185Respawn\208\188\208\181\208\189\209\143")
		end
	else
		script.Parent.Parent.wind.Volume = 0
	end
	if v451:FindFirstChild("HumanoidRootPart") and (v451:FindFirstChild("Head") and v451.Head:FindFirstChild("faceGlow")) then
		local v456 = v451:FindFirstChildOfClass("Humanoid").CameraOffset
		local v457 = (v451.HumanoidRootPart.CFrame:ToWorldSpace(CFrame.new(v456.X, v456.Y + v451.HumanoidRootPart.Size.Y * 0.75, v456.Z)).p - workspace.Camera.CFrame.p).magnitude
		if v457 < 0.6 and v451.Head.faceGlow:WaitForChild("gui").Enabled == true then
			v451.Head.faceGlow.gui.Enabled = false
			for _, v458 in pairs(v451.Head.faceGlow:GetChildren()) do
				if v458:IsA("BasePart") then
					v458:WaitForChild("gui").Enabled = false
				end
			end
		elseif v457 >= 0.6 and v451.Head.faceGlow:WaitForChild("gui").Enabled == false then
			v451.Head.faceGlow.gui.Enabled = true
			for _, v459 in pairs(v451.Head.faceGlow:GetChildren()) do
				if v459:IsA("BasePart") then
					v459:WaitForChild("gui").Enabled = true
				end
			end
		end
	end
	if v451:FindFirstChild("RagdollSystem_Ragdolled") and (v451:FindFirstChild("HumanoidRootPart") and (v451:FindFirstChildOfClass("Humanoid") and v451:FindFirstChildOfClass("Humanoid").Health > 0)) then
		if (v451.HumanoidRootPart.Velocity.Magnitude >= 50 and canjump == false or v451.HumanoidRootPart.Velocity.Y <= -50) and (v_u_425 == "unlocked" or (v_u_425 == "falling" or v_u_425 == "walkLanding")) then
			v_u_425 = "falling"
			if v_u_8.Character:FindFirstChild("Left Arm") and v_u_8.Character["Left Arm"]:FindFirstChildOfClass("BodyForce") then
				v_u_8.Character["Left Arm"]:FindFirstChildOfClass("BodyForce"):Destroy()
			end
			if v_u_8.Character:FindFirstChild("Right Arm") and v_u_8.Character["Right Arm"]:FindFirstChildOfClass("BodyForce") then
				v_u_8.Character["Right Arm"]:FindFirstChildOfClass("BodyForce"):Destroy()
			end
		elseif v_u_425 == "falling" then
			v_u_425 = "unlocked"
			v_u_11 = 0
			v_u_12 = 0
		end
		for _, v460 in pairs(v_u_421) do
			if v460:IsA("AlignPosition") then
				if v460.Attachment0 and (v460.Attachment1 and (v460.Attachment0.Parent and (v460.Attachment1.Parent and (not v460.Attachment0.Parent:FindFirstChild("htornedVal") or v460.Attachment0.Parent.htornedVal.Value == false)))) then
					if v_u_425 == "unlocked" then
						v460.Enabled = false
						v460.MaxForce = 5000
						v460.MaxVelocity = 5000
						v460.Attachment1.Position = Vector3.new(0, 0, 0)
					elseif v_u_425 == "idle" then
						if v460.Attachment0.Parent.Name == "Head" then
							v460.Enabled = true
							v460.MaxForce = 3000
							v460.MaxVelocity = 3000
							v460.Attachment1.Position = Vector3.new(0, 1.5, 0)
						elseif v460.Attachment0.Parent.Name == "Left Leg" or v460.Attachment0.Parent.Name == "LeftLowerLeg" then
							v460.Enabled = true
							v460.MaxForce = 3000
							v460.MaxVelocity = 3000
							v460.Attachment1.Position = Vector3.new(-0.5, -2.5, 0)
						elseif v460.Attachment0.Parent.Name == "Right Leg" or v460.Attachment0.Parent.Name == "RightLowerLeg" then
							v460.Enabled = true
							v460.MaxForce = 3000
							v460.MaxVelocity = 3000
							v460.Attachment1.Position = Vector3.new(0.5, -2.5, 0)
						else
							v460.Enabled = false
							v460.MaxForce = 5000
							v460.MaxVelocity = 5000
							v460.Attachment1.Position = Vector3.new(0, 0, 0)
						end
					elseif v_u_425 == "walkLanding" then
						if v460.Attachment0.Parent.Name == "Left Arm" or v460.Attachment0.Parent.Name == "LeftLowerArm" then
							v460.Enabled = true
							v460.MaxForce = 5000
							v460.MaxVelocity = 5000
							v460.Attachment1.Position = Vector3.new(-0.5, 1.5, -1)
						elseif v460.Attachment0.Parent.Name == "Right Arm" or v460.Attachment0.Parent.Name == "RightLowerArm" then
							v460.Enabled = true
							v460.MaxForce = 5000
							v460.MaxVelocity = 5000
							v460.Attachment1.Position = Vector3.new(0.5, 1.5, -1)
						else
							v460.Enabled = false
							v460.MaxForce = 5000
							v460.MaxVelocity = 5000
							v460.Attachment1.Position = Vector3.new(0, 0, 0)
						end
					elseif v_u_425 == "falling" then
						if v_u_11 == 1 then
							v460.Enabled = true
							v460.Attachment1.Position = Vector3.new(0, 1, -1)
						elseif v_u_11 == 2 then
							v460.Enabled = true
							if v_u_12 <= 0 then
								v_u_12 = 10
								if v460.Attachment0.Parent.Name == "Head" then
									v460.Attachment1.Position = Vector3.new(0, 1, -2)
								elseif v460.Attachment0.Parent.Name == "Left Leg" or v460.Attachment0.Parent.Name == "LeftLowerLeg" then
									if v_u_1:NextInteger(1, 2) == 1 then
										local v461 = v460.Attachment1
										local v462 = -v_u_1:NextInteger(1, 3)
										v461.Position = Vector3.new(-0.5, -2.5, v462)
									else
										local v463 = v_u_1
										v460.Attachment1.Position = Vector3.new(-0.5, -2.5, v463:NextInteger(1, 3))
									end
								elseif v460.Attachment0.Parent.Name == "Right Leg" or v460.Attachment0.Parent.Name == "RightLowerLeg" then
									if v_u_1:NextInteger(1, 2) == 1 then
										local v464 = v460.Attachment1
										local v465 = -v_u_1:NextInteger(1, 3)
										v464.Position = Vector3.new(0.5, -2.5, v465)
									else
										local v466 = v_u_1
										v460.Attachment1.Position = Vector3.new(0.5, -2.5, v466:NextInteger(1, 3))
									end
								elseif v460.Attachment0.Parent.Name == "Left Arm" or v460.Attachment0.Parent.Name == "LeftLowerArm" then
									if v_u_1:NextInteger(1, 2) == 1 then
										local v467 = v460.Attachment1
										local v468 = -v_u_1:NextInteger(1, 3)
										v467.Position = Vector3.new(-1.5, -0.5, v468)
									else
										local v469 = v_u_1
										v460.Attachment1.Position = Vector3.new(-1.5, -0.5, v469:NextInteger(1, 3))
									end
								elseif v460.Attachment0.Parent.Name == "Right Arm" or v460.Attachment0.Parent.Name == "RightLowerArm" then
									if v_u_1:NextInteger(1, 2) == 1 then
										local v470 = v460.Attachment1
										local v471 = -v_u_1:NextInteger(1, 3)
										v470.Position = Vector3.new(1.5, 2, v471)
									else
										local v472 = v_u_1
										v460.Attachment1.Position = Vector3.new(1.5, 2, v472:NextInteger(1, 3))
									end
								end
							else
								v_u_12 = v_u_12 - 1
							end
						else
							v_u_11 = v_u_1:NextInteger(1, 2)
						end
					end
				else
					v460.Enabled = false
					v460.MaxForce = 5000
					v460.MaxVelocity = 5000
					v460.Attachment1.Position = Vector3.new(0, 0, 0)
				end
			end
		end
	else
		for _, v473 in pairs(v_u_421) do
			if v473:IsA("AlignPosition") then
				v473.Enabled = false
				v473.MaxForce = 5000
				v473.MaxVelocity = 5000
				v473.Attachment1.Position = Vector3.new(0, 0, 0)
			end
		end
	end
	if v_u_420 then
		local v474 = (not v451 or (not v451:FindFirstChildOfClass("Humanoid") or v451:FindFirstChildOfClass("Humanoid").Health <= 0)) and Vector3.new(0, 0, 0) or v451:FindFirstChildOfClass("Humanoid").MoveDirection * v451:FindFirstChildOfClass("Humanoid").WalkSpeed
		if v474 == Vector3.new(0, 0, 0) then
			v_u_420.MaxForce = Vector3.new(0, 0, 0)
			local v475 = v_u_427 - 5
			v_u_427 = math.clamp(v475, 0, 30)
		else
			v_u_420.Velocity = v474
			local v476 = v_u_427 + 1
			v_u_427 = math.clamp(v476, 0, 30)
		end
		local v477 = v_u_420
		local v478 = v_u_427 * 100
		local v479 = v_u_427 * 100
		v477.MaxForce = Vector3.new(v478, 0, v479)
	end
	if v451 then
		for _, v480 in pairs(v451:GetChildren()) do
			if v480:IsA("BasePart") then
				v480.RotVelocity = v480.RotVelocity / 1.01
			elseif v480:IsA("Accessory") and (v480:FindFirstChild("Handle") and v480.Handle:IsA("BasePart")) then
				v480.Handle.RotVelocity = v480.Handle.RotVelocity / 1.01
			end
		end
	else
		local v481 = v_u_427 - 5
		v_u_427 = math.clamp(v481, 0, 30)
	end
	if v451:FindFirstChild("Torso") and v451.Torso.Velocity.Y < 0 then
		local v482 = v451.Torso
		local v483 = v451.Torso.Velocity.X
		local v484 = v451.Torso.Velocity.Y * 1.01
		local v485 = v451.Torso.Velocity.Z
		v482.Velocity = Vector3.new(v483, v484, v485)
	elseif v451:FindFirstChild("UpperTorso") and v451.UpperTorso.Velocity.Y < 0 then
		local v486 = v451.UpperTorso
		local v487 = v451.UpperTorso.Velocity.X
		local v488 = v451.UpperTorso.Velocity.Y * 1.01
		local v489 = v451.UpperTorso.Velocity.Z
		v486.Velocity = Vector3.new(v487, v488, v489)
	end
	if v451 and (v451:FindFirstChildOfClass("Humanoid") and v451:FindFirstChild("RagdollSystem_Ragdolled")) then
		v451:FindFirstChildOfClass("Humanoid").Sit = false
		v451:FindFirstChildOfClass("Humanoid").Jump = false
	end
	local v490 = script.Parent.coins
	local v491 = v_u_4.enhanceNumberReadability
	local v492 = v_u_445.Value
	v490.Text = v491((math.ceil(v492)))
	if v_u_8.NoxyRagdoll_Options:WaitForChild("option_russianLanguage", 5).Value == false then
		script.Parent.ragdollb.Text = "ragdoll"
		script.Parent.optionb.Text = "options"
		script.Parent.upgradeb.Text = "upgrades"
	elseif v_u_8.NoxyRagdoll_Options:WaitForChild("option_russianLanguage", 5).Value == true then
		script.Parent.ragdollb.Text = "\209\131\208\191\208\176\209\129\209\130\209\140"
		script.Parent.optionb.Text = "\208\189\208\176\209\129\209\130\209\128\208\190\208\185\208\186\208\184"
		script.Parent.upgradeb.Text = "\208\176\208\191\208\179\209\128\208\181\208\185\208\180\209\139"
	end
	if v451 and (v451:FindFirstChild("HumanoidRootPart") and (v_u_9 and (v_u_9.Target and v_u_9.Hit))) then
		if (v_u_9.Target:FindFirstChild("propComment") or v_u_9.Target.Parent:FindFirstChild("propComment")) and (v_u_9.Hit.p - v451.HumanoidRootPart.Position).magnitude <= 16 then
			if v_u_9.Target.Parent:FindFirstChild("propComment") then
				v_u_440.Text = v_u_9.Target.Parent.propComment.Value
			else
				v_u_440.Text = v_u_9.Target.propComment.Value
			end
			v_u_440.Visible = true
			v_u_440.Size = UDim2.new(0, v_u_10.ViewportSize.X / 32, 0, v_u_10.ViewportSize.Y / 32)
			v_u_440.Position = UDim2.new(0, v_u_9.X, 0, v_u_9.Y)
			if v_u_440.Position.X.Offset + v_u_440.AbsoluteSize.X > v_u_10.ViewportSize.X then
				v_u_440.Position = UDim2.new(0, v_u_440.Position.X.Offset - v_u_440.AbsoluteSize.X, 0, v_u_440.Position.Y.Offset)
			end
			if v_u_440.Position.Y.Offset + v_u_440.AbsoluteSize.Y > v_u_10.ViewportSize.Y then
				v_u_440.Position = UDim2.new(0, v_u_440.Position.X.Offset, 0, v_u_440.Position.Y.Offset - v_u_440.AbsoluteSize.Y)
			end
		else
			v_u_440.Visible = false
			v_u_440.Size = UDim2.new(0, 0, 0, 0)
			v_u_440.Text = ""
		end
		if v_u_9.Target:FindFirstChildOfClass("ClickDetector") and ((v_u_9.Hit.p - v451.HumanoidRootPart.Position).magnitude <= v_u_9.Target:FindFirstChildOfClass("ClickDetector").MaxActivationDistance and not v451:FindFirstChildOfClass("Tool")) then
			v_u_9.Icon = "rbxassetid://6662250629"
			if script.Parent.Parent.device.Value == 1 then
				if v_u_9.Target:FindFirstChildOfClass("ClickDetector").CursorIcon == "" then
					v_u_443.Image = "rbxassetid://5716735114"
				else
					v_u_443.Image = v_u_9.Target:FindFirstChildOfClass("ClickDetector").CursorIcon
				end
			end
		else
			v_u_9.Icon = "rbxassetid://6662243639"
			if script.Parent.Parent.device.Value == 1 then
				v_u_443.Image = "rbxassetid://5716726525"
			end
		end
	end
	if script.Parent.Parent.device.Value == 1 then
		if v_u_423 == nil and checkForAbilityToGrab() == true then
			v_u_439 = 1
			local v493 = {}
			for _, v494 in pairs(v_u_9.Target:GetConnectedParts()) do
				local v495 = v494.Position
				table.insert(v493, v495)
			end
			local v496 = 0
			local v497 = 0
			local v498 = 0
			for _, v499 in pairs(v493) do
				v496 = v496 + v499.X
				v497 = v497 + v499.Y
				v498 = v498 + v499.Z
			end
			local v500 = v_u_3
			local v501 = v_u_442
			local v502 = TweenInfo.new(v_u_438 / 7.5 * 0.03333333333333333, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
			local v503 = {}
			local v504 = v496 / #v493
			local v505 = v497 / #v493
			local v506 = v498 / #v493
			v503.StudsOffsetWorldSpace = (Vector3.new(v504, v505, v506) + v_u_9.Hit.p) / 2
			v500:Create(v501, v502, v503):Play()
		elseif v_u_423 ~= nil or checkForAbilityToGrab() == false then
			v_u_3:Create(v_u_442, TweenInfo.new(v_u_438 / 7.5 * 0.03333333333333333 * v_u_439, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {
				["StudsOffsetWorldSpace"] = v_u_9.Hit.p
			}):Play()
			if v_u_439 > 0 then
				v_u_439 = v_u_439 - 0.05
			end
		end
	end
	if v_u_423 == nil then
		script.Parent.Parent.chargeBar.Visible = false
	else
		local v507
		if v_u_426 == true then
			local v508 = (os.clock() - v_u_422) * 37.5
			local v509 = v_u_424
			v507 = math.clamp(v508, 0, v509)
		else
			v507 = 0
		end
		script.Parent.Parent.chargeBar.Visible = true
		script.Parent.Parent.chargeBar.specificCharge.Text = math.floor(v507) .. "/" .. v_u_424
		local v510 = Color3.new(1, 1, 1)
		if v_u_8.NoxyRagdoll_Options.passOption_gravityHands.Value == true then
			if v_u_8.UserId == 374451644 then
				v510 = Color3.new(0.25, 0.75, 1)
			else
				v510 = Color3.new(0.3333333333333333, 0, 1)
			end
		end
		if v_u_8.NoxyRagdoll_Options.badgeOption_gravityBracelet.Value == true then
			v510 = Color3.new((1 + v510.R) / 2, (0.75 + v510.G) / 2, (0.25 + v510.B) / 2)
		end
		script.Parent.Parent.chargeBar.charge.BackgroundColor3 = v510
		script.Parent.Parent.chargeBar.specificCharge.TextColor3 = Color3.new(v510.R / 2, v510.G / 2, v510.B / 2)
		v_u_3:Create(script.Parent.Parent.chargeBar.charge, TweenInfo.new(1 / v_u_438, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0), {
			["Size"] = UDim2.new(v507 / v_u_424, v507 / v_u_424 * -10, 1, -10),
			["Position"] = UDim2.new(0.5 - v507 / v_u_424 / 2, v507 / v_u_424 * 5, 0, 5)
		}):Play()
	end
	if script.Parent.Parent.device.Value == 2 and v_u_441 then
		v_u_441:Destroy()
		v_u_441 = nil
	end
	if v_u_8 and (v451 and (v451:FindFirstChild("HumanoidRootPart") and falling == true)) then
		if v451.HumanoidRootPart.Velocity.Magnitude > 75 and (v_u_376.Value == false or v_u_378 == "doesnt own") and not (v451:FindFirstChild("RagdollSystem_Ragdolled") or v451:FindFirstChild("RagdollSystem_Ragdolling")) then
			ragdoll(true)
		end
	elseif v451:FindFirstChild("RagdollSystem_Ragdolled") and v451:FindFirstChild("HumanoidRootPart") then
		if v451.HumanoidRootPart.Velocity.Magnitude > 75 then
			workspace.ragdollSystemScript.generateSound:FireServer("fall", "grc\208\151\208\178\209\131\208\186\217\138")
		elseif v451.HumanoidRootPart.Velocity.Magnitude < 50 then
			workspace.ragdollSystemScript.generateSound:FireServer("removeFall", "grc\208\151\208\178\209\131\208\186\217\138")
		end
	elseif v451:FindFirstChild("HumanoidRootPart") then
		workspace.ragdollSystemScript.generateSound:FireServer("removeFall", "grc\208\151\208\178\209\131\208\186\217\138")
	end
	for v511, v512 in pairs(v_u_16) do
		local v513 = v_u_17[v511]
		if workspace.CurrentCamera:FindFirstChild(v512 .. "_grabArms") and (game.Players:FindFirstChild(v512) and (game.Players[v512].Character and (game.Players[v512].Character:FindFirstChild("HumanoidRootPart") and (v513 and (v513:FindFirstChild("NR_grabPos") and v512 ~= v_u_8.Name))))) then
			local v514 = workspace.CurrentCamera[v512 .. "_grabArms"]
			local v515 = game.Players[v512].Character.HumanoidRootPart.CFrame
			local v516 = CFrame.new((v515 * CFrame.new(-2, 0, 0.5)).p, (v513.NR_grabPos.CFrame * CFrame.new(-0.5, 0, 0)).p) * CFrame.new(0, 0, -2) * CFrame.Angles(1.5707963267948966, 0, 0)
			local v517 = CFrame.new((v515 * CFrame.new(2, 0, 0.5)).p, (v513.NR_grabPos.CFrame * CFrame.new(-0.5, 0, 0)).p) * CFrame.new(0, 0, -2) * CFrame.Angles(1.5707963267948966, 0, 0)
			local v518 = CFrame.new((v515 * CFrame.new(-2.5, 0, 0.5)).p, (v513.NR_grabPos.CFrame * CFrame.new(-0.5, 0, 0)).p) * CFrame.new(0, 0, -2) * CFrame.Angles(1.5707963267948966, 0, 0)
			local v519 = CFrame.new((v515 * CFrame.new(2.5, 0, 0.5)).p, (v513.NR_grabPos.CFrame * CFrame.new(-0.5, 0, 0)).p) * CFrame.new(0, 0, -2) * CFrame.Angles(1.5707963267948966, 0, 0)
			if v514:FindFirstChild("Left Arm") then
				v514["Left Arm"].Velocity = Vector3.new(0, 0, 0)
				v514["Left Arm"].RotVelocity = Vector3.new(0, 0, 0)
				v514["Left Arm"].bodPos.Position = v516.p
				v514["Left Arm"].CFrame = v516
			end
			if v514:FindFirstChild("Right Arm") then
				v514["Right Arm"].Velocity = Vector3.new(0, 0, 0)
				v514["Right Arm"].RotVelocity = Vector3.new(0, 0, 0)
				v514["Right Arm"].bodPos.Position = v517.p
				v514["Right Arm"].CFrame = v517
			end
			if v514:FindFirstChild("LeftHand") then
				v514.LeftHand.Velocity = Vector3.new(0, 0, 0)
				v514.LeftHand.RotVelocity = Vector3.new(0, 0, 0)
				v514.LeftHand.bodPos.Position = v518.p
				v514.LeftHand.CFrame = v518
			end
			if v514:FindFirstChild("RightHand") then
				v514.RightHand.Velocity = Vector3.new(0, 0, 0)
				v514.RightHand.RotVelocity = Vector3.new(0, 0, 0)
				v514.RightHand.bodPos.Position = v519.p
				v514.RightHand.CFrame = v519
			end
		end
	end
	if v_u_423 and (v_u_423:FindFirstChild("NR_grabPos") and (v451 and (v451:FindFirstChild("HumanoidRootPart") and v451:FindFirstChildOfClass("Humanoid")))) then
		local v520 = v451:FindFirstChildOfClass("Humanoid").CameraOffset
		if workspace.CurrentCamera:FindFirstChild(v_u_8.Name .. "_grabArms") then
			local v521 = workspace.CurrentCamera[v_u_8.Name .. "_grabArms"]
			local v522 = v451.HumanoidRootPart.CFrame:ToWorldSpace(CFrame.new(v520.X, v520.Y, v520.Z))
			local v523 = CFrame.new((v522 * CFrame.new(-1.5, 0, 0)).p, (v_u_423.NR_grabPos.CFrame * CFrame.new(-0.5, 0, 0)).p) * CFrame.new(0, 0, -1.25) * CFrame.Angles(1.5707963267948966, 0, 0)
			local v524 = CFrame.new((v522 * CFrame.new(1.5, 0, 0)).p, (v_u_423.NR_grabPos.CFrame * CFrame.new(0.5, 0, 0)).p) * CFrame.new(0, 0, -1.25) * CFrame.Angles(1.5707963267948966, 0, 0)
			local v525 = CFrame.new((v522 * CFrame.new(-2, 0, 0)).p, (v_u_423.NR_grabPos.CFrame * CFrame.new(-0.5, 0, 0)).p) * CFrame.new(0, 0, -2.25) * CFrame.Angles(1.5707963267948966, 0, 0)
			local v526 = CFrame.new((v522 * CFrame.new(2, 0, 0)).p, (v_u_423.NR_grabPos.CFrame * CFrame.new(0.5, 0, 0)).p) * CFrame.new(0, 0, -2.25) * CFrame.Angles(1.5707963267948966, 0, 0)
			if v521:FindFirstChild("Left Arm") then
				v521["Left Arm"].Velocity = Vector3.new(0, 0, 0)
				v521["Left Arm"].RotVelocity = Vector3.new(0, 0, 0)
				v521["Left Arm"].bodPos.Position = v523.p
				v521["Left Arm"].CFrame = v523
			end
			if v521:FindFirstChild("Right Arm") then
				v521["Right Arm"].Velocity = Vector3.new(0, 0, 0)
				v521["Right Arm"].RotVelocity = Vector3.new(0, 0, 0)
				v521["Right Arm"].bodPos.Position = v524.p
				v521["Right Arm"].CFrame = v524
			end
			if v521:FindFirstChild("LeftHand") then
				v521.LeftHand.Velocity = Vector3.new(0, 0, 0)
				v521.LeftHand.RotVelocity = Vector3.new(0, 0, 0)
				v521.LeftHand.bodPos.Position = v525.p
				v521.LeftHand.CFrame = v525
			end
			if v521:FindFirstChild("RightHand") then
				v521.RightHand.Velocity = Vector3.new(0, 0, 0)
				v521.RightHand.RotVelocity = Vector3.new(0, 0, 0)
				v521.RightHand.bodPos.Position = v526.p
				v521.RightHand.CFrame = v526
			end
			local v527 = next
			local v528, v529 = v521:GetChildren()
			for _, v530 in v527, v528, v529 do
				if (v530:IsA("Part") or v530:IsA("MeshPart")) and (v451 and v451:FindFirstChild(v530.Name)) then
					if (v451.HumanoidRootPart.CFrame:ToWorldSpace(CFrame.new(v520.X, v520.Y + v451.HumanoidRootPart.Size.Y * 0.75, v520.Z)).p - workspace.Camera.CFrame.p).magnitude < 0.6 then
						v530.Transparency = 1 - (1 - v451[v530.Name].Transparency) * 0.75
					else
						v530.Transparency = v451[v530.Name].Transparency
					end
				end
			end
		end
		local v531
		if v_u_426 == true then
			local v532 = (os.clock() - v_u_422) * 37.5
			local v533 = v_u_424
			v531 = math.clamp(v532, 0, v533)
		else
			v531 = 0
		end
		local v534 = v451.HumanoidRootPart
		local v535 = v531 * 0.03375 + -5
		local v536 = v534.CFrame:ToWorldSpace(CFrame.new(v520.X, v520.Y + v451.HumanoidRootPart.Size.Y * 0.75, v520.Z)).p
		local v537 = CFrame.new(v536, v_u_9.Hit.p) * CFrame.new(0, 0, v535)
		if v_u_423.Parent and (v_u_423.Parent:FindFirstChildOfClass("Humanoid") and v_u_423.Parent:FindFirstChild("RagdollSystem_Ragdolled")) then
			for _, v538 in pairs(v_u_423.Parent:GetChildren()) do
				if v538:IsA("BasePart") then
					v538.RotVelocity = v538.RotVelocity / 1.01
				elseif v538:IsA("Accessory") and (v538:FindFirstChild("Handle") and v538.Handle:IsA("BasePart")) then
					v538.Handle.RotVelocity = v538.Handle.RotVelocity / 1.01
				end
			end
		elseif v_u_423.Parent and (v_u_423.Parent.Parent and (v_u_423.Parent.Parent:FindFirstChildOfClass("Humanoid") and v_u_423.Parent.Parent:FindFirstChild("RagdollSystem_Ragdolled"))) then
			for _, v539 in pairs(v_u_423.Parent.Parent:GetChildren()) do
				if v539:IsA("BasePart") then
					v539.RotVelocity = v539.RotVelocity / 1.01
				elseif v539:IsA("Accessory") and (v539:FindFirstChild("Handle") and v539.Handle:IsA("BasePart")) then
					v539.Handle.RotVelocity = v539.Handle.RotVelocity / 1.01
				end
			end
		end
		local v540 = CFrame.fromMatrix(v537.p, (v_u_9.Hit.p - v536).Unit:Cross(Vector3.new(0, 1, 0)), (v_u_9.Hit.p - v536).Unit:Cross(Vector3.new(0, 1, 0)):Cross((v_u_9.Hit.p - v536).Unit))
		if v_u_423.NR_grabPos:FindFirstChild("grabBodPos") then
			v_u_423.NR_grabPos.grabBodPos.Attachment1.CFrame = v540 - Vector3.new(0, 10000, 0)
		end
		if (v_u_423.NR_grabPos.Position - v451.HumanoidRootPart.Position).magnitude > 15 and (v_u_8.NoxyRagdoll_Options.passOption_gravityHands.Value == false and v_u_8.NoxyRagdoll_Options.badgeOption_gravityBracelet.Value == false) then
			v_u_422 = os.clock()
			ungrab()
		end
	end
end)
local v_u_541 = {
	1838834511,
	1842247132,
	1838836802,
	1839373154,
	1836652916,
	1843324336,
	146198829,
	1935992642,
	179917929,
	185558852,
	237214543,
	166567996,
	160574821,
	1369879138,
	6595511973,
	4803950414,
	273007424,
	3251309755,
	4650776194,
	371641587,
	4472614893,
	5196996537,
	690678966,
	235773964,
	452877049,
	5271391392,
	3636285197,
	324159324,
	148987197,
	1525123663,
	845450216,
	6331022510,
	1143825038,
	6943610562,
	5717819473
}
local v_u_542 = {}
local v_u_543 = script.Parent.Parent.backgroundMusic
local v_u_544 = script.Parent.backgroundMusicName
local v_u_545 = game:GetService("MarketplaceService")
function loadNewBackgroundMusic()
	-- upvalues: (copy) v_u_541, (copy) v_u_1, (copy) v_u_543, (copy) v_u_542, (copy) v_u_545, (copy) v_u_544
	local v_u_546 = v_u_541[v_u_1:NextInteger(1, #v_u_541)]
	v_u_543.SoundId = "rbxassetid://" .. v_u_546
	v_u_543:Play()
	local v547 = nil
	for _, v548 in pairs(v_u_542) do
		if v548[1] == v_u_546 then
			v547 = v548[2]
		end
	end
	if v547 == nil then
		local v549, v550 = pcall(function()
			-- upvalues: (ref) v_u_545, (copy) v_u_546
			return v_u_545:GetProductInfo(v_u_546, Enum.InfoType.Asset).Name
		end)
		if v549 == true and v550 ~= nil then
			v_u_544.Text = v550
			local v551 = v_u_542
			table.insert(v551, { v_u_546, v550 })
		else
			v_u_544.Text = v_u_546
		end
	else
		v_u_544.Text = v547
		return
	end
end
local v_u_552 = nil
v_u_552 = v_u_543.Played:connect(function()
	-- upvalues: (ref) v_u_552, (copy) v_u_543
	v_u_552:disconnect()
	loadNewBackgroundMusic()
	v_u_543.Ended:connect(function()
		loadNewBackgroundMusic()
	end)
end)
if v_u_543.volume.Value > 0 and (not v_u_8:WaitForChild("PlayerGui"):FindFirstChild("mapChangeUI") or v_u_8.PlayerGui.mapChangeUI.music.IsPlaying == false) then
	v_u_543.Volume = 0.5 * v_u_543.volume.Value
end
v_u_543.volume.Changed:connect(function(p553)
	-- upvalues: (copy) v_u_8, (copy) v_u_543
	if not v_u_8:WaitForChild("PlayerGui"):FindFirstChild("mapChangeUI") or v_u_8.PlayerGui.mapChangeUI.music.IsPlaying == false then
		v_u_543.Volume = 0.5 * p553
	end
end)
local v554 = 0
while wait(0, 2) do
	v554 = v554 + 1
	if v_u_543.volume.Value > 0 and (not v_u_8:WaitForChild("PlayerGui"):FindFirstChild("mapChangeUI") or v_u_8.PlayerGui.mapChangeUI.music.IsPlaying == false) then
		v_u_544.Visible = true
		local v_u_555 = true
		local v_u_556 = 0
		local v_u_557 = {}
		local function v_u_562(p558)
			-- upvalues: (copy) v_u_10, (ref) v_u_555, (copy) v_u_557, (ref) v_u_556, (copy) v_u_562
			for _, v559 in pairs(p558:GetChildren()) do
				if v559.Name == "radio" then
					if v559:FindFirstChild("base") and v559.base:FindFirstChild("mus") then
						if v559.base.mus.IsPlaying == true and (v_u_10.CFrame.p - v559.base.Position).Magnitude <= v559.base.mus.RollOffMaxDistance then
							v_u_555 = false
							local v560 = v_u_557
							table.insert(v560, v559)
							v_u_556 = v_u_556 + (v_u_10.CFrame.p - v559.base.Position).Magnitude / v559.base.mus.RollOffMaxDistance
						end
					elseif v559:FindFirstChild("radio") and (v559.radio:FindFirstChildOfClass("Sound") and (v559.radio:FindFirstChildOfClass("Sound").IsPlaying == true and (v_u_10.CFrame.p - v559.radio.Position).Magnitude <= v559.radio:FindFirstChildOfClass("Sound").RollOffMaxDistance)) then
						v_u_555 = false
						local v561 = v_u_557
						table.insert(v561, v559)
						v_u_556 = v_u_556 + (v_u_10.CFrame.p - v559.radio.Position).Magnitude / v559.radio:FindFirstChildOfClass("Sound").RollOffMaxDistance
					end
				elseif #v559:GetChildren() > 0 then
					v_u_562(v559)
				end
			end
		end
		v_u_562(workspace)
		v_u_556 = v_u_556 / #v_u_557
		if v_u_555 == true then
			v_u_543.Volume = 0.5 * v_u_543.volume.Value
		else
			v_u_543.Volume = 0.5 * v_u_543.volume.Value * v_u_556
		end
	else
		v_u_544.Visible = false
		v_u_543.Volume = 0
	end
	if v554 >= 5 then
		v554 = 0
		local v563 = 0
		local v564 = v563
		for _, v565 in pairs(v_u_437) do
			v563 = v564 + v565
			v564 = v563
		end
		local v566 = v564 / #v_u_437
		v563 = math.ceil(v566) - 1
		local v567 = {}
		v_u_437 = v567
	end
end
