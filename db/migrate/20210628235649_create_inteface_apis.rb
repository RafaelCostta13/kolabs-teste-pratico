class CreateIntefaceApis < ActiveRecord::Migration[6.1]
  def change
    create_table :inteface_apis do |t|

      t.timestamps
    end
  end
end
