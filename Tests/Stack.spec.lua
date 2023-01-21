local ReplicatedStorage = game:GetService("ReplicatedStorage")
return function()

    local Stack = require(ReplicatedStorage.DataStructures.Stack)

    describe("new", function()
        local stack = Stack()
        it("should not be nil", function()
            expect(stack).never.to.be.equal(nil)
        end)
        it("should be a table", function()
            expect(stack).to.be.a("table")
        end)
    end)
end