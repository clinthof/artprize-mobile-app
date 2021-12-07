//
//  VenuModel.swift
//  MapPrototype
//
//  Created by Trevor C. Sweet on 11/30/21.
//

import Foundation
import CoreLocation
import UIKit


/**
 This class simulates the filling of data structures which would typically be handled by some type of cloud storage integration, such as Firebase.
*/
class VenueModel {
    fileprivate var venues : [Venue] = [Venue]()
    
    init() { createVenues() }
    
    func getVenues() -> [Venue] { return self.venues }
    
    // TODO: Maybe add a getVenueByName() function to help facilitate transferring from drawer view to ArtworkListView?
    
    fileprivate func createVenues() {
        venues.append(Venue(
            name: "Bitter End Coffee House",
            image: UIImage(named: "bitterEnd"),
            address: "752 Fulton St W, Grand Rapids, MI 49504",
            location: CLLocationCoordinate2D(latitude: 42.963360, longitude: -85687172),
            artworks: [
                Artwork(
                    title: "Grand Rapids # 1 & 2",
                    image: UIImage(named: "bitterEnd_1"),
                    artist: "Douglas Coon",
                    description: "Sometimes images require a great deal of planning and preparation, other times images fall into your lap. Grand Rapids # 1 &2 was an image that fell into my lap.",
                    medium: "Photography",
                    width: "24 in",
                    height: "18.5 in"
                ),
                Artwork(
                    title: "Together/Seperate; Beauty in a Pandemic",
                    image: UIImage(named: "bitterEnd_2"),
                    artist: "Deboarah Simms",
                    description: "This work is a 6ft by 3ft dyptch. Acrylic.The composition works individually or together, thus the name. I felt so strong about creating something beautiful in the worst of the pandemic and the statement 'Together-Seperately' used to describe the effort of working together while in the isolation of a lock down resonated in my thoughts as a composition. Finding beauty and using so much time alone to be productive was the prompt to keep me working. I viewed this time as a precious gift from God and wanted to use it wisely.",
                    medium: "Acrylics",
                    width: "6 ft",
                    height: "3 ft"
                ),
                Artwork(
                    title: "No Turnaround",
                    image: UIImage(named: "bitterEnd_3"),
                    artist: "Lorenzo Cristaudo",
                    description: nil,
                    medium: "Cement, Acrylic",
                    width: "18.75 in",
                    height: "24.75 in"
                ),
                Artwork(
                    title: "Joy and Serenity",
                    image: UIImage(named: "bitterEnd_4"),
                    artist: "Annette Radden",
                    description: nil,
                    medium: nil,
                    width: nil,
                    height: nil
                )
            ]
        ))
        venues.append(Venue(
            name: "Grand Rapids Public Museum",
            image: UIImage(named: "grpm"),
            address: "272 Pearl St NW, Grand Rapids, MI 49504",
            location: CLLocationCoordinate2D(latitude: 42.966129, longitude: -85.676666),
            artworks: [
                Artwork(
                    title: "Nomadic Domiciles",
                    image: UIImage(named: "grpm_1"),
                    artist: "Ted Lott",
                    description: "America is one of the most mobile countries in the world. The average American moves more than 11 times in their life, more than 10% of Americans move every year. We are a country constantly moving, constantly renewing. Nomadic Domiciles is a grouping of three sculptures that each depict a house frame atop a set of four long curved legs. Each set of legs is unique, giving them individual character, while retaining their identity as a group, or herd, of homes. The legs are constructed of ductile cast iron, and are based on the design of a table, with legs and aprons, reflecting the history of furniture-making in Grand Rapids. The house frames are cast brass, and have a rich green patina, which will continue to mature as the sculptures weather. This work celebrates the vitality of America, as well as the history of the Grand Rapids area, and its energy as a growing cultural and economic center of both Michigan and the Midwest.",
                    medium: "Cast Iron, Bronze",
                    width: "22 in",
                    height: "108 in"
                ),
                Artwork(
                    title: "Adolescent Echo",
                    image: UIImage(named: "grpm_2"),
                    artist: "Craig Merchant",
                    description: "“Adolescent Echo” is an interactive installation of birdhouses that will repeat short phrases that are spoken into them. The birdhouses symbolize a place to raise a family and they’re painted in vibrant colors to represent youthfulness. This artwork is inspired by the impact adult’s words have on youth. Children are like sponges, always listening and repeating what they see and hear. The artist hopes that this artwork inspires adults to be mindful of their words and the influence they have on children.",
                    medium: "Wood, Electronics",
                    width: "30 ft",
                    height: "7 ft"
                ),
                Artwork(
                    title: "Terminal",
                    image: UIImage(named: "grpm_3"),
                    artist: "Burnett Kyle",
                    description: "“Terminal,” my ArtPrize entry, represents illness at the point it takes life. This human sculpture is built from a single material, a low poly form, giving the essence of simplicity in its presence. In a weak, lifeless manner, the human form is falling backward representing the moment life is stolen. Its simple form illustrates how fragile life can be. The lion ripping out of the torso represents terminal illness. It is built in the scrap metal medium to provide a more ugly form in which terminal illness presents itself. In taking this life, it continues to attack the lives of the loved ones in their grief. Although graphic in its nature, I found solitude in this sculpture, as if I almost could fight back at the memories that haunt me by exposing its ugliness to the world.",
                    medium: "Metal/Recycled Metal",
                    width: "36 in",
                    height: "115 in"
                ),
                Artwork(
                    title: "Red Glasses",
                    image: UIImage(named: "grpm_4"),
                    artist: "Sam Noordhoff",
                    description: "This sculpture is a result of the inspiration left by a 5-year-old girl from GR, who passed away in 2018. Her passing started the living legacy of The Red Glasses Movement to draw attention to the uniqueness of children born with special needs. Audrey was born with Down syndrome and a congenital heart defect, but these were not things that defined her. Audrey was defined by her bright Red Glasses, and was a shining example of love, kindness, and courage in this world. I wanted to find a way to have children learn more about this legacy thru an interactive sculpture. This sculpture is for children to read, learn and see the uniqueness of themselves thru the symbolism of the Red Glasses. The mission of the Red Glasses movement is to put a pair of Red Glasses on every face in the world so that everyone can see through Audrey’s eyes. Simply put… it is to inspire the world to live boldly, love big, and pass it on.",
                    medium: "Sculpture, Stainless, Interactive",
                    width: "94.5 in",
                    height: "41 in"
                )
            ]
        ))
        venues.append(Venue(
            name: "Canopy by Hilton Grand Rapids",
            image: UIImage(named: "canopy"),
            address: "131 Ionia Ave SW, Grand Rapids, MI 49503",
            location: CLLocationCoordinate2D(latitude: 42.960049, longitude: -85.670410),
            artworks: [
                Artwork(
                    title: "Morning Spacewalk",
                    image: UIImage(named: "canopy_1"),
                    artist: "Hua Benjamin, Joshua Davies",
                    description: "“Hello, my name is FR-3D. Though you may not remember our encounter, i assure you, it happened. My dogs are friendly, and my planet is beautiful, come take a walk with us.” This triptych is hand-carved from 3 solid blocks of high-density polystyrene with additional sculpting mediums, then finished with acrylic paints, pearlescent and metallic powders, and UV reactive pigments. Strong magnets installed in the feet secure to a metal base plate to insure stability. Aside from the laser-wire leashes, the custom glass eyes & acrylic spheres, everything is sculpted by hand (No machines, molds or prints). Best to be viewed as a walk around diorama. Also to be included is an 8ft x 10ft removable mural portraying scenery as seen from FR-3D’s home planet. Alien- FR-3D Corgi- Murphy Pomeranian- Lana",
                    medium: "Mixed",
                    width: "10 ft",
                    height: "10 ft"
                ),
                Artwork(
                    title: "American Tech Dream",
                    image: UIImage(named: "canopy_2"),
                    artist: "Erik Jensen",
                    description: "People here in the USA want to live what we often call the American Dream. Today we get overstimulated with technology, but look at how far we've come in such few decades, not to mention the almost incomprehensible advancement since the 1800s. With 9,450 recycled computer keys, some of which are dyed for colors, these pixelated images are put together of people, places, icons, etc that we all connect with and can be reminded that any dream is possible, especially with today's technology. We are now living the American Tech Dream.",
                    medium: "Recycled Computer Keys",
                    width: "6.25 ft",
                    height: "5.3 ft"
                ),
                Artwork(
                    title: "North American Woodland Animals",
                    image: UIImage(named: "canopy_3"),
                    artist: "Dorothy Dorney",
                    description: "King Size Quilt using paper piecing technique. All quilt square panels were designed through drafting a geometric drawing (refer to possum illustration) followed by transferring into fabric. Each geometric piece was cut and sewn individually to create the total quilt block illustration.",
                    medium: "Fiber/Textiles",
                    width: "118 in",
                    height: "120 in"
                ),
                Artwork(
                    title: "Your Beethoven Musical Interaction",
                    image: UIImage(named: "canopy_4"),
                    artist: "Jeffrey Breslow",
                    description: "My Submission for AP21 is my 48”x48” inch oil painting of Ludwig Van Beethoven. Behind the painting in a 2-inch narrow space is a hidden bow that contains a speaker, a patented complex circuit and a 12-volt battery. There is no cord coming from behind the painting to tip off the viewer standing in front of Beethoven. There are two radar motion sensors. When the viewer standing in front of Ludwig waves their hand swiftly form right to left the viewer activates first the left sensor and then the right. Immediately from the painting comes Beethoven’s Fifth Symphony. The volume of the symphony begins loud at a level of 7. The volume is controlled by the viewer in front of the painting. If you rise your hand up on the right side, you can incrementally raise the volume. First to 8 and another raise of the hand to 9 and the blasting the symphony to 10 level. If you lower your hand on the left side of the painting, you lower the volume. YOU ARE IN TOTAL CONTROL. Another mode of the painting is to activate Beethoven’s voice talking to you in English with a German Accent.He begins is with, “I was enthusiastic about the French Revolution and shared its ideals of Freedom.\" Beethoven talks to you for several minutes and the painting becomes educational as well.",
                    medium: "Mixed Media",
                    width: "4 ft",
                    height: "4 ft"
                )
            ]
        ))
        venues.append(Venue(
            name: "Brush Studio",
            image: UIImage(named: "brush"),
            address: "11 Ionia Ave NW, Grand Rapids, MI 49503",
            location: CLLocationCoordinate2D(latitude: 42.963700, longitude: -85.670250),
            artworks: [
                Artwork(
                    title: "Through the Storm Shines the Light",
                    image: UIImage(named: "brush_1"),
                    artist: "Colin Mead",
                    description: "Here is my larger painting. Finally done. Actually, there are still a couple of tweaks I would like to do to it, but for the most part, it is done. The photos are a bit dark because I didn't have enough room in my studio to light it without getting reflections off of the paint. This painting has quite a bit of significance to me. I have been facing a few storms in my life in the past couple of years. I lost my job at the start of the pandemic. Recently, I faced a literal storm. On August 12 a tornado or possibly straight line winds knocked at least 12 very large trees down around my house. Three trees, each at least 2.5 foot in diameter fell on my house. Another fell on my garage and yet another two fell on my privacy fence. My faith is God has helped me through this period of trials. I know that eventually light will prevail just as God's faithfulness always prevails.",
                    medium: "Oil Paint",
                    width: "8 ft",
                    height: "6 ft"
                ),
                Artwork(
                    title: "Wild Utah",
                    image: UIImage(named: "brush_2"),
                    artist: "Andrew Sliwinski",
                    description: "\"Wild Utah\" is an actual vision of Utah since my visit in October of 2019. The knowledge that I acquired enhanced the true beauty of the landscape, including several National Parks ,the environment and animals. After returning home I continued to research to be extremely accurate. The art piece is done by gluing felt and yarn on a canvas. The brilliant colors, just standing a few feet away, looks like a painting. I have been working with this media for some time now. \"Wild Utah\" is one of God's treasure.",
                    medium: "Felt & Yarn",
                    width: "5 ft",
                    height: "4 ft"
                ),
                Artwork(
                    title: "Turning to Nature",
                    image: UIImage(named: "brush_3"),
                    artist: "Ann Dyer",
                    description: "In a year of uncertainty and turmoil, there was a craving for something peaceful, beautiful and constant. For me this was found in nature. Each drawing represents a month of our summer. The Dames Rocket in early June, the Wild Columbine in July and The Monarchs are in August. This set of three pen & ink drawings was done in the traditional method using a crow quill metal tip dip pen and colored inks. The inks are most often mixed when applied, sometimes diluted and occasionally used straight from the bottle. Each drawing is 16\" x 20\" and they are individually matted and framed. Framed size is to be 25\" x 29.5\". If space is limited one can be displayed instead of all three.",
                    medium: "Pen and Ink",
                    width: "29.5 in",
                    height: "25 in"
                ),
                Artwork(
                    title: "Paper Quilt: One Hundred Four-Patch Blocks",
                    image: UIImage(named: "brush_4"),
                    artist: "Steven Wipfli",
                    description: "\"Paper Quilt\" is a modern interpretation of a traditional Four Patch Block quilt pattern, replacing fabric with paper. Individual 3\" squares are assembled from decorative papers chosen from a vivid color scheme. The squares are then quartered and rearranged creating a vibrant pattern. Colored art papers, patterned papers and reflective papers from around the world create an active, vibrant surface.",
                    medium: "Paper Collage",
                    width: "39 in",
                    height: "39 in"
                )
            ]
        ))
    }
}
