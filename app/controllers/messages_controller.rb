class MessagesController < ApplicationController
 skip_after_action :verify_authorized

  def index

  end

  def new
    @message = Message.new
  end

  def create
  end

  def destroy
  end
end
