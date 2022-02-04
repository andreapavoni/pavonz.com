defmodule PavonzWeb.BlogController do
  use PavonzWeb, :controller

  alias Pavonz.Blog

  def index(conn, %{"tag" => tag}) do
    render(conn, "index.html", posts: Blog.get_posts_by_tag!(tag))
  end

  def index(conn, _params) do
    render(conn, "index.html", posts: Blog.all_posts())
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.html", post: Blog.get_post_by_id!(id))
  end
end
