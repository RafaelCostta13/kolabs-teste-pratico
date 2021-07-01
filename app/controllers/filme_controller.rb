class FilmeController < ApplicationController
	layout 'application'


	def index
			
	end

	def buscar_filme
		@filmes = InterfaceApi::buscar_filmes(params[:nome])
		@series = InterfaceApi::buscar_series(params[:nome])
		@coletaneas = InterfaceApi::buscar_coletaneas(params[:nome])
		@pessoas = InterfaceApi::buscar_pessoas(params[:nome])
		@palavra_chave = InterfaceApi::buscar_palavra_chave(params[:nome])
		@produtoras = InterfaceApi::buscar_produtoras(params[:nome])

		@termo_busca = params[:nome]
		respond_to do |format|
			format.html{redirect_to '/'}
			format.js
		end
		
		@count_filmes = @filmes.length 

		salvar_novos_resultados(@filmes)

		return @filmes, @count_filmes, @series, @coletaneas, @pessoas, @palavra_chave, @produtoras, @termo_busca
	end

	def detalhes_filme
		@filme = InterfaceApi::detalhes_item(params[:id])
	end

private

	def salvar_novos_resultados(filmes)
		f = Filme.new
		filmes.each do |filme|
			unless f.existe_no_banco?(filme['id'])
				f.salvar_novos(filme['id'],
							   filme['original_title'],
							   filme['overview'],
							   filme['poster_path'],
							   filme['release_date'])
			end
		end
	end



	

end
