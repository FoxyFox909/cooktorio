log("COOKTORIO data-final-fixes")

---Originally used this func because tables are passed as reference, and all furnaces seemed to share the same
---crafting categories table.
---@param prototype_name string
---@param name string
---@param category string
local function insert_crafting_category(prototype_name, name, category)    
    local copy = table.deepcopy(data.raw[prototype_name][name].crafting_categories)

---@diagnostic disable-next-line: param-type-mismatch
    table.insert(copy, category)
    data.raw[prototype_name][name].crafting_categories = copy
end

insert_crafting_category("furnace", "stone-furnace", "smoked-culinary")
insert_crafting_category("furnace", "steel-furnace", "cooked-culinary")
insert_crafting_category("furnace", "electric-furnace", "grilled-culinary")




-- local stone_furnace_recipe_cats = table.deepcopy(data.raw["furnace"]["stone-furnace"].crafting_categories)
-- table.insert(stone_furnace_recipe_cats, "smoked-culinary")
-- data.raw["furnace"]["stone-furnace"].crafting_categories = stone_furnace_recipe_cats


