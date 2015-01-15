module DashboardHelper
   def subscribe
      if current_user.subscribed?(@user)
        link_to 'Un-subscribe', toggle_subscription_path(subscription_id: @user.id, action_type: 'remove'), remote: true,
          class: 'btn btn-primary btn-lg btn-block mark-f mark-icon favorite_button'
          # confirm: 'Are you sure you want to remove this person from your favorites?'
      else
        link_to 'Subscribe', toggle_subscription_path(subscription_id: @user.id, action_type: 'add'), remote: true,
          class: 'btn btn-primary btn-lg btn-block mark-f mark-icon favorite_button'
          # confirm: 'Are you sure you want to add this person to your favorites?'
      end
  end
end
