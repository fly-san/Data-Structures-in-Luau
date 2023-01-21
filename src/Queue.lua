local Queue = {}
Queue.__index = Queue

function Queue.tostring(queue)
    if queue:size() == 0 then return "[]" end

    local result = "["
    local index = queue.Head
    local tail = queue.Tail
    while index <= queue.Tail do
        result ..= tostring(queue.Data[index])
        if index < tail then
            result ..= ", "
        end
        index += 1
    end
    return result .. "]"
end

function Queue:isFull()
    return self:size() == self.Capacity
end

function Queue:isEmpty()
    return self:size() == 0
end

function Queue:size()
    return self.Size
end

function Queue:enqueue(obj)
    if self:isFull() then
        return
    end

    if self:isEmpty() then
        self.Head = 1
    end

    self.Tail += 1
    self.Data[self.Tail] = obj

    self.Size += 1
end

function Queue:dequeue()
    if self:isEmpty() then
        return
    end

    local obj = self.Data[self.Head]
    if not obj then
        return
    end

    self.Data[self.Head] = nil

    if self:isEmpty() or self.Head == self.Tail then
        self.Head = 0
        self.Tail = 0
    else
        self.Head += 1
    end

    self.Size -= 1

    return obj
end

return function(capacity)
    Queue.__tostring = Queue.tostring
    local self = setmetatable({}, Queue)

    self.Capacity = capacity - 1
    self.Data = {}

    self.Tail = 0
    self.Head = 0

    self.Size = 0

    return self
end