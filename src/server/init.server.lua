local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Stack = require(ReplicatedStorage.Common.Stack)
local Queue = require(ReplicatedStorage.Common.Queue)
local CircularQueue = require(ReplicatedStorage.Common.CircularQueue)
local LinkedList = require(ReplicatedStorage.Common.LinkedList)

local queue = CircularQueue(5)

repeat
    queue:enqueue(math.random(1,10))
    print(queue)
until queue:isFull()

repeat
    queue:dequeue()
    print(queue)
until queue:isEmpty()