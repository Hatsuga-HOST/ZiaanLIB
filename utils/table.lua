-- table.lua (ZiaanLIB utils)
local TableUtil = {}

-- Filter table
function TableUtil:Filter(tbl, func)
    local result = {}
    for k,v in pairs(tbl) do
        if func(v, k) then
            table.insert(result, v)
        end
    end
    return result
end

-- Map table
function TableUtil:Map(tbl, func)
    local result = {}
    for k,v in pairs(tbl) do
        result[k] = func(v, k)
    end
    return result
end

-- Find first match
function TableUtil:Find(tbl, func)
    for k,v in pairs(tbl) do
        if func(v, k) then
            return v, k
        end
    end
    return nil
end

return TableUtil
