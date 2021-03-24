defmodule OsDeployWeb.ApiController do
  @moduledoc false
  use OsDeployWeb, :controller

  def index(conn, _params) do
    json(conn, %{message: "Hello, World!"})
  end
end
