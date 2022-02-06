defmodule PavonzWeb.BlogView do
  use PavonzWeb, :view

  def tags(conn, tags, separator \\ " ") do
    Enum.map(tags, fn tag ->
      link(tag, to: Routes.blog_path(conn, :index, tag)) |> safe_to_string()
    end)
    |> Enum.join(separator)
    |> raw()
  end
end
