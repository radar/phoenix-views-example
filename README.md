# Phoenix Views Example

This came out of an IRC discussion about why views were better than rendering JSON in the controller, and then later on there was an [Elixir Forum post](https://elixirforum.com/t/what-are-the-advantages-of-using-a-render-json-view-vs-rendering-json-objects-directly-using-json-conn-data-is/10175) asking the same thing. See the post for information.

---

First, run the usual Phoenix app setup:

```
mix deps.get
```

Then:

```
mix do ecto.create, ecto.migrate, run priv/repo/seeds.exs
```

Then:

```
mix phx.server
```

When you go to `http://localhost:4000/articles` you'll see a list of articles with their comments. They also appear at `/articles/1` and `/articles/2`.

This is accomplished by using Phoenix's wonderful views. Looking at the `index` action in `ArticleController`, there's this:

```elixir
render(conn, "index.json", articles: articles)
```

This uses the `ArticleView` to do the rendering, rather than rendering JSON outright. `ArticleView` has this function:

```elixir
def render("index.json", %{articles: articles}) do
  render_many(articles, ArticleView, "article.json")
end
```

This is the function that is called from your controller. It calls `render_many`, which will call the `render` function again on this same view, but instead of `index.json` it uses `article.json`, which is defined like this:

```elixir
def render("article.json", %{article: article}) do
  %{id: article.id,
    title: article.title,
    comments: render_many(article.comments, CommentView, "show.json") }
end
```

This then calls this `render` function in the `CommentView`:

```elixir
def render("comment.json", %{comment: comment}) do
  %{
    text: comment.text
  }
end
```

Overall, it's beneficial to render things this way because you can recycle functions between views. For instance, rendering a comment in a URL like `/articles/1/comments/2` could re-use that same function, if you wanted to.
