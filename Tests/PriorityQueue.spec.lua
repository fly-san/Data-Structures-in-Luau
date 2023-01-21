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

    describe("min heap", function()

        it("should insert [-10,10[ and peek -10", function()
            local heap = Heap(10)
            local set = {}
            for i = -10, 10 do
                table.insert(set, i)
                heap:Insert(i)
            end

            table.sort(set, function(a,b) return a < b end)
            expect(heap:Peek()).to.equal(set[1])
        end)

        it("should insert [0,10[ and peek 0", function()
            local heap = Heap(10)

            local set = {}
            for i = 0, 10 do
                table.insert(set, i)
                heap:Insert(i)
            end

            expect(heap:Peek()).to.equal(0)
        end)

        it("insert and pop", function()
            local heap = Heap(10)

            heap:Insert(1)
            heap:Insert(2)
            heap:Insert(-5)
            expect(heap:Pop()).to.equal(-5)
            expect(heap:Pop()).to.equal(1)
            expect(heap:Pop()).to.equal(2)
        end)

        it("change priority", function()
            local heap = Heap(10)
            heap:Insert(1)
            heap:Insert(2)
            local x = heap:Insert(-5)
            heap:Update(x, 10)
            expect(heap:Pop()).to.equal(-5)
            expect(heap:Pop()).to.equal(1)
            expect(heap:Pop()).to.equal(2)
        end)
    end)


    describe("max heap", function()

        it("should insert [-10,10[ and peek 10", function()
            local heap = Heap(10, function(a,b)
                return b-a
            end)
            local set = {}
            for i = -10, 10 do
                table.insert(set, i)
                heap:Insert(i)
            end

            table.sort(set, function(a,b) return a > b end)
            expect(heap:Peek()).to.equal(set[1])
        end)

        it("insert and pop", function()
            local heap = Heap(10, function(a,b)
                return b-a
            end)
            heap:Insert(1)
            heap:Insert(2)
            heap:Insert(-5)
            expect(heap:Pop()).to.equal(2)
            expect(heap:Pop()).to.equal(1)
            expect(heap:Pop()).to.equal(-5)
        end)
    end)
end