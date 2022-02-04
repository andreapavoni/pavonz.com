defmodule PavonzWeb.Router do
  use PavonzWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {PavonzWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", PavonzWeb do
    pipe_through :browser

    get "/", PageController, :index

    get "/blog", BlogController, :index
    get "/blog/tag/:tag", BlogController, :index
    get "/blog/:id", BlogController, :show
  end
end
