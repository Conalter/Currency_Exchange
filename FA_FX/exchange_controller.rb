require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/foreign_exchange.rb' )

  #index
  get '/foreign-exchange' do
    @exchange = ForeignExchange.all()
    erb(:index)
  end
