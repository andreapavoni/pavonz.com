defmodule PavonzWeb.PageController do
  use PavonzWeb, :controller

  plug PavonzWeb.Plug.ResponseCache
  # 6 months caching should be enough for a static website
  @cache_ttl :timer.hours(24 * 180)

  def index(conn, _params) do
    conn
    |> cache_public(@cache_ttl)
    |> render("index.html")
  end
end
