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
marc = User.create!(email: 'marc@gmail.com', password:'mypassword', first_name: 'Marc', second_name: 'Johnson', username: 'MJ', nationality: 'United States', bio: 'Originaly from texas, I am looking for authentic and cheap places to stay' )
janice = User.create!(email: 'janice@gmail.com', password:'mypassword', first_name: 'Janice', second_name: 'Spencer', username: 'Jane', nationality: 'Scotland', bio: 'I love traveling and here to find the best places all arround the world' )
luke = User.create!(email: 'luke@gmail.com', password:'mypassword', first_name: 'Luke', second_name: 'Chapel', username: 'Chapers', nationality: 'Ireland', bio: 'Hey guys, I am traveling all arround Europe and looking for the bests spots 😎' )
barry = User.create!(email: 'barry@gmail.com', password:'mypassword', first_name: 'Barry', second_name: 'Brown', username: 'Bazzer', nationality: 'England', bio: 'Oi, my name is Bazzers, I am 30 something and I have a passion for exploring the planet' )
puts "Users created"

puts "Making activities.."
puces = Activity.create!(remote_photo_url: "https://res.cloudinary.com/nmozzer/image/upload/v1567514377/puces_avihwa.jpg",user: marc, name: 'Marché aux Puces', tod: 'Morning', price: 0, city: 'Paris', description: 'Window-shopping (or lécher les vitrines to the locals) is a great way to take an indulgent peek at objets d’art and wild curiosities you’d never actually buy. The St-Ouen flea market and antiques fair is the perfect place to let your imagination run riot. Marvel at bearskin rugs, antique tapestries and brass diving bells in this decadently eccentric marketplace. (But try to keep your eyebrow-raising in check when you look at the price tags.) Hop off the metro at Porte de Clignancourt (line 4) and continue under the bridge until the souvenir stalls give way to side streets crammed with beautiful buys.')
basilique_sacre_coeur = Activity.create!(remote_photo_url: "https://res.cloudinary.com/nmozzer/image/upload/v1567514377/sacre-coeur_vagywp.jpg", user: janice, name: 'Basilique du Sacré-Coeur', tod: 'Afternoon', price: 0, city: 'Paris', description: 'This palatial white marble church crowns the lively Montmartre district in the 18th arrondissement. Its interior is bedecked with gold mosaics and towering stained-glass windows, and you can listen for the peal of one of the world’s heaviest bells. Visiting the basilica is free, but there’s a charge to ascend into the dome or explore the crypt.')
champ_mars = Activity.create!(remote_photo_url: "https://res.cloudinary.com/nmozzer/image/upload/v1567514376/champs_de_mars_igsewm.jpg", user: janice, name: 'Parc du Champ de Mars', tod: 'Afternoon', price: '0', city: 'Paris', description: 'A lift to the peak of the Eiffel Tower can squeeze the budget but views below can be equally stunning, albeit from a different angle. Parc du Champ de Mars has lawns and flowerbeds manicured with military precision (as you’d expect from a former army marching ground). Bring a blanket, wine and the best picnic ingredients you can find to this expanse of greenery and wait for the light show at dusk to set La Tour Eiffel a-twinkle.')
marche_aligre = Activity.create!(remote_photo_url: "https://res.cloudinary.com/nmozzer/image/upload/v1567514376/marche-aligre_gkxaus.jpg", user: janice, name: 'Marché d’Aligre', tod: 'Morning', price: '0', city: 'Paris', description: 'Feast your eyes on the finest local produce at this fabulous covered food market on Place d’Aligre in the 12th arrondissement. Mountains of cheese, artisan butchers and a field of flower stalls can send you into sensory overload after wandering through a few aisles. Stop for a discreet glass of Bordeaux and get your hands floury on some crusty baguette. Ride metro line 8 to the Ledru-Rollin stop.')
arrene_lutece = Activity.create!(remote_photo_url: "https://res.cloudinary.com/nmozzer/image/upload/v1567514377/arene_Lutece_kzurhn.jpg", user: janice, name: 'Arènes de Lutèce', tod: 'Afternoon', price: '0', city: 'Paris', description: 'Trace the ruins of Paris’ Roman heritage at the Arènes de Lutèce in the Latin Quarter. Dating back to 1AD, it is thought to be the longest Roman amphitheatre ever constructed. While the arena no longer hosts gladiatorial fights, it does provide a space for a competitive sport no less formidable: pétanque.')
atelier_brancusi = Activity.create!(remote_photo_url: "https://res.cloudinary.com/nmozzer/image/upload/v1567514376/brancusi_xlhgxb.jpg", user: marc, name: 'Atelier Brancusi', tod: 'Morning', price: '0', city: 'Paris', description: 'Immerse yourself in the smooth shapes of Brancusi’s sculpture with a free visit to his recreated studio in front of the Centre Pompidou. The Romanian-born abstract sculptor made a name for himself with famous works like The Kiss. This Brancusi workshop is a lovingly assembled and surprisingly intimate glimpse into the mind of an artist.')
canal_st_martin = Activity.create!(remote_photo_url: "https://res.cloudinary.com/nmozzer/image/upload/v1567514376/canal_st_martin_e2xaa3.jpg", user: janice, name: 'Canal St-Martin', tod: 'Evening', price: '0', city: 'Paris', description: 'Join chic Parisians at the water’s edge while the sun goes down or skip stones like the heroine of Amélie. This lively waterside haunt, between République and Gare du Nord in the 10th arrondissement, is the perfect spot to bring a picnic, pop a cork and eavesdrop on the locals.')
belleville = Activity.create!(remote_photo_url: "https://res.cloudinary.com/nmozzer/image/upload/v1567514376/belleville_xqihlj.jpg",user: janice, name: 'belleville', tod: 'Morning', price: '0', city: 'Paris', description: 'A stroll along the streets of Belleville, a district with a history of rebellion and multicultural flair, is certain to fire the imagination. Belleville’s bustling Chinatown and artist residents make it a lively place to explore. Wander up rue de Belleville to see where tragic chanteuse (female singer) Edith Piaf is said to have been born under a street lamp, then turn right onto pedestrian rue Dénoyez where you ll find Paris’ most dazzling street art. End your Belleville encounter with a meander and flop over first-class views of the city from leafy Parc de Belleville.')
jadin_tueleries = Activity.create!(remote_photo_url: "https://res.cloudinary.com/nmozzer/image/upload/v1567514376/jardin_des_truileries_cnpsqa.jpg", user: marc, name: 'Jardin des Tuileries', tod: 'Afternoon', price: '0', city: 'Paris', description: 'Give your Paris trip a regal feel by sweeping through the historic park between the Louvre and Place de la Concorde. Tread in the dainty footsteps of Marie-Antoinette and see where Napoléon built his triumphal arch.')
parc_monceau = Activity.create!(remote_photo_url: "https://res.cloudinary.com/nmozzer/image/upload/v1567514376/parc_monceau_q70i7z.jpg", user: janice, name: 'Parc Monceau', tod: 'Evening', price: '0', city: 'Paris', description: 'If celebrity-spotting in a cemetery is too morbid, march among France’s greats in Parc Monceau, which has statues of luminaries like Chopin and celebrated writer Guy de Maupassant. The park’s rich history makes it a fascinating spot for a promenade: this peaceful green space was the site of a massacre in 1871, and was a favourite painting spot for Monet. Throw in an extra freebie with a gander at the wonderful collection of rarely seen Chinese statuary showcased in the Musée Cernuschi, a municipal Asian Art Museum inside an elegant mansion next to the park’s eastern entrance on av Vélasquez. Take line 2 to the Monceau metro station in the 8th arrondissement.')
gulbenkian = Activity.create!(remote_photo_url: 'https://res.cloudinary.com/nmozzer/image/upload/v1567521917/Gulbenkian_bhek3l.jpg',user: luke , name: 'Gulbenkian', tod: 'Evening', price: '0', city: 'Lisbon', description: 'Gulbenkian is a huge concrete bunker of a museum surrounded by a garden with a lake. There’s an impressive amphitheatre on site that hosts regular concerts but for some free fun – head to the lake and lay down on a blanket to watch the ducks and soak up the sunshine')
feira_da_ladra = Activity.create!(remote_photo_url: 'https://res.cloudinary.com/nmozzer/image/upload/v1567521917/Feira_da_ladra_ud9fjn.jpg',user: barry , name: 'Feira da Ladra', tod: 'Afternoon', price: '0', city: 'Lisbon', description: 'Feira da Ladra literally translates to ‘Thief Fair’ and is the oldest market in Lisbon. It sells a mishmash of all sorts of things – from vintage evening gowns, to hand painted tiles. Even if you don’t have a budget to buy anything, the market is a fascinating place to walk around and take a few photos!')
jardim_real = Activity.create!(remote_photo_url: 'https://res.cloudinary.com/nmozzer/image/upload/v1567521917/Jardim_do_princpe_real_laaehl.jpg',user: luke , name: 'Jardim do Príncipe Real', tod: 'Afternoon', price: '0', city: 'Lisbon', description: 'ardim do Principe Real has been a favourite spot in Lisbon for locals to hang out for centuries. Old men like to come to the garden to play cards, families take their kids to the playground, and couples sit in the shade of the stunning cypress tree, which is more than 100 years old. What’s more, there’s a Biological Products Market every Saturday with deliciously fresh fruit and vegetables for sale.')
miradouro = Activity.create!(remote_photo_url: 'https://res.cloudinary.com/nmozzer/image/upload/v1567521917/miradouro_x4aoql.jpg',user: barry , name: 'Miradouro de Nossa Senhora do Monte', tod: 'Afternoon', price: '0', city: 'Lisbon', description: 'Lisbon is a city spread out over seven hills, which means there are some wonderful viewpoints to enjoy. Although it’s not the most popular of the peaks, Miradouro de Nossa Senhora do Monte is the highest point in the city and offers truly breathtaking views of Lisbon, without the tourist crowds.')
torre_de_belem = Activity.create!(remote_photo_url: 'https://res.cloudinary.com/nmozzer/image/upload/v1567521917/bellem_t4w7hf.jpg',user: luke , name: 'Torre de Belém', tod: 'Afternoon', price: '16', city: 'Lisbon', description: 'Rising out of the sea, Torre de Belém looks like something out of a fairy-tale. This beautiful tower, which stands at the mouth of the Tagus River, was built in the 16thcentury and has become the most iconic building in Lisbon. Other buildings to marvel at in the area include Jeronimos Monastery’s, Church of Santa Maria de Belem and the Discoveries Monument. There are some amazing stories behind this part of Lisbon and booking the Belem Walking Tour is a wonderful way to experience everything the area has to offer.')
martim_moniz = Activity.create!(remote_photo_url: 'https://res.cloudinary.com/nmozzer/image/upload/v1567521917/martim_moniz_m1qvm9.jpg',user: barry , name: 'Martim Moniz', tod: 'Evening', price: '0', city: 'Lisbon', description: 'Named after a noble knight, Martim Moniz is a square full of life and one of the most multicultural areas in Lisbon. There are Chinese grocery stores, Indian eateries and Turkish kebab shops on this block. On weekends there are often a DJs spinning tunes in the square and local kids playing football.')
castelo = Activity.create!(remote_photo_url: 'https://res.cloudinary.com/nmozzer/image/upload/v1567521916/castelo_mcbyqt.jpg',user: barry , name: 'Castelo São Jorge', tod: 'Afternoon', price: '6', city: 'Lisbon', description: 'Lisbon’s castle is pretty hard to miss, perched at the top of a hill downtown above the old Alfama neighborhood. It’s a steep 20-30 minute walk up to the entrance, but once you’ve persevered, you’re treated to some of the best views in the city.')
puts "Activities created"

puts "Making trips..."
marcstrip1 = Trip.create!(user_id: marc.id, duration: 2, trip_name: "A weekend in Paris", description:"Spending two days in Paris at the start of my interrailing holiday!", likes: 380 )
janicestrip1 = Trip.create!(user_id: janice.id, duration: 6, trip_name: "My first trip to Paris", description: "Visiting friends in Paris for a week, my first time!", likes: 2300)
lukestrip1 = Trip.create!(user_id: luke.id, duration: 4, trip_name: "4 days in Portugal", description:"Cultural extravaganza", likes: 237 )
barrystrip1 = Trip.create!(user_id: barry.id, duration: 5, trip_name: "Holidays in Lisbon", description: "Lads tour in Lisbon", likes: 760)
puts "Trips created"

puts "Making shortlisted_activities..."
marcsactivity1 = ShortlistedActivity.create!(day: 1, trip_id: marcstrip1.id, activity_id: champ_mars.id)
marcsactivity2 = ShortlistedActivity.create!(day: 1, trip_id: marcstrip1.id, activity_id: puces.id)
marcsactivity3 = ShortlistedActivity.create!(day: 1, trip_id: marcstrip1.id, activity_id: atelier_brancusi.id)
marcsactivity4 = ShortlistedActivity.create!(day: 1, trip_id: marcstrip1.id, activity_id: jadin_tueleries.id)
marcsactivity5 = ShortlistedActivity.create!(day: 1, trip_id: marcstrip1.id, activity_id: canal_st_martin.id)
marcsactivity6 = ShortlistedActivity.create!(day: 1, trip_id: marcstrip1.id, activity_id: parc_monceau.id)
marcsactivity8 = ShortlistedActivity.create!(day: 1, trip_id: marcstrip1.id, activity_id: basilique_sacre_coeur.id)
janicesactivity1 = ShortlistedActivity.create!(day: 1, trip_id: janicestrip1.id, activity_id: champ_mars.id)
janicesactivity2 = ShortlistedActivity.create!(day: 1, trip_id: janicestrip1.id, activity_id: puces.id)
janicesactivity3 = ShortlistedActivity.create!(day: 1, trip_id: janicestrip1.id, activity_id: atelier_brancusi.id)
janicesactivity5 = ShortlistedActivity.create!(day: 1, trip_id: janicestrip1.id, activity_id: canal_st_martin.id)
janicesactivity6 = ShortlistedActivity.create!(day: 1, trip_id: janicestrip1.id, activity_id: parc_monceau.id)
janicesactivity7 = ShortlistedActivity.create!(day: 1, trip_id: janicestrip1.id, activity_id: belleville.id)
janicesactivity8 = ShortlistedActivity.create!(day: 1, trip_id: janicestrip1.id, activity_id: basilique_sacre_coeur.id)
lukesactivity1 = ShortlistedActivity.create!(day: 1, trip_id: lukestrip1.id, activity_id: gulbenkian.id)
lukesactivity2 = ShortlistedActivity.create!(day: 1, trip_id: lukestrip1.id, activity_id: feira_da_ladra.id)
lukesactivity3 = ShortlistedActivity.create!(day: 1, trip_id: lukestrip1.id, activity_id: jardim_real.id)
lukesactivity4 = ShortlistedActivity.create!(day: 1, trip_id: lukestrip1.id, activity_id: miradouro.id)
lukesactivity5 = ShortlistedActivity.create!(day: 1, trip_id: lukestrip1.id, activity_id: torre_de_belem.id)
barrysactivity1 = ShortlistedActivity.create!(day: 1, trip_id: barrystrip1.id, activity_id: castelo.id)
barrysactivity2 = ShortlistedActivity.create!(day: 1, trip_id: barrystrip1.id, activity_id: martim_moniz.id)
barrysactivity3 = ShortlistedActivity.create!(day: 1, trip_id: barrystrip1.id, activity_id: miradouro.id)
barrysactivity4 = ShortlistedActivity.create!(day: 1, trip_id: barrystrip1.id, activity_id: jardim_real.id)
barrysactivity5 = ShortlistedActivity.create!(day: 1, trip_id: barrystrip1.id, activity_id: feira_da_ladra.id)
barrysactivity6 = ShortlistedActivity.create!(day: 1, trip_id: barrystrip1.id, activity_id: gulbenkian.id)

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

ActivityCategory.create(activity_id: gulbenkian.id, category_id: art.id)
ActivityCategory.create(activity_id: feira_da_ladra.id, category_id: shopping.id)
ActivityCategory.create(activity_id: jardim_real.id, category_id: nature.id)
ActivityCategory.create(activity_id: miradouro.id, category_id: historic.id)
ActivityCategory.create(activity_id: torre_de_belem.id, category_id: historic.id)
ActivityCategory.create(activity_id: martim_moniz.id, category_id: food.id)
ActivityCategory.create(activity_id: castelo.id, category_id: historic.id)
puts "activity_category links created"

puts "Making reviews"
Review.create(activity_id: puces.id, user_id: marc.id, rating: 3)
Review.create(activity_id: basilique_sacre_coeur.id, user_id: marc.id, rating: 3)
Review.create(activity_id: champ_mars.id, user_id: janice.id, rating: 4)
Review.create(activity_id: marche_aligre.id, user_id: marc.id, rating: 2)
Review.create(activity_id: arrene_lutece.id, user_id: marc.id, rating: 1)
Review.create(activity_id: belleville.id, user_id: janice.id, rating: 5)
Review.create(activity_id: jadin_tueleries.id, user_id: marc.id, rating: 4)
Review.create(activity_id: parc_monceau.id, user_id: marc.id, rating: 3)
Review.create(activity_id: puces.id, user_id: marc.id, rating: 4)
Review.create(activity_id: basilique_sacre_coeur.id, user_id: janice.id, rating: 1)
Review.create(activity_id: champ_mars.id, user_id: marc.id, rating: 5)
Review.create(activity_id: marche_aligre.id, user_id: janice.id, rating: 1)
Review.create(activity_id: arrene_lutece.id, user_id: marc.id, rating: 4)
Review.create(activity_id: belleville.id, user_id: janice.id, rating: 2)
Review.create(activity_id: jadin_tueleries.id, user_id: marc.id, rating: 3)
Review.create(activity_id: parc_monceau.id, user_id: marc.id, rating: 1)

Review.create(activity_id: gulbenkian.id, user_id: luke.id, rating: 3 )
Review.create(activity_id: feira_da_ladra.id, user_id: barry.id, rating: 3 )
Review.create(activity_id: jardim_real.id, user_id: barry.id, rating: 3)
Review.create(activity_id: miradouro.id, user_id: barry.id, rating: 3)
Review.create(activity_id: torre_de_belem.id, user_id: barry.id, rating: 3)
Review.create(activity_id: martim_moniz.id, user_id: marc.id, rating: 3)
Review.create(activity_id: castelo.id, user_id: marc.id, rating: 3)

puts "reviews created"

puts "FINISHED!"
