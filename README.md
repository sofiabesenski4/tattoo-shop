# Tattoo Shop

This app intends to replace the tiring and burdensome process of booking, taking payments, and preserving details about tattoo appointments. 

## Main UX Flow
* Let tattooers decide when they are accepting bookings/appointments.
* Determine "Appointment" product availability from the tattooer's "Appointments"..
* Show customers the possible appointments.
* Let them "checkout" with their desired "Appointment" product.
* Accept payments (for now) through e-transfer.
* Let tattooers "Accept" payment through the Solidus Admin, and confirm the appointment.
* Ensure the accepted appointment modifies the availability for other customers.

## Secondary Goals
* Allow customers to upload reference photos/details for their appointments during checkout so the tattooer can view them.

## Future Goals
* Support multiple tattooers working in the same shop.


# Tech Stack
*  `solidus_core`
* `solidus_stater_frontend`
* SQLite database for now

## Testing
* We use RSpec as our testing framework, and Capybara for feature specs.
* `solidus_starter_frontend` came with a lot of specs out of the box, but we might want to pull back on these a bit since they take a long time to run locally.
* We don't have CI set up.

to be continued...




## Notes

Having troubles installing this on my M1 Mac

Had to run  `export NODE_OPTIONS=--openssl-legacy-provider` in my shell to get webpack to run.

