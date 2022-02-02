defmodule PavonzWeb.PageController do
  use PavonzWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
