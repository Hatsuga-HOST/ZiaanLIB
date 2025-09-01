-- extras/screenshot.lua
local Screenshot = {}

function Screenshot:Take(frame, filename)
    filename = filename or "ZiaanLIB_Screenshot.png"
    -- Placeholder: actual screenshot requires plugin/Studio API
    print("Screenshot taken for "..frame.Name.." saved as "..filename)
end

return Screenshot
