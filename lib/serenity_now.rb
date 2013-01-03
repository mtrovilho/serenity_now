require "serenity_now/serenity_api"

module SerenityNow
  @api = SerenityNow::SerenityAPI.new

  #
  # Search and Detailed Search
  #
  def self.search( show_name, detailed = false )
    @api.search(show_name, detailed)["Results"]["show"] rescue []
  end

  #
  # Show Info and Show Info + Episode List
  #
  def self.info( show_id, episodes = false )
    results = @api.info(show_id, episodes)
    episodes ? results["Show"] : results["Showinfo"] rescue nil
  end

  #
  # Episode List
  #
  def self.list( show_id )
    results = @api.list(show_id)
    return unless show = results["Show"]
    episodes = show.delete("Episodelist")
    { show: show, seasons: episodes["Season"] }
  end

  #
  # Episode Info
  #
  def self.e_info( show_id, episode='' )
    @api.e_info(show_id, episode)["show"] rescue nil
  end

  #
  # Full Schedule
  # available options: { country: 'US', 24_format: '1' }
  #
  def self.schedule( country = 'US', format24 = false )
    @api.schedule(country, format24)["schedule"]["DAY"] rescue nil
  end
end
