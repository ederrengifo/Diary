require 'test_helper'

class NoPasswordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @no_password = no_passwords(:one)
  end

  test "should get index" do
    get no_passwords_url
    assert_response :success
  end

  test "should get new" do
    get new_no_password_url
    assert_response :success
  end

  test "should create no_password" do
    assert_difference('NoPassword.count') do
      post no_passwords_url, params: { no_password: { text: @no_password.text } }
    end

    assert_redirected_to no_password_url(NoPassword.last)
  end

  test "should show no_password" do
    get no_password_url(@no_password)
    assert_response :success
  end

  test "should get edit" do
    get edit_no_password_url(@no_password)
    assert_response :success
  end

  test "should update no_password" do
    patch no_password_url(@no_password), params: { no_password: { text: @no_password.text } }
    assert_redirected_to no_password_url(@no_password)
  end

  test "should destroy no_password" do
    assert_difference('NoPassword.count', -1) do
      delete no_password_url(@no_password)
    end

    assert_redirected_to no_passwords_url
  end
end
