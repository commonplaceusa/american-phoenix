defmodule AmericanPhoenix.UserView do
  use AmericanPhoenix.Web, :view

  def render("show.json", %{session: session, user: user}) do
    if session != nil && user != nil do
      render(AmericanPhoenix.UserView, "user.json", session: session, user: user)
    end
  end

  def render("user.json", %{session: session, user: user}) do
    %{
      data: %{
        access_token: session.token,
        id: user.id,
        email: user.email
      }
    }
  end
end
