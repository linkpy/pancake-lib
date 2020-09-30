
local _M = {}

function _M.rename_method(t, m, nm)
	if not t.metafields[m] then
		return
	end

	t.metafields[nm] = t.metafields[m]
	t.metafields[m] = nil
end

function _M.remove_method(t, m)
	static_assert(t.metafields[m], string.format("Method '%s' not found.", m))
	t.metafields[m] = nil
end

return _M
