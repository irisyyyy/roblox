--local lobbySpawn = game.Workspace.lobbyspawn
--local gameSpawn = game.Workspace.gamespawn


local minimumPlayers = 1

local ReplicatedStorage = game:GetService('ReplicatedStorage')
local timeEvent = ReplicatedStorage:WaitForChild('TimeEvent')
local endGameEvent = ReplicatedStorage:WaitForChild('EndGame')
local countdownEvent = ReplicatedStorage:WaitForChild('CountDown')
local playGameMusic = ReplicatedStorage:WaitForChild("PlayGameMusic")

--[[
function destroyCars()
	
end
]]--

local function countdown()
	local countdown = 3
	while countdown > -1 do
		countdownEvent:FireAllClients(countdown)
		wait(1)
		countdown -= 1
	end
	local changeMusic = true
	playGameMusic:FireAllClients(changeMusic)
end

-- control length of game here --
local function playgame()
	local seconds = 120
	while seconds > -1 do
		timeEvent:FireAllClients(seconds)
		wait(1)
		seconds -= 1
	end
	
end

--[[
function teleportPlayers(target)
	
end
]]--

while game.Players.NumPlayers < minimumPlayers do
	wait()
end


while true do
	
	wait (10)
	countdown()
	
	--teleportPlayers(gameSpawn)
	playgame()
	
	--destroy cars
	--destroyCars()
	
	wait(1)
	endGameEvent:FireAllClients(true)
	
	--teleportPlayers(lobbySpawn)
	
	wait(99999999)
	
end
