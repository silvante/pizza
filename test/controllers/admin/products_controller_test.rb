require "test_helper"

class Admin::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_product = admin_products(:one)
  end

  test "should get index" do
    get admin_products_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_product_url
    assert_response :success
  end

  test "should create admin_product" do
    assert_difference("Admin::Product.count") do
      post admin_products_url, params: { admin_product: { category_id: @admin_product.category_id, desc: @admin_product.desc, is_active: @admin_product.is_active, is_hit: @admin_product.is_hit, price: @admin_product.price, title: @admin_product.title } }
    end

    assert_redirected_to admin_product_url(Admin::Product.last)
  end

  test "should show admin_product" do
    get admin_product_url(@admin_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_product_url(@admin_product)
    assert_response :success
  end

  test "should update admin_product" do
    patch admin_product_url(@admin_product), params: { admin_product: { category_id: @admin_product.category_id, desc: @admin_product.desc, is_active: @admin_product.is_active, is_hit: @admin_product.is_hit, price: @admin_product.price, title: @admin_product.title } }
    assert_redirected_to admin_product_url(@admin_product)
  end

  test "should destroy admin_product" do
    assert_difference("Admin::Product.count", -1) do
      delete admin_product_url(@admin_product)
    end

    assert_redirected_to admin_products_url
  end
end
