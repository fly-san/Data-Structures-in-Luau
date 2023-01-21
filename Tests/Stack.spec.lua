local ReplicatedStorage = game:GetService("ReplicatedStorage")
return function()

    local Stack = require(ReplicatedStorage.DataStructures.Stack)

    describe("new", function()
        local stack = Stack()

        it("should not be nil", function()
            expect(stack).to.be.ok()
        end)
        it("should be a table", function()
            expect(stack).to.be.a("table")
        end)
    end)

    describe("push pop", function()
        local stack = Stack()
        it("should insert one", function()
            expect(stack:Push(1):Pop()).to.be.equal(1)
        end)
        it("should insert", function()
            local tbl = {}
            expect(stack:Push(tbl):Pop()).to.be.equal(tbl)
        end)
    end)

    describe("peek", function()
        local stack = Stack()
        it("should insert and peek one", function()
            expect(stack:Push(1):Peek()).to.be.equal(1)
            expect(stack:Size()).to.be.equal(1)
            expect(stack:Pop()).to.be.equal(1)
        end)
    end)
end