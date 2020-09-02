local vector = Vector2D( 0, 0 )

local item_render = Render:AddText(
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

local vector2 = Vector2D( 0, 0 )

local ammo_render = Render:AddText(
    HUD.Group, -- number GroupID
    "", -- string Text
    vector2, -- Vector2D Position
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

local vector3 = Vector2D( 0, 0 )

local bag_render = Render:AddText(
    HUD.Group, -- number GroupID
    "", -- string Text
    vector3, -- Vector2D Position
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

local names = {
    ["NanosWorld::SK_GE36"] = "G36",
    ["NanosWorld::SK_AK47"] = "AK-47",
    ["NanosWorld::SK_AK74U"] = "AK-74",
    ["NanosWorld::SK_AP5"] = "AP5",
    ["NanosWorld::SK_SMG11"] = "Mac 11",
    ["NanosWorld::SK_Moss500"] = "Mossberg 500",
    ["NanosWorld::SK_Glock"] = "Glock",
    ["NanosWorld::SK_DesertEagle"] = "Desert Eagle",
    ["NanosWorld::SK_AR4"] = "G36",
}

local space_H = 40
function updateItem( item )
    local txt = item and item:GetType() or ""

    local size = Render:StrLen( txt, 0, 20 )
    vector.X = HUD.W - 10 - size.X
    vector.Y = HUD.H - space_H - size.Y

    if txt == "Weapon" then
        txt = names[ item:GetAssetName() ] or item:GetAssetName()

        size = Render:StrLen( txt, 0, 20 )
        vector.X = HUD.W - 10 - size.X
        vector.Y = HUD.H - space_H - size.Y

        local clip = tostring( item:GetAmmoClip() )
        local bag = "/" .. item:GetAmmoBag()

        vector3.X = HUD.W - 10 - Render:StrLen( bag, 0, 20 ).X
        vector3.Y = vector.Y + size.Y + 5
        if bag_render then
            Render:UpdateItemPosition( HUD.Group, bag_render, vector3 )
            Render:UpdateItemText( HUD.Group, bag_render, bag )
        end

        vector2.X = vector3.X - Render:StrLen( clip, 0, 30 ).X - 5
        vector2.Y = vector3.Y - 10
        if ammo_render then
            Render:UpdateItemPosition( HUD.Group, ammo_render, vector2 )
            Render:UpdateItemText( HUD.Group, ammo_render, clip )
        end
    else
        if ammo_render then
            Render:UpdateItemText( HUD.Group, ammo_render, "" )
        end

        if bag_render then
            Render:UpdateItemText( HUD.Group, bag_render, "" )
        end
    end

    if item_render then
        Render:UpdateItemText( HUD.Group, item_render, txt )
        Render:UpdateItemPosition( HUD.Group, item_render, vector )
    end
end