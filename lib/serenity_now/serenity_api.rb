require 'httparty'

module SerenityNow
  ##
  # SerenityAPI
  #
  # Simple wrapper to consume [TVRage API](http://services.tvrage.com/info.php?page=main)
  #
  # Base URI
  # --------
  # ```
  # http://services.tvrage.com/feeds
  # ```
  #
  # XML Feeds
  # ---------
  # ```
  # Search                     /search.php?show=SHOWNAME
  # Detailed Search            /full_search.php?show=SHOWNAME
  # Show Info                  /showinfo.php?sid=SHOWID
  # Show Info + Episode List   /full_show_info.php?sid=SHOWID
  # Episode List               /episode_list.php?sid=SHOWID
  # Episode Info               /episodeinfo.php?show=SHOWNAME&exact=1&ep=SEASONxEPISODE
  # ```
  #
  # Examples for 'Buffy'
  # --------------------
  # ```
  # Search                     /search.php?show=buffy
  # Detailed Search            /full_search.php?show=buffy
  # Show Info                  /showinfo.php?sid=2930
  # Show Info + Episode List   /full_show_info.php?sid=2930
  # Episode List               /episode_list.php?sid=2930
  # Episode Info               /episodeinfo.php?sid=2930&ep=2x04
  # ```
  #
  class SerenityAPI
    include HTTParty
    base_uri 'http://services.tvrage.com/feeds'

    ##
    # Search and Detailed Search
    #
    # @param [String] show_name Show name to search. IE: `buffy`.
    # @param [Hash] options pass `detailed: true` to get detailed information
    #   about the show.
    # @return [HTTParty::Response]
    #
    def search( show_name, options = {} )
      endpoint = options[:detailed] ? '/full_search.php' : '/search.php'
      self.class.get( endpoint, query: { show: show_name } )
    end

    ##
    # Show Info and Show Info + Episode List
    #
    # @param [String,Fixnum] show_id Show ID returned by {#search}. IE: `2930`.
    # @param [Hash] options pass `list_episodes: true` to also get a list of
    #   episodes.
    # @return [HTTParty::Response]
    #
    def show_info( show_id, options = {} )
      endpoint = options[:list_episodes] ? '/full_show_info.php' : '/showinfo.php'
      self.class.get( endpoint, query: { sid: show_id } )
    end

    ##
    # List Episodes
    #
    # @param [String,Fixnum] show_id Show ID returned by {#search}. IE: `2930`.
    # @return [HTTParty::Response]
    #
    def list_episodes( show_id )
      self.class.get( '/episode_list.php', query: { sid: show_id } )
    end

    ##
    # Episode Info
    #
    # @param [String,Fixnum] show_id Show ID returned by {#search}. IE: `2930`.
    # @param [String] episode Episode number. IE: `2x04`.
    # @return [HTTParty::Response]
    #
    def episode_info( show_id, episode )
      query = { sid: show_id, ep: episode }
      self.class.get( '/episodeinfo.php', query: query )
    end

  end
end
