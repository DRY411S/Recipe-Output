-- GLOBAL defines--

local function join(delimiter, parts)

    local output = ""
    for _, part in pairs(parts) do
        if (output == "") then
            output = part
        else
            output = output .. delimiter .. part
        end
    end
    return output
end

local function extractData(data, line, limit)
    local prodcount = 1
    for _,p in pairs(data) do
        table.insert(line, p.name)
        if p.type ~= nil then
          table.insert(line, p.type)
        else
          table.insert(line, "")
        end
        if p.amount ~= nil then
            table.insert(line, p.amount)
        else
            table.insert(line, 1)
        end
        prodcount = prodcount + 1
    end
    while prodcount <= limit do
        table.insert(line, "")
        table.insert(line, "")
        table.insert(line, "")
        prodcount = prodcount + 1
    end
    return line
end

local function logrecipe(recipe, delimiter)
    -- Dumps the recipe into a logfile
    line = {recipe.name, recipe.category, recipe.group.name, recipe.subgroup.name, recipe.force.name, recipe.energy}
    line = extractData(recipe.products, line, 3)
    line = extractData(recipe.ingredients, line, 6)
    dataString = join(delimiter, line) .. "\n"

    game.write_file("recipedump.csv", dataString, true)
end

local function logrecipes()

    local headers = {"Name","Category","Group","Subgroup","Force","(Base) Craft Time"}
    local prodstring, indstring, delimiter
    delimiter = ";"
    for i = 1,3
    do
        table.insert(headers, "Product " .. i)
        table.insert(headers, "Product Type " .. i)
        table.insert(headers, "Product Amount " .. i)
    end

    for i = 1,6
    do
        table.insert(headers, "Ingredient " .. i)
        table.insert(headers, "Ingredient Type " .. i)
        table.insert(headers, "Ingredient Amount " .. i)
    end

    headerString = join(delimiter, headers)
    game.remove_path("recipedump.csv")
    game.write_file("recipedump.csv", headerString .. "\n")
	for _, nextforce in pairs(game.forces) do
		force = nextforce
				for _,v in pairs(force.recipes) do
                        logrecipe(v, delimiter)
				end
	end
end

-- LOCAL Variables
local force = nil

script.on_init(logrecipes)
script.on_event(defines.events.on_player_created, function(event)
    game.players[event.player_index].print{"recipe.dump"}
end)
