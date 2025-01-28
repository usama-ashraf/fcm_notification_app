class NotificationsController < ApplicationController
  def create
    token = params[:token]
    title = params[:title]
    body = params[:body]
    platform = params[:platform]

    response = FCMNotificationService.send_v1_notification(
      token: token,
      title: title,
      body: body,
      platform: platform
    )

    render json: { success: true, response: response }, status: :ok
  rescue StandardError => e
    render json: { success: false, error: e.message }, status: :unprocessable_entity
  end
end