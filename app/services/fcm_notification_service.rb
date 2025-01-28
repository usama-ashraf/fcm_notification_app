class FCMNotificationService
  def self.send_v1_notification(token:, title:, body:, platform: 'android')
    raise 'FCM client is not initialized' unless defined?(FCM_CLIENT)

    message = {
      'token': token,
      'notification': {
        title: title,
        body: body,
      },
      'fcm_options': {
        analytics_label: 'Label'
      }
    }

    case platform
    when 'android'
      message['android'] = {
        priority: 'high',
        notification: {
          sound: 'default',
          click_action: 'FLUTTER_NOTIFICATION_CLICK'
        }
      }
    when 'ios'
      message['apns'] = {
        payload: {
          aps: {
            alert: {
              title: title,
              body: body
            },
            sound: 'default',
            badge: 1
          }
        },
        headers: {
          'apns-priority': '10',
          'apns-expiration': "#{Time.now.to_i + 3600}"
        }
      }
    else
      raise ArgumentError, "Unsupported platform: #{platform}"
    end

    response = FCM_CLIENT.send_v1(message)
    response
  end
end