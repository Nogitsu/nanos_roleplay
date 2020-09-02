Package:Require( "view.lua" )

Player:on( "Spawn", function( ply )
    local char = Character( Vector( 755.0, 6470.0, 235.0 ) )
    ply:Possess( char )
end )

Player:on( "UnPossess", function( ply, char, disconnecting )
    if disconnecting then
        char:Destroy()
    end
end )

Package:Log( "Serverside loaded" )