local HeapItem = {}
HeapItem.__index = HeapItem

export type HeapItem = {
    Data: any,
    HeapIndex: number
}

return function(data: any) : HeapItem
    local self = setmetatable({}, HeapItem)
    self.Data = data
    self.HeapIndex = -1
    return self
end