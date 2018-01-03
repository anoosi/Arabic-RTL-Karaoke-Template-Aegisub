local tr = aegisub.gettext

script_name = tr"Add RTL تحويل النص من اليمين لليسار"
script_description = tr"سكربت لتحويل النصوص من اليمين لليسار، تصميم أنس الكبيسي"
script_author = "أنس الكبيسي"
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