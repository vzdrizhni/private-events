class InvitationsController < ApplicationController
  include UsersHelper

  def create
    @event = Event.find(params[:event_id])
    @attended_event = @event.invitations.create(attendee: current_user)
    if @attended_event.save
      redirect_to events_path, notice: 'Thanks for following'
    else
      redirect_to events_path, alert: 'You can only attend once (Matrix! Perhaps!?)'
    end
  end

  # def destroy
  #   @event = Invitation.find_by(attended_event_id: )
  #   @attended_event = @event.invitations.create(attendee: current_user)
  #   @attended_event.destroy
  #   respond_to do |format|
  #     format.html { redirect_to user_path(current_user), notice: 'Invitation was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
end
