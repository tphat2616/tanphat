defmodule Topic do
  use Ecto.Schema
  import Ecto.Changeset

  @option_key [
    :title,
    :inner_html,
    :title_en,
    :inner_html_en,
    :url,
    :like,
    :dislike,
    :topic_id
  ]

  @required_key []

  schema "topic" do
    field :title, :string
    field :inner_html, :string
    field :title_en, :string
    field :inner_html_en, :string
    field :url, :string
    field :like, :integer
    field :dislike, :integer
    field :topic_id, :integer

    timestamps()
  end

  def changeset(%Topic{} = topic, params \\ %{}) do
    topic
    |> cast(params, @option_key ++ @required_key)
    |> validate_required(@required_key)
  end
end
