local SPRITES = {
  {
    { 0, 0, 15, 15, 0,   0, 15, 0, 0, 0,    0, 0, 15, 15, 0, 0 },
    { 0, 15, 0, 0, 15,   0, 15, 0, 0, 0,    0, 15, 0, 0, 15, 0 },
    { 0, 15, 0, 0, 15,   0, 15, 0, 0, 0,    0, 15, 0, 0, 15, 0 },
    { 0, 15, 15, 15, 15, 0, 15, 0, 0, 0,    0, 15, 15, 15, 15, 0 },
    { 0, 15, 0, 0, 15,   0, 15, 0, 0, 0,    0, 15, 0, 0, 15, 0 },
    { 0, 15, 0, 0, 15,   0, 15, 0, 0, 0,    0, 15, 0, 0, 15, 0 },
    { 0, 15, 0, 0, 15,   0, 15, 15, 15, 15, 0, 15, 0, 0, 15, 0 }
  },
  {
    { 0, 15, 15, 15, 0, 0,  0, 15, 15, 0,   0, 0, 15, 15, 0, 0 },
    { 0, 15, 0, 0, 15, 0,  15, 0, 0, 15,   0, 15, 0, 0, 15, 0 },
    { 0, 15, 0, 0, 15, 0,  15, 0, 0, 15,   0, 15, 0, 0, 0, 0 },
    { 0, 15, 15, 15, 0, 0, 15, 15, 15, 15, 0, 0, 15, 15, 0, 0 },
    { 0, 15, 0, 0, 15, 0,  15, 0, 0, 15,   0, 0, 0, 0, 15, 0 },
    { 0, 15, 0, 0, 15, 0,  15, 0, 0, 15,   0, 15, 0, 0, 15, 0 },
    { 0, 15, 15, 15, 0, 0, 15, 0, 0, 15,   0, 0, 15, 15, 0, 0 }
  },
  {
    { 15, 15, 15, 15, 15, 0, 15, 15, 15, 15, 0, 15, 15, 15, 0, 0 },
    { 0, 0, 15, 0, 0, 0, 15, 0, 0, 0, 0, 15, 0, 0, 15, 0 },
    { 0, 0, 15, 0, 0, 0, 15, 0, 0, 0, 0, 15, 0, 0, 15, 0 },
    { 0, 0, 15, 0, 0, 0, 15, 15, 15, 0, 0, 15, 15, 15, 0, 0 },
    { 0, 0, 15, 0, 0, 0, 15, 0, 0, 0, 0, 15, 0, 0, 15, 0 },
    { 0, 0, 15, 0, 0, 0, 15, 0, 0, 0, 0, 15, 0, 0, 15, 0 },
    { 0, 0, 15, 0, 0, 0, 15, 15, 15, 15, 0, 15, 0, 0, 15, 0 }
  }
  -- {
  --   {0, 15, 0, 0, 15, 0, 15, 0, 0, 15, 0, 0, 0, 0},
  --   {15, 0, 15, 0, 15, 0, 15, 0, 15, 0, 15, 0, 0, 0},
  --   {15, 0, 15, 0, 15, 0, 15, 0, 15, 0, 0, 0, 0, 0},
  --   {15, 15, 15, 0, 15, 0, 15, 0, 15, 15, 0, 0, 0, 0},
  --   {15, 0, 15, 0, 15, 0, 15, 0, 15, 0, 15, 0, 0, 0},
  --   {15, 0, 15, 0, 15, 0, 15, 0, 15, 0, 15, 0, 0, 0},
  --   {15, 0, 15, 0, 0, 15, 0, 0, 0, 15, 0, 0, 15, 0}
  -- },
  -- {
  --   { 0, 15, 0, 0, 0, 15, 0, 0, 0, 15, 0, 0, 15, 0, 0, 0 },
  --   { 15, 0, 15, 0, 15, 0, 15, 0, 15, 15, 15, 0, 15, 0, 0, 0 },
  --   { 15, 0, 15, 0, 15, 0, 15, 0, 0, 15, 0, 0, 15, 15, 0, 0 },
  --   { 0, 0, 15, 0, 0, 15, 0, 0, 0, 15, 0, 0, 15, 15, 0, 0 },
  --   { 0, 15, 0, 0, 15, 0, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  --   { 15, 0, 0, 0, 15, 0, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
  --   { 15, 15, 15, 0, 0, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
  -- }
}

local TOP_VERTICAL_SPRITE_BUFFER = false
local BOTTOM_VERTICAL_SPRITE_BUFFER = false
local VIEW_SPRITE_SELECT = true
local MAX_X = grid_size_x()
local MAX_Y = grid_size_y()
local vertical_offset = 0


local activated_sprite_brightness = 15
local deactivated_sprite_brightness = 4

local active_sprite_id = 1

function grid(x, y, z)
  local dirty_screen = false
  if (y == MAX_Y and x <= #SPRITES) and z == 1 then
    active_sprite_id = x
    dirty_screen = true
  end

  if dirty_screen then
    render_grid()
  end
end

function render_blank_grid()
  for x = 1, MAX_X do
    for y = 1, MAX_Y do
      grid_led(x, y, 0)
    end
  end
end

function render_sprite_select()
  for x = 1, #SPRITES do
    local brightness = deactivated_sprite_brightness

    if active_sprite_id == x then
      brightness = activated_sprite_brightness
    end
    grid_led(x, MAX_Y, brightness)
  end
end

function render_sprite(n)
  local sprite = SPRITES[n]
  if not sprite then return end

  for x = 1, MAX_X do
    for y = 1, MAX_Y do
      grid_led(x, y, 0)
    end
  end

  local min_y = 1
  if TOP_VERTICAL_SPRITE_BUFFER then
    min_y = 2
  end

  local max_y = MAX_Y
  if BOTTOM_VERTICAL_SPRITE_BUFFER then
    max_y = MAX_Y - 1
  end

  for sprite_y = min_y, max_y do
    local row = sprite[sprite_y]
    if row then
      for sprite_x = 1, MAX_X do
        local grid_x = sprite_x
        local grid_y = sprite_y - vertical_offset
        if grid_x <= MAX_X and grid_y <= max_y and grid_y >= min_y and row[sprite_x] and row[sprite_x] > 0 then
          grid_led(grid_x, grid_y, row[sprite_x])
        end
      end
    end
  end
end

function render_grid()
  render_blank_grid()

  render_sprite(active_sprite_id)

  if VIEW_SPRITE_SELECT then
    render_sprite_select()
  end
  grid_refresh()
end

render_grid()
