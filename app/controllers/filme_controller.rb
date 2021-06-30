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
		filmes.each do |filme|

			fil = Filme.new
			fil.id_filme = filme['id']
			fil.original_title = filme['original_title']
			fil.overview = filme['overview']
			fil.poster_path = "https://image.tmdb.org/t/p/w500/" + filme['poster_path']
			fil.release = filmes['release_date']
		
			fil.save
		end
	end

end
