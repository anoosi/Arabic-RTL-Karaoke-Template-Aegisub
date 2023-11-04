local tr = aegisub.gettext

script_name = tr"Add RTL
script_description = tr
script_author
script_version = "1"


function add_rtl(subtitles, selected_lines, active_line)
	for z, i in ipairs(selected_lines) do
		local l = subtitles[i]
		l.text = "‫" .. l.text
		l.text = l.text:gsub("\\N", "\\N‫‫")
		l.text = l.text:gsub("\\n", "\\n‫")
		l.text = l.text:gsub("\\t", "\\t‫")
		l.text = l.text:gsub("\\q", "\\q‫")
		l.text = l.text:gsub("\\h", "\\h‫")
		subtitles[i] = l
	end
	aegisub.set_undo_point(script_name)
end

aegisub.register_macro(script_name, script_description, add_rtl)
