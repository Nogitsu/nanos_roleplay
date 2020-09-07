Package:Require( "hud/init.lua" )

Client:on( "Console", function( txt )
    Package:Log( txt )
    if txt == "getpos" then
        local pos = NanosWorld:GetLocalPlayer():GetControlledCharacter():GetLocation()

        Package:Log( "Vector( " .. pos.X .. ", " .. pos.Y .. ", " .. pos.Z .. " )" )
    end
end )

NanosWorld:on( "SpawnLocalPlayer", function( ply )
    local welcome = WebUI( "Welcome", "file:///html/menus/welcome.html" )
    Client:SetMouseEnabled( true )
    welcome:SetFocus()

    welcome:on( "Validated", function( name, surname, gender )
        welcome:Destroy()
        Client:SetMouseEnabled( false )

        Package:Log( "Registered " .. name .. " " .. surname .. " as " .. ( gender and "a female" or "a male" ) )
    end )
end )

Package:Log( "Clientside loaded" )