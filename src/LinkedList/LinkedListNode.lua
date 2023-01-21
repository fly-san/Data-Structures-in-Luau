local LinkedListNode = {}
LinkedListNode.__index = LinkedListNode

return function(data: any)
    local self = setmetatable({}, LinkedListNode)
    self.Data = data
    self.Next = nil
    return self
end