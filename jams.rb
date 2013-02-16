require 'appscript'
require 'sinatra'

set :logging, nil

get '/' do

  def status
    status = Appscript::app('Rdio').player_state.get.to_s
  end

  def trackName
    trackName = Appscript::app('Rdio').current_track.name.get
  end

  def trackArtist
    trackArtist = Appscript::app('Rdio').current_track.artist.get
  end

  def trackAlbum
    trackAlbum = Appscript::app('Rdio').current_track.album.get
  end

  @title = "Now playing #{ trackName } by #{ trackArtist }"

  unless status == "paused"
    @title
  end

  erb :layout
end

get '/sinatra' do
  redirect "http://sinatrarb.com"
end

get '/itunes' do
  redirect "http://rdio.com"
end
