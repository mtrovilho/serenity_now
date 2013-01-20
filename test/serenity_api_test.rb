require 'minitest_helper'

class SerenityApiTest < MiniTest::Unit::TestCase
  def setup; @api = SerenityNow::SerenityAPI.new; end

  def test_search
    @api.search( 'Buffy' ).wont_be_nil
  end

  def test_detailed_search
    @api.search( 'Buffy', detailed: true ).wont_be_nil
  end

  def test_show_info
    @api.show_info( '2930' ).wont_be_nil
  end

  def test_show_info_with_episode_list
    @api.show_info( '2930', episodes: true ).wont_be_nil
  end

  def test_list_episodes
    @api.list_episodes( '2930' ).wont_be_nil
  end

  def test_episode_info
    @api.episode_info( '2930', '2x04' ).wont_be_nil
  end

end
