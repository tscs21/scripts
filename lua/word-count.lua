local BUFSIZE = 2^13 -- 8K
local f = io.input("C:\\users\\tim\\mov.txt") -- open input file
local cc, lc, wc = 0, 0, 0 -- char, line, and word counts
while true do
local lines, rest = f:read(BUFSIZE, "*line")
if not lines then break end
if rest then lines = lines .. rest .. "\n" end
cc = cc + #lines
-- count words in the chunk
local _, t = string.gsub(lines, "%S+", "")
wc = wc + t
-- count newlines in the chunk
_,t = string.gsub(lines, "\n", "\n")
lc = lc + t
end
local current = f:seek() -- get current position
local size = f:seek("end") -- get file size
file:seek("set", current) -- restore position
return size
print(lc, wc, cc)