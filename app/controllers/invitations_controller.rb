class InvitationsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @attended_event = @event.invitations.create(attendee: current_user)
    if @attended_event.save
      redirect_to events_path, notice: "Thanks for following"
    else
      redirect_to events_path, notice: "You can only attend once (Matrix! Perhaps!?)"
    end
  end
end