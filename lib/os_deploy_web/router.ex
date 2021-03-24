defmodule OsDeployWeb.Router do
  @moduledoc false
  use OsDeployWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", OsDeployWeb do
    pipe_through :api

    get "/", ApiController, :index
  end
end
