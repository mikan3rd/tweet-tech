class CreateRelatiohships < ActiveRecord::Migration[5.0]
  def change
    create_table :relatiohships do |t|
      t.references :followed, null: false, unique: true
      t.references :following, null:false, unique: true
      t.timestamps
    end
  end
end
