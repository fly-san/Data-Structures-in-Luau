local BinaryHeap = {}
BinaryHeap.__index = BinaryHeap

function BinaryHeap:Insert(data: any)
    local index = self.Size
    self.Size += 1

    self.Data[index] = data

    self:SiftUp(index)
    return index
end

function BinaryHeap:Update(index: number, newItem: any)
    local oldItem = self.Data[index]
    self.Data[index] = newItem
    if self.Comparator(newItem, oldItem) > 0 then
        self:SiftUp(index)
        return
    end
    self:SiftDown(index)
end

function BinaryHeap:HasAt(index, item)
    return self.Data[index] == item
end

function BinaryHeap:SiftUp(index)
    local parentIndex = math.floor(math.abs(index-1)/2)
    while index > 0 and self.Comparator(self.Data[index], self.Data[parentIndex]) <= 0 do
        self:Swap(index, parentIndex)

        index = parentIndex
        parentIndex = math.floor(math.abs(index-1)/2)
    end
end


--[[
   maxIndex = i

    # Left Child
    l = leftChild(i)

    if (l <= size and H[l] > H[maxIndex]) :

        maxIndex = l

    # Right Child
    r = rightChild(i)

    if (r <= size and H[r] > H[maxIndex]) :

        maxIndex = r

    # If i not same as maxIndex
    if (i != maxIndex) :

        swap(i, maxIndex)
        shiftDown(maxIndex)

]]
function BinaryHeap:SiftDown(index)
    while true do
        local maxIndex = index
        local indexLeft = index * 2 + 1;
        local indexRight = index * 2 + 2;

        if indexLeft < self:GetSize() and self.Comparator(self.Data[indexLeft], self.Data[maxIndex]) < 0 then
            maxIndex = indexLeft
        end

        if indexRight < self:GetSize() and self.Comparator(self.Data[indexRight], self.Data[maxIndex]) < 0  then
            maxIndex = indexRight
        end

        if index == maxIndex then
            return
        end

        self:Swap(index, maxIndex)
        index = maxIndex
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