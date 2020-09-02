Character:on( "Possessed", function( char )
    char:SetViewMode( 0 )
end )

Character:on( "ViewModeChanged", function( char, old, new )
    if new ~= 0 then
        char:SetViewMode( 0 )
    end
end )