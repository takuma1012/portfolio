class Muzzle::OrdersController < Muzzle::Base
  protect_from_forgery :except => ["create"]
  # before_action :cart_create, only: :new, unless: :session_blank?

  ###クラス変数で空の配列を定義
  @@article_array = []

  def new
    unless params[:id].blank?
      session[:article_id] = Article.find(params[:id])
    end

    ###空の配列に情報を追加
    @@article_array << session[:article_id]
    ###セッションに配列ごと入れ込む
    session[:ids] = @@article_array

    @arts = Article.where(id: session[:ids])
    @orders = History.new
    @orders.article_histories.build
    @prefectures = Delivery.all
  end

  def create
    @orders = History.new(order_params)

# 商品が0以下で購入された時の処理
    if @orders.price.to_i <= 1000
      return redirect_to muzzle_orders_new_path, notice: "現在の数量では購入できません。\n 商品を１つ以上選択必要があります。"
    else

# 支払方法別の会計処理
# 振込みの場合
      if @orders.payment == "振込み"
        @orders.pay_status = "未納"
        @orders.article_histories.each do |oah|
          if oah.article.stock < oah.quantity
            return redirect_to muzzle_orders_new_path, notice: '在庫不足の為、ご注文を承れませんでした。申し訳ございません。'
          end
          oah.article.update(stock: oah.article.stock - oah.quantity)
        end
        if @orders.save
           InformationMailer.thanks(@orders).deliver!
           session[:article_id] = nil
           @@article_array = []
           redirect_to muzzle_orders_thank_path
         else
           render :new
        end

# クレジットの場合
      elsif @orders.payment == "クレジット"
        begin
          Payjp.api_key = ENV['PAYJP_API_SECRET']

          token =Payjp::Token.create(
            :card => {
              :number => params[:number],
              :cvc => params[:cvc],
              :exp_month => params[:exp_month],
              :exp_year => params[:exp_year]})

          charge = Payjp::Charge.create(
            :amount => params[:amount],
            :card => token.id,
            :currency => 'jpy')

          @orders.pay_status = "済"
          @orders.article_histories.each do |oah|
            if oah.article.stock < oah.quantity
              return redirect_to muzzle_orders_new_path, notice: '在庫不足の為、ご注文を承れませんでした。申し訳ございません。'
            end
            oah.article.update(stock: oah.article.stock - oah.quantity)
          end
          if  @orders.save
              InformationMailer.credit(@orders).deliver!
              session[:article_id] = nil
              @@article_array = []
              redirect_to muzzle_orders_thank_path
           else
              render :new
          end

# クレジットの例外処理
          rescue Payjp::CardError
            return redirect_to muzzle_orders_new_path, notice: 'クレジットカードが認証できませんでした。お手数ですが再度、番号をご確認下さい。'
        end
      end
    end
  end

  def destroy
    @@article_array = []
    redirect_to muzzle_orders_new_path
  end

  def thank
  end

  private
  def order_params
    params.require(:history).permit(
      :last_name, :last_name_kana, :first_name, :first_name_kana,
      :postal_code, :prefecture, :city, :address, :building,
      :phone, :email, :note, :payment, :price, :id, :pay_status,
      article_histories_attributes: [:id, :article_id, :history_id, :quantity],
      article_attributes: [:stock])
  end
end
