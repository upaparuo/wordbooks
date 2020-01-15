require 'test_helper'

class WordlistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get wordlists_new_url
    assert_response :success
  end

  test "should get create" do
    get wordlists_create_url
    assert_response :success
  end

  test "should get destroy" do
    get wordlists_destroy_url
    assert_response :success
  end

  test "should get update" do
    get wordlists_update_url
    assert_response :success
  end

  test "should get edit" do
    get wordlists_edit_url
    assert_response :success
  end

end
