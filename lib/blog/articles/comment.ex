defmodule Blog.Articles.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Blog.Articles.Article
  alias Blog.Articles.Comment


  schema "comments" do
    field :text, :string

    belongs_to :article, Article

    timestamps()
  end

  @doc false
  def changeset(%Comment{} = comment, attrs) do
    comment
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end
end
