class InvitationsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @event.invitations.create!(attendee: current_user)
      redirect_to events_path, notice: "Thanks for following"
  end
end