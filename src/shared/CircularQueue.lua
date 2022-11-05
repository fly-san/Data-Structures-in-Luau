local Queue = {}
Queue.__index = Queue

function Queue.tostring(queue)
    if queue:size() == 0 then return "[]" end
    local result = "["
    if queue.Tail >= queue.Head then
        local i = queue.Head
        while i <= queue.Tail do
            result ..= tostring(queue.Data[i])
            if i < queue.Tail then
                result ..= ", "
            end
            i += 1
        end
    else
        local i = queue.Head
        while i <= queue.Capacity do
            result ..= tostring(queue.Data[i]) .. ", "
            i += 1
        end
        local j = 1
        while j <= queue.Tail do
            result ..= tostring(queue.Data[j])
            if i < queue.Tail then
                result ..= ", "
            end
            j += 1
        end
    end

    return result .. "]"
end

function Queue:isFull()
    return (self.Head == 1 and self.Tail == self.Capacity) or (self.Head == self.Tail + 1)
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

    self.Tail = (self.Tail + 1) % (self.Capacity + 1)
    self.Tail = if self.Tail == 0 then 1 else self.Tail
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
        self.Head = (self.Head + 1) % (self.Capacity + 1)
        self.Head = if self.Head == 0 then 1 else self.Head
    end

    self.Size -= 1

    return obj
end

return function(capacity)
    Queue.__tostring = Queue.tostring
    local self = setmetatable({}, Queue)

    self.Capacity = capacity
    self.Data = {}

    self.Tail = 0
    self.Head = 0

    self.Size = 0

    return self
end