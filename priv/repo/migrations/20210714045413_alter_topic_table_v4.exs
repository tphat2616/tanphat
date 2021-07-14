defmodule Tanphat.Repo.Migrations.AlterTopicTableV4 do
  use Ecto.Migration

  def change do
    alter table("topic") do
      remove :inner_html, :string
      remove :inner_html_en, :string
      add :inner_html, :text
      add :inner_html_en, :text
      add :description, :string
    end
  end
end
