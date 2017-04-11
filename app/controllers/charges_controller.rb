class ChargesController < ApplicationController
    include Amount
    
    def new
        @stripe_btn_data = {
            key: "#{ Rails.configuration.stripe[:publishable_key] }",
            description: "Premium Membership - #{current_user.email}",
            amount: Amount.default
        }
    end
    
    def create
        # Creates a Stripe Customer object, for associating with the charge
        customer = Stripe::Customer.create(
            email: current_user.email,
            card: params[:stripeToken]
        )
        
        # Where the charges take place
        charge = Stripe::Charge.create(
            customer: customer.id,
            amount: Amount.default,
            description: "Premium Membership - #{current_user.email}",
            currency: 'usd'
        )
        
        current_user.update_attribute(:role, :premium)
        
        flash[:notice] = "Thanks for your payment, #{current_user.email}.  You now have access to private Wikis."
        redirect_to root_path(current_user)
        
        # Displays CardErrors when something goes wrong
        rescue Stripe::CardError => e
            flash[:alert] = e.message
            redirect_to new_charge_path
    end
    
    def downgrade
        current_user.standard!
        current_user.wikis.update_all(private: false)
        flash[:notice] = "You are now a standard Wiki user.  You only have access to public Wikis."
        redirect_to root_path(current_user)
    end
end
