local label = script.Parent

local bestScore
local bestPlayer

local players = game.Players:GetPlayers()
local player

local ReplicatedStorage = game:GetService('ReplicatedStorage')
local timeEvent = ReplicatedStorage:WaitForChild('TimeEvent')
local endGameEvent = ReplicatedStorage:WaitForChild('EndGame')
local countdownEvent = ReplicatedStorage:WaitForChild('CountDown')

--[[ text shown before the game starts 
	put game instructions here ]]--
label.Text = "Welcome!"

-- count down --
countdownEvent.OnClientEvent:Connect(function(countdown)
	if countdown > 0 then
		label.Text = countdown
	else
		label.Text = "Go!"
		wait(0.3)
		label.Visible = false
	end
end)

-- display winner with score --
endGameEvent.OnClientEvent:Connect(function(endGame)
	if endGame == true then
		for i = 1, #players do
			player = players[i]
			local score = player.leaderstats.Coins.Value

			if not bestScore or score > bestScore then
				bestScore = score
				bestPlayer = player.Name
			end
		end

		label.Visible = true
		label.Text = "Game Over!!\n The winner is "..bestPlayer.."!\nTotal coins: "..bestScore
	end
end)
