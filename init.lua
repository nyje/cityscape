cityscape = {}
cityscape.version = "1.0"

cityscape.path = minetest.get_modpath("cityscape")
cityscape.vacancies = tonumber(minetest.setting_get('cityscape_vacancies')) or 0
if cityscape.vacancies < 0 or cityscape.vacancies > 10 then
	cityscape.vacancies = 0
end
cityscape.divisions_x = tonumber(minetest.setting_get('cityscape_divisions_x')) or 3
if cityscape.divisions_x < 0 or cityscape.divisions_x > 4 then
	cityscape.divisions_x = 3
end
cityscape.divisions_z = tonumber(minetest.setting_get('cityscape_divisions_z')) or 3
if cityscape.divisions_z < 0 or cityscape.divisions_z > 4 then
	cityscape.divisions_z = 3
end

-- Check if the table contains an element.
function table.contains(table, element)
  for key, value in pairs(table) do
    if value == element then
			if key then
				return key
			else
				return true
			end
    end
  end
  return false
end

function cityscape.clone_node(name)
	local node = minetest.registered_nodes[name]
	local node2 = table.copy(node)
	return node2
end

dofile(cityscape.path .. "/nodes.lua")
dofile(cityscape.path .. "/mapgen.lua")
dofile(cityscape.path .. "/buildings.lua")

minetest.register_on_generated(cityscape.generate)
