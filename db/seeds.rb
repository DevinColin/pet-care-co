# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
c = Content.all
if c.empty?
  c = Content.new
  c.page = "Home"
  c.heading = "Walking for a cause"
  c.text = "We are a boutique-style dog walking and pet sitting company in Philadelphia that builds personal relationships with each client. We serve neighborhoods between Center City and West Philadelphia. Our professional pet sitters and dog walkers will provide your feline friends and canine kids with the care they deserve and the attention you expect. Philadelphia Pet Care’s management fully supports their staff and clients – Pet care with a personal touch. Care, compassion, and community guide Philadelphia Pet Care Company. We donate a portion of each service to a local animal rescue. When you choose Philadelphia Pet Care Company, you support local pets in need!"
  c.save
  c = Content.new
  c.page = "About"
  c.heading = "ABOUT PHILADELPHIA PET CARE CO, LLC."
  c.text = """
  Care, Compassion, and Community guide the practices of Philadelphia Pet Care Company. We are a boutique style dog walking and pet sitting company that serves Center City and West Philadelphia. Our professional pet sitters and dog caregivers will provide your feline friends and canine kids with the care they deserve – the attention you expect. Philadelphia Pet Care’s management fully supports their staff and clients – Pet care with a personal touch.
  When you choose Philadelphia Pet Care Company – you support local pets in need. We donate a portion of each service to a local animal rescue.
  """
  c.save
  c = Content.new
  c.page = "Services"
  c.heading = "Medication Fee"
  c.text = """
  These fees compensate pet sitters for the additional responsibility of medicating your pet(s):
  Pilling fee - $3 per visit, per pet
  Injections - $10 per visit, per pet
  Eye Drops - $3 per visit, per pet
  """
  c.save
  c = Content.new
  c.page = "Contact"
  c.heading = "Office Hours"
  c.text = """
  Monday-Friday
  9am - 6pm
  Email: info@phillypetcareco.com
  Phone: 267-289-1564
  """
  c.save
  c = Content.new
  c.page = "Services"
  c.heading = "Holidays"
  c.text = """
  Regular walks are NOT Auto-scheduled on the following holidays:
  New Years Eve
  New Years Day
  Labor Day
  July 4th
  Memorial Day
  Thanksgiving
  Christmas Eve
  Christmas Day
  Holiday Fees
  The fees compensate both pet sitters & management for working on major holidays.
  Dog Walks and Cat Sitting - $10 per Visit
  Overnights - $20 per night
  """
  c.save
end

t = Testimonial.all
if t.empty?
  15.times do
    t = Testimonial.new
    t.cust_name = Faker::Superhero.name
    t.cust_desc = Faker::Lorem.sentence
    t.stars = rand(1..5)
    t.content = Faker::Lorem.paragraph(4)
    num = rand(1..4)
    if num % 3 == 0
      t.visible = false
    else
      t.visible = true
    end
    t.save
  end
end

w = Walker.all
if w.empty?
  w = Walker.new
  w.fname = "Sarah"
  w.lname = "Zimmer"
  w.bio = """
  Sarah's vision for Philadelphia Pet Care combines professional client relationships, community involvement, and personalized care for each pet. This vision was shaped during her two and a half years as a dog Caregiver with the original Philapets. With up to 14 walks a day, in rain, snow, and blazing heat - Sarah never missed a visit. The experience taught her what the pets needed – a reliable person that is just as dedicated as their owner. She founded Philadelphia Pet Care Company in 2012.
  As an only child, Sarah’s siblings included a German Shepard named Schnapps and her two rabbits, Oreo and Brownie. Her deep connection with animals grew when she rescued two Pit Bull type dogs - Ladybug and Seven.
  Sarah has volunteered at the Animal Care and Control Shelter (ACCT) and the PSPCA. As a volunteer, she learned a great deal about dog handling from the resident animal behaviorists. She applies this knowledge to help her clients dogs overcome fears, anxieties, and other on-leash issues.
  In addition to her love of animals, she earned her MFA in 2008 from The University of Pennsylvania. She creates digital, interactive installations with collaborate partner Kim Brickley and other programmers and makers at The Hacktory and Department of Making and Doing (DMD).
  """
  w.active = true
  w.save
  5.times do
    w = Walker.new
    w.fname = "Arianna"
    w.bio = """
    Arianna is occasionally a poet and sometimes an artist, but always an animal lover.
    She spends her free time taking long bike rides, hiking in the woods and curled up in a cozy nook with a book and her massive grey tabby, Pigeon. She grew up in a farm town, in the Philadelphia suburbs, surrounded by peach orchards and corn fields and was often spotted walking the lines of fruit trees with an English Mastiff named Tinkerbell, tennis balls and a knotty walking stick. She has been living and walking dogs in Philadelphia for five years.
    She spent a summer working in a lost-cost vaccine clinic for cats and dogs and is also well versed in the various methods for tricking stubborn pups into taking their pills. She has fostered dogs ranging is size from a Pekingese to a large pit bull and recently began finding homes for the litter of kittens inhabiting her back alleyway and the abandoned house next door. She's excited to meet and spend her days with your furry friends and hopes that you are too!
    """
    w.active = true
    w.save
  end
  w2 = Walker.new
  w2.fname = "Inactive Walker"
  w2.lname = "Test"
  w2.bio = """
  This walker should NOT show up on when you visit '/about'.
  This walker should show as inactive on the admin menu but we should be able to activate them and see the change reflected on walkers index.
  This is just a test user and can be deleted at any time
  """
  w2.active = false
  w2.save
end

s = Service.all
if s.empty?
    s = Service.new
    s.name = "Regular Walks"
    s.highlights = """
    30-Minute Visit $16
    60-Minute Visit $30
    Auto-Scheduled
    3-5 days per week
    $4/ Additional dog per household
    """
    s.description = """
    Philadelphia Pet Care Company prefers to nurture long term, personal relationships with our clients. Each dog is walked with focus and care – no cell phones, headphones, or pack walks. You will come home to note outlining the day’s events! Your sitter will have the full support of management at all times.
    Scheduled in 2 hours time slots, i.e. 12-2pm, 2-4pm
    Priority booking & NO additional fees for morning, night or weekend walks
    Requires 3 Walks a week
    Work from home? No problem - we area happy to walk your pooch so you can work
    Walks will not be auto-scheduled for major holidays
    """
    s.save
    s2 = Service.new
    s2.name = "Occasional Walks"
    s2.highlights = """
    30-Minute Visit $18
    60-Minute Visit $34
    $4/ Additional dog per household
    """
    s2.description = """
    Philadelphia Pet Care Company is one of the few professional pet care services that provide non-regular clients with pet care and dog walks. Because the majority of our services take place weekdays between 10am-6pm, our pet sitters share morning, night and weekend services. It is important to PPCC that the pet sitters have time to relax and be rested to properly care for your furry friends! Your sitter will have the full support of Philadelphia Pet Care Company management at all times.
    New Clients – Please allow 5-7days before services begin. This provides time to come meet you & your pet.
    3 Walks a day are required for dogs when owner is out of town – if you are not scheduling an overnight
    Your sitter will leave a note each day to provide an update
    We are happy to text our clients - if you need a bit of piece of mind while out of town.
    We are happy to take your dog or cat to the vet under emergency circumstances. Transportation and hourly fees apply.
    """
    s2.save
    s3 = Service.new
    s3.name = "Overnight Pet Care"
    s3.highlights = """
    Regulars $75/Night
    Non-regulars $80/Night
    8pm to 8am
    $10/Additional dog per household
    $4/Additional cat per household
    """
    s3.description = """
    All the comforts of home. No Kennel and lots of love! This service is designed to replace the need for a kennel or boarding. Your furry family member(s) will receive hours of attention in the comfort of their own home.
    The Visit includes a 20-minute dinner walk, bedtime potty break, and 20-minute morning walk.
    A mid-day walk is typically added to supplement this service.
    Your sitter will have the full support of Philadelphia Pet Care Company management at all times – day and night!
    We are happy to take your dog or cat to the vet under emergency circumstances. Transportation and hourly fees apply.
    """
    s3.save
    s4 = Service.new
    s4.name = "Cat Sitting"
    s4.highlights = """
    30-Minute Visit    $18
    60-Minute Visit    $30
    2 Cats/household included in fee
    $4/Additional cat
    """
    s4.description = """
    Feline friends need love too! Philadelphia Pet Care Company’s professional pet sitters will supply your cat with a daily dose of attention. Daily feeding, watering, litter scooping, and TLC will be provided during each Visit. Your sitter will write a note each day describing each Visit. Philadelphia Pet Care Company provides 24/7 management support to all sitters.
    In order to properly serve our occasional clients and their furry family members, PPCC needs the following: 
    5 -7 days notice before the first service. This allows time to schedule the free meet and greet.
    1 Visit per day is required when cat owners are out of town. We do not skip days – no exceptions.
    Your sitter will leave a note each day to provide an update
    We are happy to text our clients when they are out of town and need a little piece of mind.
    We are happy to take your dog or cat to the vet under emergency circumstances. Transportation and hourly fees apply.
    """
    s4.save
end

u = User.all
if u.empty?
  u = User.new
  u.email = "devin@email.com"
  u.password = "password"
  u.admin = true
  u.save!
end
