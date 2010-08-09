require 'test_helper'

class JuegosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:juegos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create juego" do
    assert_difference('Juego.count') do
      post :create, :juego => { }
    end

    assert_redirected_to juego_path(assigns(:juego))
  end

  test "should show juego" do
    get :show, :id => juegos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => juegos(:one).to_param
    assert_response :success
  end

  test "should update juego" do
    put :update, :id => juegos(:one).to_param, :juego => { }
    assert_redirected_to juego_path(assigns(:juego))
  end

  test "should destroy juego" do
    assert_difference('Juego.count', -1) do
      delete :destroy, :id => juegos(:one).to_param
    end

    assert_redirected_to juegos_path
  end
end
