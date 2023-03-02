defmodule StaticToDynamicWeb.PageHTML do
  use StaticToDynamicWeb, :html

  embed_templates "page_html/*"
end
