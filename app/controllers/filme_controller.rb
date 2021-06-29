class FilmeController < ApplicationController
	layout 'application'

	# Endpoint API - Buscar filme atravez de uma frase
	# https://api.themoviedb.org/3/search/movie?api_key=e2e6c0526e3737f2381684d2fd63d354&language=pt-BR&query=madagascar&page=1&include_adult=false

	# Base url img
	# https://image.tmdb.org/t/p/w500/<< poster_path >>	

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

		return @filmes, @count_filmes, @series, @coletaneas, @pessoas, @palavra_chave, @produtoras, @termo_busca
	end


	def buscar_series
		@series = InterfaceApi::buscar_series(params[:nome])
		respond_to do |format|
			format.html{redirect_to '/'}
			format.js
		end
	end

	def buscar_pessoas
		@pessoas = InterfaceApi::buscar_pessoas(params[:nome])
		respond_to do |format|
			format.html{redirect_to '/'}
			format.js
		end
	end
end
