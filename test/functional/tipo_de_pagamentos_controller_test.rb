require 'test_helper'

class TipoDePagamentosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_de_pagamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_de_pagamento" do
    assert_difference('TipoDePagamento.count') do
      post :create, :tipo_de_pagamento => { }
    end

    assert_redirected_to tipo_de_pagamento_path(assigns(:tipo_de_pagamento))
  end

  test "should show tipo_de_pagamento" do
    get :show, :id => tipo_de_pagamentos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tipo_de_pagamentos(:one).to_param
    assert_response :success
  end

  test "should update tipo_de_pagamento" do
    put :update, :id => tipo_de_pagamentos(:one).to_param, :tipo_de_pagamento => { }
    assert_redirected_to tipo_de_pagamento_path(assigns(:tipo_de_pagamento))
  end

  test "should destroy tipo_de_pagamento" do
    assert_difference('TipoDePagamento.count', -1) do
      delete :destroy, :id => tipo_de_pagamentos(:one).to_param
    end

    assert_redirected_to tipo_de_pagamentos_path
  end
end
