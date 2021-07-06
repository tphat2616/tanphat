defmodule Tanphat.Repo.Migrations.AlterTopicTableV3 do
  use Ecto.Migration

  def change do
    alter table("topic") do
      add :topic_id, :integer
    end
  end
end
