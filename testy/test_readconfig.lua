package.path = package.path..";../?.lua"

local codec = require ("lj2docker.readconfig")

if not arg[1] then
	print("MUST specify a docker file...")
	return ;
end

local function printTable(tbl)
	for _, row in ipairs(tbl) do
		print(row.instruction)
		print('  ',row.arguments)
	end
end

local tbl = codec.decoder(arg[1])

printTable(tbl)


