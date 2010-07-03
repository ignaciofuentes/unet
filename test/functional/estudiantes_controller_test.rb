require 'test_helper'

class EstudiantesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estudiantes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estudiante" do
    assert_difference('Estudiante.count') do
      post :create, :estudiante => { }
    end

    assert_redirected_to estudiante_path(assigns(:estudiante))
  end

  test "should show estudiante" do
    get :show, :id => estudiantes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => estudiantes(:one).to_param
    assert_response :success
  end

  test "should update estudiante" do
    put :update, :id => estudiantes(:one).to_param, :estudiante => { }
    assert_redirected_to estudiante_path(assigns(:estudiante))
  end

  test "should destroy estudiante" do
    assert_difference('Estudiante.count', -1) do
      delete :destroy, :id => estudiantes(:one).to_param
    end

    assert_redirected_to estudiantes_path
  end
end
