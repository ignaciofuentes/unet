class CreateRepresentantes < ActiveRecord::Migration
  def self.up
    create_table :representantes do |t|
        t.integer   :user_id,               :null => false                # optional, you can use email instead, or both
        t.integer   :grupo_estudiantil_id,  :null => false                # optional, you can use login instead, or both
      t.timestamps
    end
  end

  def self.down
    drop_table :representantes
  end
end
