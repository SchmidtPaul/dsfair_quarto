local h2 = pandoc.Header(2, "Additional Resources (click to show)")

function Div(el)
if quarto.doc.isFormat("html") then
if el.classes:includes('custom-callout-addref') then
local content = el.content
table.insert(content, 1, h2)
return pandoc.Div(
  content,
  {class="callout-tip", collapse='true'}
)
end
end
end 