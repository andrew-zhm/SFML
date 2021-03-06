mutable struct CircleShape <: Drawable
    ptr::Ptr{Cvoid}
    _texture::Texture

    function CircleShape(ptr::Ptr{Cvoid})
        c = new(ptr)
        finalizer(destroy, c)
        c
    end
end

function CircleShape()
    CircleShape(ccall((:sfCircleShape_create, libcsfml_graphics), Ptr{Cvoid}, ()))
end

function copy(shape::CircleShape)
    return CircleShape(ccall((:sfCircleShape_copy, libcsfml_graphics), Ptr{Cvoid}, (Ptr{Cvoid},), shape.ptr))
end

function destroy(shape::CircleShape)
    ccall((:sfCircleShape_destroy, libcsfml_graphics), Cvoid, (Ptr{Cvoid},), shape.ptr)
end

function set_position(shape::CircleShape, position::Vector2f)
    ccall((:sfCircleShape_setPosition, libcsfml_graphics), Cvoid, (Ptr{Cvoid}, Vector2f,), shape.ptr, position)
end

function set_rotation(shape::CircleShape, angle::Real)
    ccall((:sfCircleShape_setRotation, libcsfml_graphics), Cvoid, (Ptr{Cvoid}, Cfloat,), shape.ptr, angle)
end

function set_scale(shape::CircleShape, scale::Vector2f)
    ccall((:sfCircleShape_setScale, libcsfml_graphics), Cvoid, (Ptr{Cvoid}, Vector2f,), shape.ptr, scale)
end

function set_origin(shape::CircleShape, origin::Vector2f)
    ccall((:sfCircleShape_setOrigin, libcsfml_graphics), Cvoid, (Ptr{Cvoid}, Vector2f,), shape.ptr, origin)
end

function set_radius(shape::CircleShape, radius::Real)
    ccall((:sfCircleShape_setRadius, libcsfml_graphics), Cvoid, (Ptr{Cvoid}, Cfloat,), shape.ptr, radius)
end

function set_fillcolor(shape::CircleShape, color::Color)
    ccall((:sfCircleShape_setFillColor, libcsfml_graphics), Cvoid, (Ptr{Cvoid}, Color,), shape.ptr, color)
end

function set_outlinecolor(shape::CircleShape, color::Color)
    ccall((:sfCircleShape_setOutlineColor, libcsfml_graphics), Cvoid, (Ptr{Cvoid}, Color,), shape.ptr, color)
end

function set_outline_thickness(shape::CircleShape, thickness::Real)
    ccall((:sfCircleShape_setOutlineThickness, libcsfml_graphics), Cvoid, (Ptr{Cvoid}, Cfloat,), shape.ptr, thickness)
end

function get_origin(shape::CircleShape)
    ccall((:sfCircleShape_getOrigin, libcsfml_graphics), Vector2f, (Ptr{Cvoid},), shape.ptr)
end

function get_scale(shape::CircleShape)
    ccall((:sfCircleShape_getScale, libcsfml_graphics), Vector2f, (Ptr{Cvoid},), shape.ptr)
end

function get_rotation(shape::CircleShape)
    ccall((:sfCircleShape_getRotation, libcsfml_graphics), Cfloat, (Ptr{Cvoid},), shape.ptr)
end

function get_position(shape::CircleShape)
    ccall((:sfCircleShape_getPosition, libcsfml_graphics), Vector2f, (Ptr{Cvoid},), shape.ptr)
end

function get_radius(shape::CircleShape)
    ccall((:sfCircleShape_getRadius, libcsfml_graphics), Cfloat, (Ptr{Cvoid},), shape.ptr)
end

function set_pointcount(shape::CircleShape, count::Int)
    ccall((:sfCircleShape_setPointCount, libcsfml_graphics), Cvoid, (Ptr{Cvoid}, UInt32,), shape.ptr, count)
end

function get_fillcolor(shape::CircleShape)
    ccall((:sfCircleShape_getFillColor, libcsfml_graphics), Color, (Ptr{Cvoid},), shape.ptr)
end

function get_outlinecolor(shape::CircleShape)
    ccall((:sfCircleShape_getOutlineColor, libcsfml_graphics), Color, (Ptr{Cvoid},), shape.ptr)
end

function get_outline_thickness(shape::CircleShape)
    ccall((:sfCircleShape_getOutlineThickness, libcsfml_graphics), Cfloat, (Ptr{Cvoid},), shape.ptr)
end

function get_pointcount(shape::CircleShape)
    Int(ccall((:sfCircleShape_getPointCount, libcsfml_graphics), Csize_t, (Ptr{Cvoid},), shape.ptr))
end

function get_point(shape::CircleShape, index::Integer)
    ccall((:sfCircleShape_getPoint, libcsfml_graphics), Vector2f, (Ptr{Cvoid}, Csize_t), shape, index)
end

function move(shape::CircleShape, offset::Vector2f)
    ccall((:sfCircleShape_move, libcsfml_graphics), Cvoid, (Ptr{Cvoid}, Vector2f,), shape.ptr, offset)
end

function scale(shape::CircleShape, factors::Vector2f)
    ccall((:sfCircleShape_scale, libcsfml_graphics), Cvoid, (Ptr{Cvoid}, Vector2f,), shape.ptr, factors)
end

function rotate(shape::CircleShape, angle::Real)
    ccall((:sfCircleShape_rotate, libcsfml_graphics), Cvoid, (Ptr{Cvoid}, Cfloat,), shape.ptr, angle)
end

function set_texture(shape::CircleShape, texture::Texture)
    ccall((:sfCircleShape_setTexture, libcsfml_graphics), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}, Int32,), shape.ptr, texture.ptr, false)
    shape._texture = texture
end

function set_texture_rect(shape::CircleShape, rect::IntRect)
    ccall((:sfCircleShape_setTextureRect, libcsfml_graphics), Cvoid, (Ptr{Cvoid}, IntRect,), shape.ptr, rect)
end

function get_texture(shape::CircleShape)
    Texture(call((:sfCircleShape_getTexture, libcsfml_graphics), Ptr{Cvoid}, (Ptr{Cvoid},), shape.ptr))
end

function get_texture_rect(shape::CircleShape)
    ccall((:sfCircleShape_getTextureRect, libcsfml_graphics), IntRect, (Ptr{Cvoid},), shape.ptr)
end

function get_localbounds(shape::CircleShape)
    ccall((:sfCircleShape_getLocalBounds, libcsfml_graphics), FloatRect, (Ptr{Cvoid},), shape.ptr)
end

function get_globalbounds(shape::CircleShape)
    ccall((:sfCircleShape_getGlobalBounds, libcsfml_graphics), FloatRect, (Ptr{Cvoid},), shape.ptr)
end
