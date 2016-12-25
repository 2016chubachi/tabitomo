require 'test_helper'

class TravelerBookingsControllerTest < ActionController::TestCase

  include Devise::Test::ControllerHelpers

  def setup
    @member = members( :member_11 )
    sign_in(@member)
    # binding.pry
    # showのテストで使う.member_11の１件目
    @booking = Booking.where(traveler_id: @member.traveler).first
    # showのテストで使う.member_11のbookingではない１件目
    @booking_not = Booking.where.not(traveler_id: @member.traveler).first
    # binding.pry
  end

  test "index after login" do
    # binding.pry
    get :index
    assert_response :success
    # binding.pry
    #traveler_bookings_controllerのインスタンス変数をassignで参照できるようだ
    #2016/12/25時点のテストデータでは１件取得される
    assert_equal 1,assigns(:bookings).count
    assert_template "index","indexテンプレートではない"
  end

  test "show own booking after login" do
    # travelerとしてログしんた時は自分の予約のみ参照可能
    # binding.pry
    get :show, id: @booking.id
    assert_response :success
    assert_template "show", "showテンプレートではない"
  end

  test "cannot show other traveler's booking after login" do
    # travelerとしてログしんた時は自分の予約のみ参照可能
    # binding.pry
    get :show, id: @booking_not.id
    #loginしているが他人の予約参照しているのでリダイレクトされる
    assert_response :redirect
    #リダイレクト先はtopページ
    assert_redirected_to :top
  end

  test "edit own booking after login" do
    get :edit, id: @booking.id
    assert_response :success
    assert_template "edit", "editテンプレートではない"
  end

  test "cannot edit other traveler's booking after login" do
    get :edit, id: @booking_not.id
    #loginしているが他人の予約を更新しようとしてリダイレクトされる
    assert_response :redirect
    #リダイレクト先はtopページ
    assert_redirected_to :top
  end

  test "update own booking after login" do
    put :update, id: @booking.id, booking: {traveler_telphone: "010-2222-3333"}
    # booking_scheduleのupdateはうまくいかない
    # put :update, id: @booking.id, booking: {traveler_telphone: "010-2222-3333", booking_schedules_attributes: {traveler_count: 20} }
    # put :update, id: @booking.id, booking: {traveler_telphone: "010-2222-3333", booking_schedules_attributes:{traveler_date: Date.today}}
    assert_equal "010-2222-3333",assigns(:booking).traveler_telphone
    assert_redirected_to traveler_booking_path
  end

  test "index before login" do
    # binding.pry
    sign_out(@member)
    # binding.pry
    get :index
    #loginしていないのでリダイレクトされる
    assert_response :redirect, "redirect ではない！"
    # assert_redirected_to :new_member_session, "new_member_sessionに行かない！"
    # :new_member_session だとurlにlocaleも入る。実際にはlocaleがないURLにリダイレクトされる
    # Expected "http://test.host/ja/members/sign_in" to be === "http://test.host/members/sign_in".
  end

  test "show before login" do
    # binding.pry
    sign_out(@member)
    get :show, id: @booking.id
    #loginしていないのでリダイレクトされる
    assert_response :redirect
  end

end
