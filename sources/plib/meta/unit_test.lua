config.check_ast_shape = true

local suite_name = ""
local test_name = ""
local suite_count = 0

local function inject_io_write(content)
	inject_astnode(
		aster.CallMethod{
			aster.String{"write"},
			{aster.String{content}},
			aster.DotIndex{
				aster.String{"stdout"},
				aster.Id{ "io" }
			}
		}
	)
end

local function inject_io_flush()
	inject_astnode(
		aster.CallMethod{
			aster.String{"flush"},
			{},
			aster.DotIndex{
				aster.String{"stdout"},
				aster.Id{ "io" }
			}
		}
	)
end



function begin_test_suite(name)
	suite_name = name
	suite_count = 0
	inject_io_write('[ ] ' .. name .. ' : x (0)\r')
	inject_io_flush()
end

function end_test_suite()
	inject_io_write('[x] ' .. suite_name .. ' : All OK (' .. tostring(suite_count) .. ')\n')
	inject_io_flush()
end

function begin_test(name)
	test_name = name
	suite_count = suite_count + 1
	inject_io_write('[ ] ' .. suite_name .. ' : ' .. name .. ' (' .. tostring(suite_name) .. ')\r')
	inject_io_flush()
end

function end_test()

end