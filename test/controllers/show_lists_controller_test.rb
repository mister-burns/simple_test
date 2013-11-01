require 'test_helper'

class ShowListsControllerTest < ActionController::TestCase
  setup do
    @show_list = show_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:show_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create show_list" do
    assert_difference('ShowList.count') do
      post :create, show_list: { country: @show_list.country, format: @show_list.format, lable: @show_list.lable, language: @show_list.language, network: @show_list.network, number_of_episodes: @show_list.number_of_episodes, number_of_seasons: @show_list.number_of_seasons, release_date: @show_list.release_date, wiki_page_id: @show_list.wiki_page_id, wiki_page_revision_id: @show_list.wiki_page_revision_id }
    end

    assert_redirected_to show_list_path(assigns(:show_list))
  end

  test "should show show_list" do
    get :show, id: @show_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @show_list
    assert_response :success
  end

  test "should update show_list" do
    patch :update, id: @show_list, show_list: { country: @show_list.country, format: @show_list.format, lable: @show_list.lable, language: @show_list.language, network: @show_list.network, number_of_episodes: @show_list.number_of_episodes, number_of_seasons: @show_list.number_of_seasons, release_date: @show_list.release_date, wiki_page_id: @show_list.wiki_page_id, wiki_page_revision_id: @show_list.wiki_page_revision_id }
    assert_redirected_to show_list_path(assigns(:show_list))
  end

  test "should destroy show_list" do
    assert_difference('ShowList.count', -1) do
      delete :destroy, id: @show_list
    end

    assert_redirected_to show_lists_path
  end
end
