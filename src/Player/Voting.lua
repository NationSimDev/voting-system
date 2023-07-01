local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)

local VotingService = Knit.GetService("VotingService")

VotingService:RetrieveVote():andThen(function(result)
	print(result["iss_position"]["latitude"])
end):catch(function(error)
	error("Promise error: " .. error)
end)

return {}
