defmodule HelloWeb.UserTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature
  alias Hello.Repo
  alias Hello.Accounts.User
  alias Hello.Accounts
  @moduletag :end_to_end

  @sessions [
    [remote_url: "http://selenium:4444/wd/hub/"]
  ]
  feature "Logging in leads to landing page with notification", %{session: session} do
    Repo.insert!(%User{
      username: "allie",
      name: "Alice"
    })

    IO.inspect(Accounts.list_users(), label: "Users from test")

    session
    |> visit("/users")
  end
end
