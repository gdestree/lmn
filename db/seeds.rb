# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

items = [
	{address:"barney@lostmy.name", email_type:"Shipment", event:"send", time_of_event: 1471895905},
	{address:"vitor@lostmy.name", email_type:"UserConfirmation", event:"send", time_of_event: 1471895906},
	{address:"tal@lostmy.name",email_type:"Order", event:"send", time_of_event: 1471895907},
	{address:"tom@lostmy.name",email_type:"GetABookDiscount", event:"send", time_of_event: 1471895908},
	{address:"patrick@lostmy.name",email_type:"GetABookDiscount", event:"send", time_of_event: 1471895909},
	{address:"barney@lostmy.name",email_type:"UserConfirmation", event:"send", time_of_event: 1471895910},
	{address:"tom@lostmy.name",email_type:"UserConfirmation", event:"click", time_of_event: 1471895911},
	{address:"tony@lostmy.name",email_type:"ReferAFriend", event:"send", time_of_event: 1471895912},
	{address:"vitor@lostmy.name",email_type:"Shipment", event:"open", time_of_event: 1471895913},
	{address:"jacob@lostmy.name",email_type:"Order", event:"send", time_of_event: 1471895914},
	{address:"vitor@lostmy.name",email_type:"ReferAFriend", event:"open", time_of_event: 1471895915},
	{address:"rehat@lostmy.name",email_type:"GetABookDiscount", event:"send", time_of_event: 1471895916},
	{address:"jacob@lostmy.name",email_type:"UserConfirmation", event:"open", time_of_event: 1471895917},
	{address:"f@lostmy.name",email_type:"ReferAFriend", event:"click", time_of_event: 1471895918},
	{address:"barney@lostmy.name",email_type:"ReferAFriend", event:"send", time_of_event: 1471895919},
	{address:"tom@lostmy.name",email_type:"ReferAFriend", event:"send", time_of_event: 1471895920},
	{address:"rehat@lostmy.name",email_type:"ReferAFriend", event:"send", time_of_event: 1471895921},
	{address:"rehat@lostmy.name",email_type:"GetABookDiscount", event:"click", time_of_event: 1471895923},
	{address:"barney@lostmy.name",email_type:"Order", event:"open", time_of_event: 1471895924},
	{address:"barney@lostmy.name",email_type:"ReferAFriend", event:"send", time_of_event: 1471895925},
	{address:"vitor@lostmy.name",email_type:"Order", event:"send", time_of_event: 1471895926}
]

Item.create(items)