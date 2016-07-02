defmodule AmericanPhoenix.ErrorViewTest do
  use AmericanPhoenix.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.html" do
    assert render(AmericanPhoenix.ErrorView, "404.json", []) ==
           %{errors: %{detail: "Page not found"}}
  end

  test "render 500.html" do
    assert render(AmericanPhoenix.ErrorView, "500.json", []) ==
           %{errors: %{detail: "Server internal error"}}
  end

  test "render any other" do
    assert render(AmericanPhoenix.ErrorView, "505.json", []) ==
           %{errors: %{detail: "Server internal error"}}
  end
end
