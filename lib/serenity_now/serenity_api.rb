require 'httparty'
# (http://services.tvrage.com/info.php?page=main)
#
# TVRage API
# ==========
# Base URI                   http://services.tvrage.com/feeds
#
# XML Feeds
# ---------
# Search                     /search.php?show=SHOWNAME
# Detailed Search            /full_search.php?show=SHOWNAME
# Show Info                  /showinfo.php?sid=SHOWID
# Show Info + Episode List   /full_show_info.php?sid=SHOWID
# Episode List               /episode_list.php?sid=SHOWID
# Episode Info               /episodeinfo.php?show=SHOWNAME&exact=1&ep=SEASONxEPISODE
# US Episode List            /fullschedule.php?country=US
# UK Episode List            /fullschedule.php?country=UK
# NL Episode List            /fullschedule.php?country=NL
# US Episode List (24h)      /fullschedule.php?country=US&24_format=1
#
# Examples for 'Buffy'
# --------------------
# Search                     /search.php?show=buffy
# Detailed Search            /full_search.php?show=buffy
# Show Info                  /showinfo.php?sid=2930
# Show Info + Episode List   /full_show_info.php?sid=2930
# Episode List               /episode_list.php?sid=2930
# Episode Info               /episodeinfo.php?sid=2930&ep=2x04
#

module SerenityNow
  class SerenityAPI
    include HTTParty
    base_uri 'http://services.tvrage.com/feeds'

    #
    # Search and Detailed Search
    #
    def search( show_name, detailed = false )
      endpoint = detailed ? '/full_search.php' : '/search.php'
      self.class.get( endpoint, query: { show: show_name } )
    end

    #
    # Show Info and Show Info + Episode List
    #
    def info( show_id, episodes = false )
      endpoint = episodes ? '/full_show_info.php' : '/showinfo.php'
      self.class.get( endpoint, query: { sid: show_id } )
    end

    #
    # Episode List
    #
    def list( show_id )
      self.class.get( '/episode_list.php', query: { sid: show_id } )
    end

    #
    # Episode Info
    #
    def e_info( show_id, episode='' )
      query = { sid: show_id, ep: episode }
      self.class.get( '/episodeinfo.php', query: query )
    end

    #
    # Full Schedule
    # available options: { country: 'US', 24_format: '1' }
    #
    def schedule( country = 'US', format24 = false )
      uri = "/fullschedule.php?country="+country+"&24_format=" + (format24 ? '1' : '0')
      self.class.get( uri )
    end

  end
end
