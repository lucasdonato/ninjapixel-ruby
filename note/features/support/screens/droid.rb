
require_relative "android/screens"

class DroidScreens
  attr_accessor :home, :login, :my_account, :product, :cart

  def initialize
    @home = Home.new
    @login = Login.new
    @my_account = MyAccount.new
    @product = Product.new
    @cart = Cart.new
  end

  def popup
    find_element(id: "android:id/message")
  end

  def accept_popup
    find_element(id: "android:id/button1").click
  end

  def wait_popup(title)
    find_elements(class: "android.widget.TextView").text(title)
  end

  def paypal_login(user)
    find_element(accessibility_id: "Email").send_keys user["email"]
    find_element(accessibility_id: "Password").send_keys user["senha"]
    find_element(xpath: "//*[@text='Log In']").click
  end

  def pay_pal
    find_element(xpath: "//*[@text='Pay']").click
  end
end
