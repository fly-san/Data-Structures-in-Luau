local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Stack = require(ReplicatedStorage.Common.Stack)
local Queue = require(ReplicatedStorage.Common.Queue)
local LinkedList = require(ReplicatedStorage.Common.LinkedList)

local linkedList = LinkedList()
for i = 1,5 do
    linkedList:append(i)
end
while not linkedList:isEmpty() do
    print(linkedList:removeLast())
    print(linkedList)
end
