local Stack = {}
Stack.__index = Stack

function Stack:push(obj: any)
    self.StackPointer += 1
    table.insert(self.Data, obj)
    return self
end

function Stack:pop()
    if self:isEmpty() then
        return
    end

    local obj = self.Data[self.StackPointer]
    if not obj then return end
    table.remove(self.Data, self.StackPointer)
    self.StackPointer-=1
    return obj
end

function Stack:clear()
    self.Data = nil
    self.StackPointer = 0
end

function Stack:isEmpty()
    return self.StackPointer == 0
end

function Stack:size()
    return self.StackPointer
end

function Stack:peek()
    return self.Data[self.StackPointer]
end

function Stack.tostring(stack)
    local result = "["
    for i,d in ipairs(stack.Data) do
        result ..=tostring(d)
        if i < stack:size() then
            result ..= ", "
        end
    end
    return result .. "]"
end

return function()
    Stack.__tostring = Stack.tostring
    local self = setmetatable({}, Stack)

    self.Data = {}
    self.StackPointer = 0

    return self
end