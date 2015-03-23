class UsersController < ApplicationController
# def create
#     @user = User.new(params[:user])
#     respond_to do |format|
#       if @user.save
#         #　保存後にUserMailerにウェルカムメールを送信するように指示
#         UserMailer.welcome_email(@user).deliver
#         format.html { redirect_to(@user, notice: 'User was successfully created.') }
#         format.json { render json: @user, status: :created, location: @user }
#       else
#         format.html { render action: 'new' }
#         format.json { render json: @user.errors, status: :unprocessable_entity }
#       end
#     end
#   end
def create
  # 入力したメールアドレスのユーザが存在するか調べる
  tmp_user = User.find_by_email(user_params[:email])
 
  if tmp_user && tmp_user.created
    # ユーザ作成済み
    flash.alert = "入力されたメールアドレスは登録済みです。"
    redirect_to :action => 'regist'
 
  elsif tmp_user
    # ユーザは
  既にあるが、本登録していない。一度トークンを全て使えなくする（するならhas_oneで上書く方がいいかもしれないが）
    @user = tmp_user
    Token.all.each do |token|
      # 有効期限を変更する
      token.update_attributes!(expired_at: Time.now)
    end
    # 新しいトークン生成
    @token = SecureRandom.uuid
    # 有効期限は２４時間
    @user.tokens.create!(uuid: @token, expired_at: 24.hours.since)
    # メール通知(ActionMailer)
    @mail = UserMailer.welcome_email(@user,@token).deliver
    # 仮登録成功ページヘ
    redirect_to :action => 'tmp'
  else
    @user = User.new(user_params)
    @user.created = false
 
    if @user.save
      # トークン生成
      @token = SecureRandom.uuid
      @user.tokens.create!(uuid: @token, expired_at: 24.hours.since)
      # メール通知
      @mail = UserMailer.welcome_email(@user,@token).deliver
      redirect_to :action => 'tmp'
    else
      render 'new'
    end
  end
end
def token
  # 有効期限の確認
  token = Token.find_by_uuid(params[:uuid])
  # 有効期限を過ぎていないか確認
  if token && token.expired_at > Time.now
    # ２回目アクセスできないように更新
    token.update_attributes!(expired_at: Time.now)
    @user = token.user
    @user.update_attributes!(created: true)
    # 登録完了メール通知
    flash.now.alert = "本登録が完了しました"
    @mail = TestMailer.user_complete_mail(@user).deliver
    # ログイン画面へ
    redirect_to :login
  else
    # トークンがない、もしくは２回目のアクセス -> 失敗を通知、ユーザ登録ページのリンクを貼る
    if token && token.user.created
      redirect_to :login, alert: "入力されたメールアドレスは本登録が完了しています。"
    else
      redirect_to '/users/sign_up', alert: "仮登録の有効期限が切れている。もしくは、URLが適切ではありません。"
    end
  end
end
end
