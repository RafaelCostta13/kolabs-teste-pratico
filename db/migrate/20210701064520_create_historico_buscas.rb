class CreateHistoricoBuscas < ActiveRecord::Migration[6.1]
  def change
    create_table :historico_buscas do |t|
      t.string :termo_pesquisa
      t.timestamps
    end
  end
end
