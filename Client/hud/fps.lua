local fps_text = Render:AddText(
    HUD.Group, -- number GroupID
    "0 FPS", -- string Text
    Vector2D( 10, 10 ), -- Vector2D Position
    0, -- number FontType ( 0 = Roboto, 1 = Gothic A1, 2 = Poiret One )
    18, -- number FontSize
    Color( 1, 1, 1 ), -- Color TextColor
    0, -- number Kerning
    false, -- boolean bCenterX
    false, -- boolean bCenterY
    false, -- boolean EnableShadow
    Vector2D( 0, 0 ), -- Vector2D ShadowOffset
    Color( 0, 0, 0 ), -- Color ShadowColor
    true, -- boolean EnableOutline
    Color( 0, 0, 0 ) -- Color OutlineColor
)

Client:on( "Tick", function( dt )
    if fps_text then -- Since the Client:on( "Tick" ) is called before the Render:AddText() being done we can't update a non-existing item
        Render:UpdateItemText( HUD.Group, fps_text, math.ceil( 1 / dt ) .. " FPS" )
    end
end )