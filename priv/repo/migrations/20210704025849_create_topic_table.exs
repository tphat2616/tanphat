defmodule Tanphat.Repo.Migrations.CreateTopicTable do
  use Ecto.Migration

  def change do
    create table("topic") do
      add :title, :string
      add :inner_html, :string
      add :title_en, :string
      add :inner_html_en, :string
      add :url, :string

      timestamps()
    end
  end
end
