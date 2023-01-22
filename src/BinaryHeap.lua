local BinaryHeap = {}
BinaryHeap.__index = BinaryHeap

function BinaryHeap:Insert(data: any)
    local index = self.Size
    self.Size += 1

    self.Data[index] = data

    return self:SiftUp(index)
end

function BinaryHeap:Update(index: number, newItem: any)
    local oldItem = self.Data[index]
    self.Data[index] = newItem
    if self.Comparator(newItem, oldItem) < 0 then
        self:SiftUp(index)
        return
    end
    self:SiftDown(index)
end

function BinaryHeap:HasAt(index, item)
    return self.Data[index] == item
end

function BinaryHeap:IsEmpty()
    return self.Size == 0
end

function BinaryHeap:IsFull()
    return self.Size == self.Capacity
end

function BinaryHeap:SiftUp(index)
    local parentIndex = math.floor(math.abs(index-1)/2)
    while index > 0 and self.Comparator(self.Data[index], self.Data[parentIndex]) <= 0 do
        self:Swap(index, parentIndex)

        index = parentIndex
        parentIndex = math.floor(math.abs(index-1)/2)
    end
    return index
end

function BinaryHeap:SiftDown(index)
    while true do
        local swapIndex = index
        local indexLeft = index * 2 + 1;
        local indexRight = index * 2 + 2;

        if indexLeft < self:GetSize() and self.Comparator(self.Data[indexLeft], self.Data[swapIndex]) < 0 then
            swapIndex = indexLeft
        end

        if indexRight < self:GetSize() and self.Comparator(self.Data[indexRight], self.Data[swapIndex]) < 0  then
            swapIndex = indexRight
        end

        if index == swapIndex then
            return
        end

        self:Swap(index, swapIndex)
        index = swapIndex
    end
end

function BinaryHeap:Peek()
    return self.Data[0]
end

function BinaryHeap:Pop()
    local firstItem = self.Data[0]
    self.Size -= 1
    self.Data[0] = self.Data[self.Size]
    self:SiftDown(0)
    return firstItem
end

function BinaryHeap:Swap(index1, index2)
    self.Data[index1], self.Data[index2] = self.Data[index2], self.Data[index1]
end

function BinaryHeap:GetSize()
    return self.Size
end

return function(capacity: number, comparator: ((any, any) -> number)?)
    local self = setmetatable({}, BinaryHeap)

    self.Capacity = capacity
    self.Comparator = comparator or function(a,b) return a - b end
    self.Data = {}
    self.Size = 0

    return self
end