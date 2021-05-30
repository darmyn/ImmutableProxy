local ImmutableProxy = {}
ImmutableProxy.__index = ImmutableProxy

function ImmutableProxy.new(object, mainObject)
    local proxy = setmetatable({}, {
        __index = function(_, i)
            if mainObject[i] then
                return mainObject[i]
            else
                return object[i]
            end
        end,

        __newindex = function(_, i, v)
            print(i, v)
            if (i):sub(1, 1) == "_" then
                print(("Attempt to change immutable property '%s'."):format(i))
            else
                object[i] = v
            end
        end
    })

    return proxy
end

return ImmutableProxy