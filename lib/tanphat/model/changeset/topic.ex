defmodule Topic do
    use Ecto.Schema
    import Ecto.Changeset

    @option_key [
        :title,
        :inner_html,
        :title_en,
        :inner_html_en,
        :url
    ]

    @required_key []

    schema "topic" do
        field :title, :string
        field :inner_html, :string
        field :title_en, :string
        field :inner_html_en, :string
        field :url, :string

        timestamps()
    end

    def changeset(%Topic{} = topic, params \\ %{}) do
        topic
        |> cast(params, @option_key ++ @required_key)
        |> validate_required(@required_key)
    end
end