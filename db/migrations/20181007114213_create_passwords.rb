Hanami::Model.migration do
  change do
    create_table :passwords do
      primary_key :id

      column :encrypted, String, null: false
      column :salt,      String, null: false
      column :slug,      String, null: false, unique: true

      column :available_util, Date

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
