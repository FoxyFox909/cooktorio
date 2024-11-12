function table_to_string(tbl)
--- source: https://gist.github.com/justnom/9816256
    local result = "{"
    for k, v in pairs(tbl) do
        -- Check the key type (ignore any numerical keys - assume its an array)
        if type(k) == "string" then
            result = result.."[\""..k.."\"]".."="
        end

        -- Check the value type
        if type(v) == "table" then
            result = result..table_to_string(v)
        elseif type(v) == "boolean" then
            result = result..tostring(v)
        else
            result = result.."\""..v.."\""
        end
        result = result..","
    end
    -- Remove leading commas from the result
    if result ~= "" then
        result = result:sub(1, result:len()-1)
    end
    return result.."}"
end

-- local smoked_recipe_category = {
--     type = "recipe-category",
--     name = "smoked-culinary"
-- }



-- -- data:extend{smoked_recipe_category, data.raw["recipe-category"]}
-- data:extend{smoked_recipe_category}

-- Recipe categories
data:extend{
    {
        type = "recipe-category",
        name = "smoked-culinary"
    },
    {
        type = "recipe-category",
        name = "cooked-culinary"
    },
    {
        type = "recipe-category",
        name = "grilled-culinary"
    },
}

-- data.raw["furnace"]["stone-furnace"].crafting_categories += (smoked_recipe_category)
-- table.insert(data.raw["furnace"]["stone-furnace"].crafting_categories, smoked_recipe_category)
-- data.extend{["furnace"]["stone-furnace"].crafting_categories = smoked_recipe_category}
-- lua_pushstring(data.raw["furnace"]["stone-furnace"].crafting_categories, "smoked-culinary")
-- data.raw["furnace"]["stone-furnace"].crafting_categories = {smoked_recipe_category}

local default_fish_spoil_ticks = data.raw["capsule"]["raw-fish"].spoil_ticks

local smoked_fish = table.deepcopy(data.raw["capsule"]["raw-fish"]) -- copy the table that defines item
smoked_fish.name = "smoked-fish"
smoked_fish.icons = {
  {
    icon = smoked_fish.icon,
    icon_size = smoked_fish.icon_size,
    tint = {r=1,g=0,b=0,a=1}
  }
}
smoked_fish.spoil_ticks = default_fish_spoil_ticks * 1.5
-- create the recipe prototype from scratch
local smoked_fish_recipe = {
  type = "recipe",
  name = "smoked-fish",
  enabled = true,
  category = "smoked-culinary",
  energy_required = 4, -- time to craft in seconds (at crafting speed 1)
  result_is_always_fresh = true,
  ingredients = {
    {type = "item", name = "raw-fish", amount = 1}
  },
  results = {{type = "item", name = "smoked-fish", amount = 1}}
}

local cooked_fish = table.deepcopy(data.raw["capsule"]["raw-fish"]) -- copy the table that defines the heavy armor item into the fireArmor variable
cooked_fish.name = "cooked-fish"
cooked_fish.icons = {
  {
    icon = cooked_fish.icon,
    icon_size = cooked_fish.icon_size,
    tint = {r=0,g=1,b=0,a=1}
  },
}
cooked_fish.spoil_ticks = default_fish_spoil_ticks * 1.5
-- create the recipe prototype from scratch
local cooked_fish_recipe = {
  type = "recipe",
  name = "cooked-fish",
  enabled = true,
  category = "cooked-culinary",
  energy_required = 4, -- time to craft in seconds (at crafting speed 1)
  result_is_always_fresh = true,
  ingredients = {
    {type = "item", name = "raw-fish", amount = 1}
  },
  results = {{type = "item", name = "cooked-fish", amount = 1}}
}

local grilled_fish = table.deepcopy(data.raw["capsule"]["raw-fish"])
grilled_fish.name = "grilled-fish"
grilled_fish.icons = {
  {
    icon = smoked_fish.icon,
    icon_size = smoked_fish.icon_size,
    tint = {r=0,g=0,b=1,a=1}
  },
}
grilled_fish.spoil_ticks = default_fish_spoil_ticks * 1.5
local grilled_fish_recipe = {
  type = "recipe",
  name = "grilled-fish",
  enabled = true,
  category = "grilled-culinary",
  energy_required = 4,
  result_is_always_fresh = true,
  ingredients = {
    {type = "item", name = "raw-fish", amount = 1}    
  },
  results = {{type = "item", name = "grilled-fish", amount = 1}}
}

data:extend{smoked_fish, smoked_fish_recipe, cooked_fish, cooked_fish_recipe, grilled_fish, grilled_fish_recipe}

-- Stickers

---@type data.StickerPrototype
local speed_sticker = {
    type = "sticker",
    name = "speed-sticker",
    duration_in_ticks = 200,
    target_movement_modifier = 1.12,
    target_movement_modifier_to = 1.0
}

data:extend{speed_sticker}

-- log("COOKTORIO TEST")
-- log(table_to_string(data.raw["furnace"]["stone-furnace"].crafting_categories))
-- log(table_to_string(data.raw["recipe-category"]))

-- log("COOKTORIO COOKED")