defmodule PavonzWeb.BlogController do
  use PavonzWeb, :controller

  alias Pavonz.Blog

  plug PavonzWeb.Plug.ResponseCache
  # 6 months caching should be enough for a static website
  @cache_ttl :timer.hours(24 * 180)

  def index(conn, %{"tag" => tag}) do
    conn
    |> cache_public(@cache_ttl)
    |> render("index.html", posts: Blog.get_posts_by_tag!(tag))
  end

  def index(conn, _params) do
    conn
    |> cache_public(@cache_ttl)
    |> render("index.html", posts: Blog.all_posts())
  end

  def show(conn, %{"id" => id}) do
    conn
    |> cache_public(@cache_ttl)
    |> render("show.html", post: Blog.get_post_by_id!(id))
  end
end
