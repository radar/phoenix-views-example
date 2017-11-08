# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Blog.Repo.insert!(%Blog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

{:ok, article} = Blog.Articles.create_article(%{title: "Test article #1"})
Ecto.build_assoc(article, :comments, %{text: "Test comment #1"}) |> Blog.Repo.insert!
Ecto.build_assoc(article, :comments, %{text: "Test comment #2"}) |> Blog.Repo.insert!

{:ok, article_2} = Blog.Articles.create_article(%{title: "Test article #2"})
Ecto.build_assoc(article_2, :comments, %{text: "Test comment #3"}) |> Blog.Repo.insert!
Ecto.build_assoc(article_2, :comments, %{text: "Test comment #4"}) |> Blog.Repo.insert!
