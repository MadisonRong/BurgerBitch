module ApplicationHelper
  def login?
    cookies[:burgerbitch].nil?
  end
end
