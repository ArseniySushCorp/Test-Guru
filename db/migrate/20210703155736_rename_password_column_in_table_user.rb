class RenamePasswordColumnInTableUser < ActiveRecord::Migration[6.1]
  change_table :users do |t|
    t.rename :password, :password_digest
  end
end
