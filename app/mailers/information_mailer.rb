class InformationMailer < ApplicationMailer

add_template_helper(ActionView::Helpers::UrlHelper)

  def thanks(orders)
    @order = orders
    @art_hist = @order.article_histories

    mail(
      to: orders.email,
      subject: 'ご購入有難うございます',
    ) do |format|
      format.html
    end
  end

  def credit(orders)
    @order = orders
    @art_hist = @order.article_histories

    mail(
      to: orders.email,
      subject: 'ご購入有難うございます',
    ) do |format|
      format.html
    end
  end

  def news(user)
    @user = user

    mail(
      to: user.email,
      subject: 'コンテンツが更新されました',
    ) do |format|
      format.html
    end
  end

  def welcome
    # @user = user

    # mail(
    #   to: "stealth-taku@live.jp",
    #   subject: 'welcome to The Muzzle Member',
    # ) do |format|
    #   format.html
    # end
  end
end
