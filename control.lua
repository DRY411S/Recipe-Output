-- GLOBAL defines--

local function logrecipes()

    local output = "Name|Category|Group|Subgroup|Force|(Base) Craft Time|"
    local prodstring, indstring
    prodstring = ""
    indstring = ""
    local prodcount = 0
    while prodcount < 6 do
        prodcount = prodcount + 1
        prodstring = prodstring .. "Product " .. prodcount .. "|Product " .. prodcount .. " Amount|"
        indstring = indstring .. "Ingredient " .. prodcount .. "|Ingredient " .. prodcount .. " Amount|"
    end
    game.write_file("recipedump.txt",output .. prodstring .. indstring .. "\n")
	for _, nextforce in pairs(game.forces) do
		force = nextforce
				for _,v in pairs(force.recipes) do
                        logrecipe(v)
				end
	end
end

function logrecipe(recipe)
    -- Dumps the recipe into a logfile
    -- Functionally not part of the mod, just useful
    local output = ""
    local prodcount = 0
    output = recipe.name .. "|" .. recipe.category .. "|" .. recipe.group.name .. "|" .. recipe.subgroup.name .. "|" .. recipe.force.name .. "|" .. recipe.energy .. "|"
    for _,p in pairs(recipe.products) do
        prodcount = prodcount + 1
        output = output .. p.name .. "|"
        if p.amount ~= nil then
            output = output .. p.amount .. "|"
        else
            output = output .. "1|"
        end
    end
    while prodcount < 6 do
        prodcount = prodcount + 1
        output = output .. "||"
    end
    prodcount = 0
    for _,p in pairs(recipe.ingredients) do
        output = output .. p.name .. "|"
        if p.amount ~= nil then
            output = output .. p.amount .. "|"
        else
            output = output .. "1|"
        end
    end
    while prodcount < 6 do
        prodcount = prodcount + 1
        output = output .. "||"
    end
    output = output .. "\n"
    game.write_file("recipedump.txt",output,true)
end

-- LOCAL Variables
local force = nil
script.on_init(logrecipes)