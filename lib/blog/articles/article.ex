defmodule Blog.Articles.Article do
  use Ecto.Schema
  import Ecto.Changeset
  alias Blog.Articles.Article
  alias Blog.Articles.Comment


  schema "articles" do
    field :title, :string

    has_many :comments, Comment

    timestamps()
  end

  @doc false
  def changeset(%Article{} = article, attrs) do
    article
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
