module InvitationsHelper
  def event_attendance_button(event)
    if current_user.attending?(event)
      link_to 'Leave', unattend_event_path(event.id), method: :delete, class: 'button is-primary has-text-white'
    else
      link_to 'Join', attend_event_path(event.id), method: :post, class: 'button is-primary has-text-white'
    end
  end
end
