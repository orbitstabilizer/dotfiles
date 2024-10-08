
local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local l = require("luasnip.extras").lambda
-- local rep = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local types = require("luasnip.util.types")
-- local conds = require("luasnip.extras.conditions")
-- local conds_expand = require("luasnip.extras.conditions.expand")
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

    s("#lazy-plugin", {
        t({
        "local M = {",
        "    \"<git/repo>\",",
        "",
        "    opts = {",
        "    },",
        "}",
        "",
        "M.config = function()",
        "    require(\"<plugin>\").setup(M.opts)",
        "    local wk = require(\"which-key\")",
        "    wk.register({",
        "        -- add keybindings here",
        "    })",
        "end",
        "return M",
        }
        )
    }),
}
