local ReplicatedStorage = game:GetService("ReplicatedStorage")
return function()

    local Heap = require(ReplicatedStorage.DataStructures.BinaryHeap)

    describe("new", function()
        local heap = Heap(10)

        it("should not be nil", function()
            expect(heap).to.be.ok()
        end)
        it("should be a table", function()
            expect(heap).to.be.a("table")
        end)
    end)

    describe("thinging", function()
        local heap = Heap(10)

        it("be alive", function()
            local i = heap:Insert(2)
            local j = heap:Insert(6)
            heap:UpdateItem(j, 0)
            print(heap:Pop())
            expect(heap).to.be.ok()
        end)
        
    end)
end