defmodule Tanphat.Repo.Migrations.AlterTopicTableV2 do
  use Ecto.Migration

  def change do
    alter table("topic") do
      remove :like, :integer
      remove :dislike, :integer
      add :like, :integer, default: 0
      add :dislike, :integer, default: 0
    end
  end
end
