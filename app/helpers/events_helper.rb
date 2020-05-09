module EventsHelper
  def delete(event)
    return unless current_user.id == event.creator_id

    link_to 'Delete', event,
            method: :delete,
            class: 'button is-primary has-text-white'
  end
end
