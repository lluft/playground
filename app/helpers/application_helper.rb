module ApplicationHelper
  def describe_alert(name)
    raw case name
    when 'app.new_country'
      "<b>New region:</b> You are the first user to log in from this country."
    when 'user.high_velocity'
      "<b>High velocity login:</b> You logged in from two distant locations within a short period of time."
    when 'user.missing_device'
      "<b>No device:</b> We weren't able to profile your device."
    when 'device.multiple_accounts'
      "<b>Multiple accounts:</b> You have accessed 3 different accounts with this device."
    end
  end
end
