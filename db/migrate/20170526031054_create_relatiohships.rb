class CreateRelatiohships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.references :follower, null: false, unique: true
      t.references :following, null:false, unique: true
      t.timestamps
    end
  end
end
