# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#   Character.create!(name: 'Luke', movie: movies.first)

Trip.destroy_all
ShortlistedActivity.destroy_all
Review.destroy_all
ActivityCategory.destroy_all
Activity.destroy_all
User.destroy_all
Category.destroy_all

puts "Making users..."
marc = User.create!(email: 'marc@gmail.com', password:'mypassword', first_name: 'Marc', second_name: 'Johnson', username: 'MJ', nationality: 'American', bio: 'Originaly from texas, I am looking for authentic and cheap places to stay' )
janice = User.create!(email: 'janice@gmail.com', password:'mypassword', first_name: 'Janice', second_name: 'Spencer', username: 'Jane', nationality: 'Scottish', bio: 'I love traveling and here to find the best places all arround the world' )
puts "Users created"

puts "Making activities.."
puces = Activity.create!(user: marc, name: 'Marché aux Puces', tod: 'Morning', price: 0, city: 'Saint-Ouen', description: 'Window-shopping (or lécher les vitrines to the locals) is a great way to take an indulgent peek at objets d’art and wild curiosities you’d never actually buy. The St-Ouen flea market and antiques fair is the perfect place to let your imagination run riot. Marvel at bearskin rugs, antique tapestries and brass diving bells in this decadently eccentric marketplace. (But try to keep your eyebrow-raising in check when you look at the price tags.) Hop off the metro at Porte de Clignancourt (line 4) and continue under the bridge until the souvenir stalls give way to side streets crammed with beautiful buys.')
basilique_sacre_coeur = Activity.create!(user: janice, name: 'Basilique du Sacré-Coeur', tod: 'Afternoon', price: 0, city: 'Paris', description: 'This palatial white marble church crowns the lively Montmartre district in the 18th arrondissement. Its interior is bedecked with gold mosaics and towering stained-glass windows, and you can listen for the peal of one of the world’s heaviest bells. Visiting the basilica is free, but there’s a charge to ascend into the dome or explore the crypt.')
champ_mars = Activity.create!(user: janice, name: 'Parc du Champ de Mars', tod: 'Afternoon', price: '0', city: 'Paris', description: 'A lift to the peak of the Eiffel Tower can squeeze the budget but views below can be equally stunning, albeit from a different angle. Parc du Champ de Mars has lawns and flowerbeds manicured with military precision (as you’d expect from a former army marching ground). Bring a blanket, wine and the best picnic ingredients you can find to this expanse of greenery and wait for the light show at dusk to set La Tour Eiffel a-twinkle.')
marche_aligre = Activity.create!(user: janice, name: 'Marché d’Aligre', tod: 'Morning', price: '0', city: 'Paris', description: 'Feast your eyes on the finest local produce at this fabulous covered food market on Place d’Aligre in the 12th arrondissement. Mountains of cheese, artisan butchers and a field of flower stalls can send you into sensory overload after wandering through a few aisles. Stop for a discreet glass of Bordeaux and get your hands floury on some crusty baguette. Ride metro line 8 to the Ledru-Rollin stop.')
arrene_lutece = Activity.create!(user: janice, name: 'Arènes de Lutèce', tod: 'Afternoon', price: '0', city: 'Paris', description: 'Trace the ruins of Paris’ Roman heritage at the Arènes de Lutèce in the Latin Quarter. Dating back to 1AD, it is thought to be the longest Roman amphitheatre ever constructed. While the arena no longer hosts gladiatorial fights, it does provide a space for a competitive sport no less formidable: pétanque.')
atelier_brancusi = Activity.create!(user: marc, name: 'Atelier Brancusi', tod: 'Morning', price: '0', city: 'Paris', description: 'Immerse yourself in the smooth shapes of Brancusi’s sculpture with a free visit to his recreated studio in front of the Centre Pompidou. The Romanian-born abstract sculptor made a name for himself with famous works like The Kiss. This Brancusi workshop is a lovingly assembled and surprisingly intimate glimpse into the mind of an artist.')
canal_st_martin = Activity.create!(user: janice, name: 'Canal St-Martin', tod: 'Evening', price: '0', city: 'Paris', description: 'Join chic Parisians at the water’s edge while the sun goes down or skip stones like the heroine of Amélie. This lively waterside haunt, between République and Gare du Nord in the 10th arrondissement, is the perfect spot to bring a picnic, pop a cork and eavesdrop on the locals.')
belleville = Activity.create!(user: janice, name: 'belleville', tod: 'Morning', price: '0', city: 'Paris', description: 'A stroll along the streets of Belleville, a district with a history of rebellion and multicultural flair, is certain to fire the imagination. Belleville’s bustling Chinatown and artist residents make it a lively place to explore. Wander up rue de Belleville to see where tragic chanteuse (female singer) Edith Piaf is said to have been born under a street lamp, then turn right onto pedestrian rue Dénoyez where you ll find Paris’ most dazzling street art. End your Belleville encounter with a meander and flop over first-class views of the city from leafy Parc de Belleville.')
jadin_tueleries = Activity.create!(user: marc, name: 'Jardin des Tuileries', tod: 'Afternoon', price: '0', city: 'Paris', description: 'Give your Paris trip a regal feel by sweeping through the historic park between the Louvre and Place de la Concorde. Tread in the dainty footsteps of Marie-Antoinette and see where Napoléon built his triumphal arch.')
parc_monceau = Activity.create!(user: janice, name: 'Parc Monceau', tod: 'Evening', price: '0', city: 'Paris', description: 'If celebrity-spotting in a cemetery is too morbid, march among France’s greats in Parc Monceau, which has statues of luminaries like Chopin and celebrated writer Guy de Maupassant. The park’s rich history makes it a fascinating spot for a promenade: this peaceful green space was the site of a massacre in 1871, and was a favourite painting spot for Monet. Throw in an extra freebie with a gander at the wonderful collection of rarely seen Chinese statuary showcased in the Musée Cernuschi, a municipal Asian Art Museum inside an elegant mansion next to the park’s eastern entrance on av Vélasquez. Take line 2 to the Monceau metro station in the 8th arrondissement.')
puts "Activities created"

puts "Making trips..."
marcstrip1 = Trip.create!(user_id: marc.id, duration: 2, trip_name: "A weekend in Paris", description:"Spending two days in Paris at the start of my interrailing holiday!", likes: 380 )
janicestrip1 = Trip.create!(user_id: janice.id, duration: 6, trip_name: "My first trip to Paris", description: "Visiting friends in Paris for a week, my first time!", likes: 2300)
puts "Trips created"

puts "Making shortlisted_activities..."
marcsactivity1 = ShortlistedActivity.create!(day: 1, trip_id: marcstrip1.id, activity_id: champ_mars.id)
marcsactivity2 = ShortlistedActivity.create!(day: 1, trip_id: marcstrip1.id, activity_id: puces.id)
marcsactivity3 = ShortlistedActivity.create!(day: 1, trip_id: marcstrip1.id, activity_id: atelier_brancusi.id)
marcsactivity4 = ShortlistedActivity.create!(day: 1, trip_id: marcstrip1.id, activity_id: jadin_tueleries.id)
marcsactivity5 = ShortlistedActivity.create!(day: 1, trip_id: marcstrip1.id, activity_id: canal_st_martin.id)
marcsactivity6 = ShortlistedActivity.create!(day: 1, trip_id: marcstrip1.id, activity_id: parc_monceau.id)
marcsactivity7 = ShortlistedActivity.create!(day: 1, trip_id: marcstrip1.id, activity_id: belleville.id)
marcsactivity8 = ShortlistedActivity.create!(day: 1, trip_id: marcstrip1.id, activity_id: basilique_sacre_coeur.id)
puts "Shortlisted activities created"

puts "Making categories..."
drinking = Category.create(name:"drinking", icon:"fas fa-cocktail")
food = Category.create(name:"food", icon:"fas fa-utensils")
beach = Category.create(name:"beach", icon:"fas fa-umbrella-beach")
historic = Category.create(name:"historic", icon:"fas fa-landmark")
mountain = Category.create(name:"mountain", icon:"fas fa-mountain")
social = Category.create(name:"social", icon:"far fa-handshake")
shopping = Category.create(name:"shopping", icon:"fas fa-shopping-bag")
nature = Category.create(name:"nature", icon:"fab fa-pagelines")
art = Category.create(name:"art", icon:"fas fa-palette")
puts "Categories created"

puts "Making activity_category links..."
ActivityCategory.create(activity_id: puces.id, category_id: shopping.id)
ActivityCategory.create(activity_id: basilique_sacre_coeur.id, category_id: historic.id)
ActivityCategory.create(activity_id: champ_mars.id, category_id: nature.id)
ActivityCategory.create(activity_id: marche_aligre.id, category_id: shopping.id)
ActivityCategory.create(activity_id: marche_aligre.id, category_id: food.id)
ActivityCategory.create(activity_id: arrene_lutece.id, category_id: historic.id)
ActivityCategory.create(activity_id: atelier_brancusi.id, category_id: art.id)
ActivityCategory.create(activity_id: canal_st_martin.id, category_id: historic.id)
ActivityCategory.create(activity_id: belleville.id, category_id: shopping.id)
ActivityCategory.create(activity_id: belleville.id, category_id: art.id)
ActivityCategory.create(activity_id: belleville.id, category_id: food.id)
ActivityCategory.create(activity_id: jadin_tueleries.id, category_id: historic.id)
ActivityCategory.create(activity_id: jadin_tueleries.id, category_id: nature.id)
ActivityCategory.create(activity_id: parc_monceau.id, category_id: nature.id)
ActivityCategory.create(activity_id: parc_monceau.id, category_id: art.id)
puts "activity_category links created"

puts "FINISHED!"
