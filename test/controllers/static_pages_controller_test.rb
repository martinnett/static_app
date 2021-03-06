require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  def self.test_static_pages(page)
    test "should get #{page}" do
      get(send("#{page}_path"))
      assert_response :success
      assert_select "title", "#{page.capitalize} | #{@base_title}"
    end
  end

  test_static_pages :help
  test_static_pages :about
  test_static_pages :contact

  test "should get root" do
    get root_path
    assert_response :success
  end
end
