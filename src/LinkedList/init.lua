local LinkedListNode = require(script.LinkedListNode)

local LinkedList = {}
LinkedList.__index = LinkedList

function LinkedList:Append(data: any)
    local node = LinkedListNode(data)
    self.Size += 1
    if self.Head == nil then
        self.Head = node
        return
    end

    -- find the tail
    local currentNode = self.Head
    while currentNode.Next ~= nil do
        currentNode = currentNode.Next
    end

    currentNode.Next = node
end

function LinkedList.tostring(linkedList)
    local result = "["
    local currentNode = linkedList.Head
    while currentNode do
        result ..= tostring(currentNode.Data)
        currentNode = currentNode.Next
        if currentNode then
            result ..= ", "
        end
    end
    return result .. "]"
end

function LinkedList:FindAt(index: number)
    local currentIndex = 1
    local currentNode = self.Head
    while currentNode ~= nil do
        if currentIndex == index then
            return currentNode
        end
        currentNode = currentNode.Next
        currentIndex += 1
    end
    return currentNode
end

function LinkedList:RemoveFirst()
    self:RemoveAt(1)
end

function LinkedList:RemoveLast()
    self:RemoveAt(self.Size)
end

function LinkedList:IsEmpty()
    return self.Size == 0
end

function LinkedList:RemoveAt(index: number)
    assert(index > 0)
    assert(index <= self.Size)

    local currentNode = self.Head

    if index == 1 then
        self.Size -= 1
        self.Head = currentNode.Next
        currentNode = nil
        return
    end

    local currentIndex = 1
    while currentNode ~= nil and currentIndex < index do
        local previousNode = currentNode
        currentNode = currentNode.Next
        if currentIndex == index - 1 then
            previousNode.Next = currentNode.Next
            currentNode = nil
            self.Size -= 1
            return
        end
        currentIndex += 1
    end
end

return function()
    LinkedList.__tostring = LinkedList.tostring
    local self = setmetatable({}, LinkedList)
    self.Head = nil
    self.Size = 0
    return self
end