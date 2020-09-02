local viewport_size = Render:GetViewportSize()

HUD = {
    W = viewport_size.X, H = viewport_size.Y,
    Group = 2
}

--  > Requiring our elements
Package:Require( "hud/health.lua" )
Package:Require( "hud/state.lua" )
Package:Require( "hud/item.lua" )
Package:Require( "hud/fps.lua" )

--  > Updating every elements to fit the new size
Render:on( "ViewportResized", function( size )
    HUD.W, HUD.H = size.X, size.Y

    if not NanosWorld:GetLocalPlayer():GetControlledCharacter() then return end

    updateHealth( char:GetHealth() )
    updateState( char:IsInRagdollMode() and "Unconscious" or "" )
end )

--  > Getting texts at their new value
Character:on( "Respawn", function( char )
    if not char then return end
    if char ~= NanosWorld:GetLocalPlayer():GetControlledCharacter() then return end

    updateHealth( char:GetHealth() )
    updateState( char:IsInRagdollMode() and "Unconscious" or "" )
    updateItem()
end )

--  > On taking damage we want our health to change
Character:on( "TakeDamage", function( char )
    if not char then return end
    if char ~= NanosWorld:GetLocalPlayer():GetControlledCharacter() then return end

    updateHealth( char:GetHealth() )
end )

--  > If dead without any damage or too much damages: health = 0
Character:on( "Death", function( char )
    if not char then return end
    if char ~= NanosWorld:GetLocalPlayer():GetControlledCharacter() then return end

    updateHealth( 0 )
    updateItem()
end )

--  > Not sure to keep that
Character:on( "RagdollModeChanged", function( char, old, new )
    if not char then return end
    if char ~= NanosWorld:GetLocalPlayer():GetControlledCharacter() then return end

    updateState( new and "Unconscious" or "" )
end )

--  > On anything picked up or dropped we update the item
Character:on( "PickUp", function( char, item )
    if not char then return end
    if char ~= NanosWorld:GetLocalPlayer():GetControlledCharacter() then return end

    updateItem( item )
end )

Character:on( "Drop", function( char )
    if not char then return end
    if char ~= NanosWorld:GetLocalPlayer():GetControlledCharacter() then return end

    updateItem()
end )

--  > Shooting and reloading updates the ammo (+ the item)
Character:on( "Fire", function( char, item )
    if not char then return end
    if char ~= NanosWorld:GetLocalPlayer():GetControlledCharacter() then return end

    updateItem( item )
end )

Character:on( "Reload", function( char, item )
    if not char then return end
    if char ~= NanosWorld:GetLocalPlayer():GetControlledCharacter() then return end

    updateItem( item )
end )

--  > When the package's unloaded we remove everything
Package:on( "Unload", function()
    Render:ClearItems( HUD.Group )
end )