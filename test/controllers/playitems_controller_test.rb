require 'test_helper'


class PlayitemsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @playitem = playitems(:one)
  end

  test "should get index" do
    get playitems_url, as: :json
    assert_response :success
  end

  test "should create playitem" do
    assert_difference('Playitem.count') do
      post playitems_url, params: { playitem: { cmd: @playitem.cmd, order: @playitem.order, page_id: @playitem.page_id, value: @playitem.value } }, as: :json
    end

    assert_response 201
  end

  test "should show playitem" do
    get playitem_url(@playitem), as: :json
    assert_response :success
  end

  test "should update playitem" do
    patch playitem_url(@playitem), params: { playitem: { cmd: @playitem.cmd, order: @playitem.order, page_id: @playitem.page_id, value: @playitem.value } }, as: :json
    assert_response 200
  end

  test "should destroy playitem" do
    assert_difference('Playitem.count', -1) do
      delete playitem_url(@playitem), as: :json
    end

    assert_response 204
  end
end

