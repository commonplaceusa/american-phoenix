defmodule AmericanPhoenix.SessionView do
  use AmericanPhoenix.Web, :view

  def render("show.json", %{session: session}) do
    %{data: render_one(session, AmericanPhoenix.SessionView, "session.json")}
  end

  def render("session.json", %{session: session}) do
    %{token: session.token}
  end

  def render("error.json", _anything) do
    %{errors: "authentication failure"}
  end
end
