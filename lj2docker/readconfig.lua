-- File for reading a docker file and turning
-- it into a lua table
--readconfig.lua

--[[
	Docker Instructions
	ADD
	CMD
	COPY
	ENTRYPOINT
	ENV
	EXPOSE
	FROM
	LABEL
	MAINTAINER
	ONBUILD
	RUN
	USER
	VOLUME
	WORKDIR
--]]

local instructionpatt = "^(%g+)%s+(.*)$"

local function decoder(filepath)
	local tbl = {}

	for line in io.lines(filepath) do
		verb, args = line:match(instructionpatt);

		if verb then
			table.insert(tbl, {instruction = verb, arguments = args})
		end
	end

	return tbl;
end


return {
	decoder = decoder;
}