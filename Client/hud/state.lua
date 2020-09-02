local vector = Vector2D( 10, HUD.H - 90 )

local state_render = Render:AddText(
    HUD.Group, -- number GroupID
    "", -- string Text
    vector, -- Vector2D Position
    0, -- number FontType ( 0 = Roboto, 1 = Gothic A1, 2 = Poiret One )
    20, -- number FontSize
    Color( 1, 1, 1 ), -- Color TextColor
    0, -- number Kerning
    false, -- boolean bCenterX
    false, -- boolean bCenterY
    true, -- boolean EnableShadow
    Vector2D( 4, 4 ), -- Vector2D ShadowOffset
    Color( 0, 0, 0, 0.2 ), -- Color ShadowColor
    false, -- boolean EnableOutline
    Color( 0, 0, 0 ) -- Color OutlineColor
)

function updateState( state )
    if state_render then
        Render:UpdateItemText( HUD.Group, state_render, state or "" )

        vector.Y = HUD.H - 90
        Render:UpdateItemPosition( HUD.Group, state_render, vector )
    end
end