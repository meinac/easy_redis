ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "easyredis")

ActiveRecord::Schema.define(version: 0) do
  create_table :users, force: true do |t|
    t.string :name
  end
end
