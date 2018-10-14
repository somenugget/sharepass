Hanami::Model.migration do
  change do
    create_table :transitions do
      primary_key :id

      foreign_key :password_id, :passwords, on_delete: :cascade, null: false

      column :ip, String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
