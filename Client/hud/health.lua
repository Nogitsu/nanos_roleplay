local vector = Vector2D( 10, HUD.H - 50 )
local vector2 = Vector2D( 15 + Render:StrLen( "100", 0, 30 ).X, vector.Y + 10 )

local health_render = Render:AddText(
    HUD.Group, -- number GroupID
    "100", -- string Text
    vector, -- Vector2D Position
    0, -- number FontType ( 0 = Roboto, 1 = Gothic A1, 2 = Poiret One )
    30, -- number FontSize
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

local health_text_render = Render:AddText(
    HUD.Group, -- number GroupID
    "HP", -- string Text
    vector2, -- Vector2D Position
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

function updateHealth( health )
    health = tostring( health )

    if health_render then
        Render:UpdateItemText( HUD.Group, health_render, health )

        vector.Y = HUD.H - 50
        Render:UpdateItemPosition( HUD.Group, health_render, vector )
    end

    if health_text_render then
        vector2.X = 15 + Render:StrLen( health, 0, 30 ).X
        vector2.Y = HUD.H - 40
        Render:UpdateItemPosition( HUD.Group, health_text_render, vector2 )
    end
end