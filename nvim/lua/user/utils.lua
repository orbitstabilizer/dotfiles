
function PlistToXml()
    vim.cmd("silent !plutil -convert xml1 " .. vim.fn.expand("%"))
end

function XmlToPlist()
    vim.cmd("silent !plutil -convert binary1 " .. vim.fn.expand("%"))
end

--Create autocmd to trigger the conversion functions for .plist files
vim.cmd[[
    augroup plistConversion
        autocmd!
        autocmd BufEnter *.plist command! PlistBinToXml lua PlistToXml()
        autocmd BufEnter *.plist command! PlistXmlToBin lua XmlToPlist()
    augroup END
]]


vim.g.compile_on_save = 0 -- 1 to enable, 0 to disable

function ToggleCompileOnSave()
    vim.g.compile_on_save = 1 - vim.g.compile_on_save
end

function Compile(file_type, file_name)
    -- quote file name
    file_name = "\"" .. file_name .. "\""
    -- if make file exists, use it
    if vim.fn.filereadable("Makefile") == 1 then
        local fname_noext = file_name:gsub("%."..file_type, "")
        vim.cmd("make " .. fname_noext)
    else
        -- if not, use g++ or gcc
        if file_type == "cpp" then
            vim.cmd("!g++ -std=c++17 " .. file_name .. " -o " .. file_name:gsub("%.cpp", ""))
        elseif file_type == "c" then
            vim.cmd("!gcc " .. file_name .. " -o " ..  file_name:gsub("%.c", "") )
        elseif file_type == "rs" then
            vim.cmd("!cargo run")
        elseif file_type == 'java' then
            vim.cmd("!javac " .. file_name)
        end

    end
end
-- Compile on save
vim.api.nvim_exec([[
  augroup FiletypeSpecificCompileOnSave
    autocmd!
    autocmd BufWritePost *.cpp if exists('g:compile_on_save') && g:compile_on_save | lua Compile("cpp", vim.fn.expand("%"))
    autocmd BufWritePost *.c if exists('g:compile_on_save') && g:compile_on_save | lua Compile("c", vim.fn.expand("%"))
    autocmd BufWritePost *.rs if exists('g:compile_on_save') && g:compile_on_save | lua Compile("rs", vim.fn.expand("%"))
    autocmd BufWritePost *.java if exists('g:compile_on_save') && g:compile_on_save | lua Compile("java", vim.fn.expand("%"))
    autocmd BufWritePost *.tex if exists('g:compile_on_save') && g:compile_on_save | lua Compile("tex", vim.fn.expand("%"))
  augroup END
]], false)


