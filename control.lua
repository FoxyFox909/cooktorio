-- script.on_event(defines.events.on_player_changed_position, function(event)
script.on_event(defines.events.on_player_used_capsule, function(event)
    -- game.print("ITEM CONSUMED: " .. tostring(event.item))
    game.print("ITEM CONSUMED: " .. event.item.name)

    if event.item.name ~= "raw-fish" then
        game.print("item is not fish")
        return
    end

    
    -- game.print("got here")
end)