# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(email: "admin@example.com",
                    password: "password",
                    firstname: "Admin",
                    lastname: "User",
                    admin: true)

alice = User.create(email: "alice@example.com",
                    password: "password",
                    firstname: "Alice",
                    lastname: "Wonderland")

bob = User.create(email: "bob@example.com",
                    password: "password",
                    firstname: "Bob",
                    lastname: "Robertson")

charlie = User.create(email: "charlie@example.com",
                    password: "password",
                    firstname: "Charlie",
                    lastname: "Champ")

dan = User.create(email: "dan@example.com",
                    password: "password",
                    firstname: "Dan",
                    lastname: "Dare")

eric = User.create(email: "eric@example.com",
                    password: "password",
                    firstname: "Eric",
                    lastname: "Elbow")

comics = Category.create(name: "Comic Books")

batman = Product.create(category: comics,
                        user: alice,
                        title: "Batman: The Dark Knight",
                        price: 6.50,
                        description: "Batman is an ongoing comic book series featuring the DC Comics hero of the same name. The character first appeared in Detective Comics #27 (cover dated May 1939). Batman proved to be so popular that a self-titled ongoing comic book series began publication in the spring of 1940. It was first advertised in early April 1940, one month after the first appearance of his new sidekick, Robin, the Boy Wonder.")

superman = Product.create(category: comics,
                          user: alice,
                          title: "Adventures of Superman",
                          price: 7.00,
                          description: "Superman is an ongoing comic book series featuring the DC Comics hero of the same name. The character Superman began as one of several anthology features in the National Periodical Publications comic book Action Comics #1 in June 1938. The strip proved so popular that National launched Superman into his own self-titled comic book, the first for any superhero, premiering with cover date June 1939. Between 1986 and 2006 it was retitled The Adventures of Superman while a new series used the title Superman. In May 2006, it was returned to its original title and numbering. The title was canceled with issue #714 (October 2011) and relaunched with a new #1 the following month.")

spiderman = Product.create(category: comics,
                          user: bob,
                          title: "The Amazing Spider-Man",
                          price: 5.00,
                          description: "The Amazing Spider-Man (abbreviated as ASM) is an American comic book series published by Marvel Comics, featuring the adventures of the fictional superhero Spider-Man. Being the mainstream continuity of the franchise, it began publication in 1963 as a monthly periodical and was published continuously, with a brief interruption in 1995, until its relaunch with a new numbering order in 1999. In 2003 the series reverted to the numbering order of the first volume. The title has occasionally been published biweekly, and was published three times a month from 2008 to 2010. A film named after the comic was released July 3, 2012.")

ironman = Product.create(category: comics,
                          user: eric,
                          title: "The Invincible Iron Man",
                          price: 8.50,
                          description: "Iron Man (Tony Stark) is a fictional superhero that appears in American comic books published by Marvel Comics, as well as its associated media. The character was created by writer-editor Stan Lee, developed by scripter Larry Lieber, and designed by artists Don Heck and Jack Kirby. He made his first appearance in Tales of Suspense #39 (cover dated March 1963).")

hulk = Product.create(category: comics,
                      user: bob,
                      title: "The Incredible Hulk",
                      price: 6.60,
                      description: "The Incredible Hulk is an ongoing comic book series featuring the Marvel Comics superhero the Hulk and his alter ego Dr. Bruce Banner. First published in May 1962, the series ran for six issues before it was cancelled in March 1963, and the Hulk character began appearing in Tales to Astonish. With issue #102, Tales to Astonish was renamed to The Incredible Hulk in April 1968, becoming its second volume. The series continued to run until issue #474 in March 1999 when it was replaced with the series Hulk which ran until February 2000 and was retitled to The Incredible Hulk '​s third volume, running until March 2007 when it became The Incredible Hercules with a new title character.")

Review.create(product: batman, user: dan,
              content: "Awesome comic book! So much action!", rating: 5)

Review.create(product: superman, user: dan,
              content: "I don't like superman. It's so cartooney!", rating: 1)

Review.create(product: batman, user: bob,
              content: "Dark, mature story, I loved it", rating: 5)

Review.create(product: hulk, user: alice,
              content: "Hulk smash!", rating: 4)

Review.create(product: spiderman, user: eric,
              content: "This was so funny! I wish I was like spider-man!", rating: 4)

Review.create(product: spiderman, user: alice,
              content: "I did not like the humor. This is more for my younger brother.", rating: 2)

Review.create(product: superman, user: eric,
              content: "Fantastic action!", rating: 4)
