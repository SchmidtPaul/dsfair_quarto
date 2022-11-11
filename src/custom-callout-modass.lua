local h2 = pandoc.Header(2, "Model assumptions met? (click to show)")

function Div(el)
if quarto.doc.isFormat("html") then
if el.classes:includes('custom-callout-modass') then
local content = el.content
table.insert(content, 1, h2)
return pandoc.Div(
  content,
  {class="callout-caution", collapse='true', icon='false'}
)
end
end
end 