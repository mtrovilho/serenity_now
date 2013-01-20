require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
begin; require 'turn/autorun'; rescue LoadError; end
require 'serenity_now'
