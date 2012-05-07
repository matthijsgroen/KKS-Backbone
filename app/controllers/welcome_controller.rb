
class WelcomeController < ApplicationController

  # Render the basic layout of our application
  def index
    render layout: "application", text: ""
  end
end
