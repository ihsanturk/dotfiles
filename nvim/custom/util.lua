local self = {}


function self.cnoreapattern(lhs, rhs, pattern)
	vim.api.nvim_command('cnoreabbrev <expr> '..lhs..
		' (getcmdtype() == ":" && getcmdline() =~ "'..pattern..
		'")? "'..rhs..'" : "'..lhs..'"')
end

function self.unixexe(name)
	self.cnoreapattern(name, '!'..name, '^'..name..'$')
end


return self
