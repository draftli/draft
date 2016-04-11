defmodule Draft.Web.PageControllerTest do
  use Draft.Web.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Draft"
  end
end
