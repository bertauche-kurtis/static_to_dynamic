defmodule StaticToDynamicWeb.Layouts do
  use StaticToDynamicWeb, :html

  embed_templates "layouts/*"
end
