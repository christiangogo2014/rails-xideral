#class SwebhooksController < ApplicationController
#
#  skip_before_action :verify_authenticity_token
#
#  def create
#
#    endpoint_secret = Rails.application.credentials.stripe[:endpoint_secret]
#	payload = request.body.read
#	event = nil
#	sig_header = request.env['HTTP_STRIPE_SIGNATURE']
#
#
#    begin
#      event = Stripe::Webhook.construct_event(
#        payload, sig_header, endpoint_secret
#      )
#    rescue JSON::ParserError => e
#	   p e
#	   render json: { error: "Bad Request 1"}, :status => :bad_request
#	   return
#    rescue Stripe::SignatureVerificationError => e
#      # Invalid signature
#	   p e
#	   render json: { error: "Bad Sign"}, :status => :bad_request
#	   return
#    end
#
#
#	begin
#	   event = Stripe::Event.construct_from(
#	     JSON.parse(payload, symbolize_names: true)
#	   )
#	rescue JSON::ParserError => e
#	   # Invalid payload
#	   p e
#	   render json: { error: "Bad Request 2"}, :status => :bad_request
#	   return
#	end
#
#
#	# Handle the event
#	p event.type
#	case event.type
#		#when 'invoice.payment_succeeded'
#		#  puts '2'
#		#  puts event.data.object # contains a Stripe::PaymentMethod
#
#		# ... handle other event types
#		when 'checkout.session.completed'
#
#		  puts '3'
#		  puts event.data.object # contains a Stripe::PaymentMethod
#
#		  mosaik_id, product_code      = event.data.object.client_reference_id.split("::") rescue nil
#		  amount          = event.data.object.amount_total rescue nil
		  #
#		  if mosaik_id
#
#		      mosaik = Mosaik.find( mosaik_id )
#		      pp mosaik
#
#		       if mosaik
		       	#
#		       		mosaik.product_code = product_code
#		       		mosaik.amount = amount / 100
#
#		       		if product_code != Mosaik::SDIG
#		       			mosaik.shipping_statuses.create
#		       		end
#		       		mosaik.save
#
#					mosaik.working!
#					mosaik.delay.confirm! (mosaik.product.tail_square_width rescue Mosaik::DEFAULT_TAILE_SIZE), (mosaik.product.width rescue DEFAULT_WIDTH_SIZE)
#		       end
#
#		  else
#
#		  	print "Not found mosaik id #{mosaik_id}\n"
#
#		  end
#
#		when "payment_intent.succeeded"
#
#			puts '4'
#			puts event.data.object # contains a Stripe::PaymentMethod
#			email           = event.data.object.charges.data.billing_details.email rescue nil
#			receipt_url     = event.data.object.charges.receipt_url rescue nil
#			MailDispatcher.delay.send_recipt_ready( email, receipt_url)
#
#		else
#		  # Unexpected event type
#		  print "#{event.type}\n"
#		  render json: { error: "Bad Request"}, :status => :bad_request
#		  return
#	end
#
#
#  	render json: { success: true}
#
#  end
#end
