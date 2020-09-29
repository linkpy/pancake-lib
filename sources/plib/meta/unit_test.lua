local cols = require('nelua.utils.console').colors

return function(e)
	local aster = e.aster
	local inject_astnode = e.inject_astnode

	local suite_col = cols.blue .. cols.bright
	local pipe_col = cols.white .. cols.dim
	local test_col = cols.green .. cols.bright

	local suite_name = ""
	local test_name = ""
	local suite_count = 0

	local function inject_io_write(content)
		inject_astnode(
			aster.CallMethod{
				"write",
				{aster.String{content}},
				aster.DotIndex{
					"stdout",
					aster.Id{ "io" }
				}
			}
		)
	end

	local function inject_io_flush()
		inject_astnode(
			aster.CallMethod{
				"flush",
				{},
				aster.DotIndex{
					"stdout",
					aster.Id{ "io" }
				}
			}
		)
	end



	function begin_test_suite(name)
		suite_name = name
		suite_count = 0
	end

	function begin_test(name)
		test_name = name
		suite_count = suite_count + 1
		inject_io_write(' ' .. suite_col .. suite_name .. pipe_col .. '\t' .. test_col .. name .. cols.reset .. '\n')
		inject_io_flush()
	end

end