local Knit = require(game:GetService("ReplicatedStorage").Packages.Knit)

require(script.Parent.VotingService)

Knit.Start():catch(warn)
