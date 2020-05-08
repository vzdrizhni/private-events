class InvitationsController < ApplicationController
  include UsersHelper

  def create
    @event = Event.find(params[:id])
    @attended_event = @event.invitations.create(attendee: current_user)
    # current_user.attended_events << @event
    if @attended_event.save
      redirect_to events_path, notice: 'Thanks for following'
    else
      redirect_to events_path, alert: 'You can only attend once (Matrix! Perhaps!?)'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    # @attended_event = @event.invitations.create(attendee: current_user)
    current_user.attended_events.destroy(@event)
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Invitation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
