local _HeapItem = require(script.HeapItem)
type HeapItem = _HeapItem.HeapItem
local BinaryHeap = {}
BinaryHeap.__index = BinaryHeap

function BinaryHeap:Insert(data: any)
    local item = _HeapItem(data)

    local index = self.Size
    self.Size += 1

    item.HeapIndex = index
    self.Data[index] = item
    return item
end

function BinaryHeap:UpdateItem(item: HeapItem, newIndex: number)
    local oldIndex = item.HeapIndex
    item.HeapIndex = newIndex

    if newIndex > oldIndex then
        self:SiftUp(item)

        return
    end
    self:SiftDown(item)
end

function BinaryHeap:Has(item: HeapItem)
    return self.Data[item.HeapIndex] == item
end

function BinaryHeap:SiftUp(item: HeapItem)
    local parentIndex = (item.HeapIndex-1)/2
    while true do
        local parentItem = self.Data[parentIndex]
        if item.HeapIndex - parentItem.HeapIndex <= 0 then
            break
        end

        self:Swap(item, parentItem)
    end

    parentIndex = (item.HeapIndex-1)/2
end

function BinaryHeap:SiftDown(item: HeapItem)
    while true do
        local indexLeft = item.HeapIndex * 2 + 1;
        local indexRight = indexLeft + 1;
        local swapIndex = 0

        if indexLeft < self.Size then
            swapIndex =  indexLeft

            if indexRight < self.Size and self.Data[indexLeft] - self.Data[indexRight] < 0 then
                swapIndex = indexRight
            end

            if item.HeapIndex - swapIndex < 0 then
                self:Swap(item, self.Data[swapIndex])
            else
                return
            end
        else
            return
        end
    end
end

function BinaryHeap:Pop()
    local firstItem = self.Data[0]
    self.Size -= 1
    self.Data[0] = self.Data[self.Size]
    self.Data[0].HeapIndex = 0
    self:SiftDown(self.Data[0])
    return firstItem.Data
end

function BinaryHeap:Swap(item1: HeapItem, item2: HeapItem)
    self.Data[item1.HeapIndex], self.Data[item2.HeapIndex] = self.Data[item2.HeapIndex], self.Data[item1.HeapIndex]
    item1.HeapIndex, item2.HeapIndex = item2.HeapIndex, item1.HeapIndex
end

function BinaryHeap:GetSize()
    return self.Size
end

return function(capacity)
    local self = setmetatable({}, BinaryHeap)

    self.Capacity = capacity
    self.Data = {}
    self.Size = 0

    return self
end