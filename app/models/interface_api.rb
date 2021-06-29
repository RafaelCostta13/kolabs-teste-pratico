class InterfaceApi < ApplicationRecord
	require 'json'
	require 'rest-client'
	
	BASE_URL = "https://api.themoviedb.org/3/search/"
	API_KEY = "api_key=e2e6c0526e3737f2381684d2fd63d354"
	LANGUAGE = "language=pt-BR"

	def self.buscar(query,type ,page=1)
		url = self.construir_url(query, type ,page)
		dados = RestClient.get(url)
		dados = JSON.parse(dados.body)["results"]
	end

	def self.construir_url(query, type ,page=1)

		url = BASE_URL + "#{type}?" + API_KEY + "&#{LANGUAGE}" + "&query=#{query}" + "&page=#{page}" + '&include_adult=false'
	end


	def self.buscar_filmes(query)
		type = "movie"
		@filmes = self.buscar(query, type)
	end

	def self.buscar_coletaneas(query)
		type = "collection"
		@coletaneas = self.buscar(query, type)
	end

	def self.buscar_series(query)
		type = "tv"
		@series = self.buscar(query, type)
	end

	def self.buscar_pessoas(query)
		type = "person"
		@pessoas = self.buscar(query, type)
	end

	def self.buscar_palavra_chave(query)
		type = "keyword"
		@palavra_chave = self.buscar(query, type)
	end

	def self.buscar_produtoras(query)
		type = "company"
		@produtoras = self.buscar(query, type)
	end

	def self.detalhes_item(id)
		url = "https://api.themoviedb.org/3/movie/#{id}?" + API_KEY + "&" + LANGUAGE
		dados = RestClient.get(url)
		dados = JSON.parse(dados)
	end
end
