defmodule BlogWeb.CommentView do
  use BlogWeb, :view
  alias BlogWeb.CommentView

  def render("show.json", %{comment: comment}) do
    render_one(comment, CommentView, "comment.json")
  end

  def render("comment.json", %{comment: comment}) do
    %{
      text: comment.text
    }
  end
end
