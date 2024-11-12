function tier_one_sticker(game, event)
    game.print("GOT HERE")
    local player = game.get_player(event.player_index)
    player.surface.create_entity{
       name = "speed-sticker",
       position = player.position,
       target = player.character
    }

    player.surface.create_entity{
        name = "small-biter",
        position = {player.position.x + 15, player.position.y + 15},        
     }
end

-- What each food is gonna do
food_match = {
    ["smoked-fish"] = tier_one_sticker,
    ["cooked-fish"] = tier_one_sticker,
    ["grilled-fish"] = tier_one_sticker,
}


function capsule_handler(event)
    game.print("ITEM CONSUMED: " .. event.item.name)

    local item_name = event.item.name

    local func = food_match[item_name]

    if func then func(game, event) end

    -- game.print(tier_one_fishes[item_name])
end

script.on_event(defines.events.on_player_used_capsule, capsule_handler) ---function(event)

-- script.on_load( function()
-- end
-- )
