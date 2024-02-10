
-- Lua snip for cpp
local cp_templates_dir = vim.fn.expand("$HOME") .. "/tmp/CP-template/"
local kactl = cp_templates_dir .. "kactl-main/"
local data_structures = kactl .. "/content/data-structures/"
local kactl_template_path = kactl .. "/stress-tests/utilities/template.h"

local function file_to_string(path)
    -- local f = io.open(path, "r") -- not safe
    -- use error handling
    local f = io.open(path, "r")
    if f ~= nil then
        local content = f:read("*all")
        f:close()
        -- table of lines from content
        return vim.split(content, "\n", {})
    end
    return {}
end

local function import_kactl_template(path)
    local header = file_to_string(kactl_template_path)
    local content = file_to_string(path)
    local template = {}
    for _, line in ipairs(header) do
        table.insert(template, line)
    end
    for _, line in ipairs(content) do
        table.insert(template, line)
    end
    return template
end



return {
    -- copetitive programmin template
    -- #include <bits/stdc++.h>
    -- using namespace std;
    -- 
    -- int main() {
    --    ios::sync_with_stdio(false);
    --    cin.tie(NULL);
    --
    --    return 0;
    --    }
    s("#cp-template", {
        t({
        "#include <iostream>",
        "#include <algorithm>",
        "#include <vector>",
        "using namespace std;",
        "typedef long long ll;",
        "",
        "int main() {",
        "   ios::sync_with_stdio(false);",
        "   cin.tie(0);",
        "",
        "   return 0;",
        "}"
        }
        )
    }),

    -- RMQ
    s("!RMQ" , t(import_kactl_template(data_structures .. "RMQ.h"))),

    -- Segment Tree
    s("!SegmentTree" , t(import_kactl_template(data_structures .. "SegmentTree.h"))),


}
