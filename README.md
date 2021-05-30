### EXAMPLE

```lua
local ImmutableProxy = require(game:GetService("ReplicatedStorage").Common.ImmutableProxy)

local Door = {}

function Door.new()
    local self = {}

    self.NotReadOnly = "Also Yes" --> MUTABLE
    self._ReadOnly = "Yes" --> Has _ prefix. IMMUTABLE
    
    return ImmutableProxy.new(self, Door) --> Acts as a replacement for the typical object setup of setting .__index and the metatable of the object. Also sets up the immutable properties back end.
end

function Door:DoSomething()
    print("DOING SOMETHING")
    self._ReadOnly = "Lol" --> Prints: Attempt to change immutable property '_ReadOnly'
end

local door = Door.new()
print(door._ReadOnly) --> Prints: Yes
door:DoSomething()--> Prints: Doing Something then throws error
print(door._ReadOnly) --> Prints: Yes