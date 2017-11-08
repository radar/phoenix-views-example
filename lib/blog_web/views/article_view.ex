defmodule BlogWeb.ArticleView do
  use BlogWeb, :view
  alias BlogWeb.ArticleView
  alias BlogWeb.CommentView

  def render("index.json", %{articles: articles}) do
    render_many(articles, ArticleView, "article.json")
  end

  def render("show.json", %{article: article}) do
    render_one(article, ArticleView, "article.json")
  end

  def render("article.json", %{article: article}) do
    %{id: article.id,
      title: article.title,
      comments: render_many(article.comments, CommentView, "show.json") }
  end
end
