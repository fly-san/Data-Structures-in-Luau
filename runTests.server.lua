-- This script is under TestService the data structures
-- It runs every module script under TestService.Tests as an instance test.

local TestEZ = require(game:GetService("ReplicatedStorage").Packages:WaitForChild("TestEZ", 5))
TestEZ.TestBootstrap:run(script.Parent.Tests:GetChildren())