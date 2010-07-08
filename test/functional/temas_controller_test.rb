require 'test_helper'

class TemasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:temas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tema" do
    assert_difference('Tema.count') do
      post :create, :tema => { }
    end

    assert_redirected_to tema_path(assigns(:tema))
  end

  test "should show tema" do
    get :show, :id => temas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => temas(:one).to_param
    assert_response :success
  end

  test "should update tema" do
    put :update, :id => temas(:one).to_param, :tema => { }
    assert_redirected_to tema_path(assigns(:tema))
  end

  test "should destroy tema" do
    assert_difference('Tema.count', -1) do
      delete :destroy, :id => temas(:one).to_param
    end

    assert_redirected_to temas_path
  end
end
