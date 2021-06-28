class CreateFilmes < ActiveRecord::Migration[6.1]
  def change
    create_table :filmes do |t|

      t.timestamps
    end
  end
end
