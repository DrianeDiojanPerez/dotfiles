-- Function to get all highlight groups and their colors
function get_all_highlights()
  -- Get all highlight groups
  local highlight_groups = vim.api.nvim_get_hl(0, {})

  -- Table to store results
  local results = {}

  -- Helper function to convert decimal to hex
  local function dec_to_hex(dec)
    return string.format("#%06x", dec)
  end

  -- Process each highlight group
  for group_name, attrs in pairs(highlight_groups) do
    local fg_color = attrs.fg and dec_to_hex(attrs.fg) or "N/A"
    local bg_color = attrs.bg and dec_to_hex(attrs.bg) or "N/A"

    -- Add to results table
    table.insert(results, {
      name = group_name,
      fg = fg_color,
      bg = bg_color,
      bold = attrs.bold == true,
      italic = attrs.italic == true,
      underline = attrs.underline == true,
    })
  end

  -- Sort by group name
  table.sort(results, function(a, b) return a.name < b.name end)

  return results
end

-- Function to display highlights in a formatted way
function display_highlights()
  local highlights = get_all_highlights()

  -- Print header
  print(string.format("%-40s %-10s %-10s %-5s %-5s %-5s",
    "Highlight Group", "FG Color", "BG Color", "Bold", "Italic", "Underline"))
  print(string.rep("-", 80))

  -- Print each highlight group
  for _, hl in ipairs(highlights) do
    print(string.format("%-40s %-10s %-10s %-5s %-5s %-5s",
      hl.name,
      hl.fg,
      hl.bg,
      hl.bold and "✓" or "",
      hl.italic and "✓" or "",
      hl.underline and "✓" or ""))
  end

  print("\nTotal highlight groups: " .. #highlights)
end

-- Call the function to display all highlights
display_highlights()

-- Alternative: Save to a file
function save_highlights_to_file(filename)
  local highlights = get_all_highlights()
  local file = io.open(filename, "w")

  if not file then
    print("Could not open file: " .. filename)
    return
  end

  -- Write header
  file:write(string.format("%-40s %-10s %-10s %-5s %-5s %-5s\n",
    "Highlight Group", "FG Color", "BG Color", "Bold", "Italic", "Underline"))
  file:write(string.rep("-", 80) .. "\n")

  -- Write each highlight group
  for _, hl in ipairs(highlights) do
    file:write(string.format("%-40s %-10s %-10s %-5s %-5s %-5s\n",
      hl.name,
      hl.fg,
      hl.bg,
      hl.bold and "✓" or "",
      hl.italic and "✓" or "",
      hl.underline and "✓" or ""))
  end

  file:write("\nTotal highlight groups: " .. #highlights)
  file:close()
  print("Highlights saved to " .. filename)
end

-- Uncomment to save to a file
-- save_highlights_to_file("neovim_highlights.txt")
