# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.create!(
  username: 'pudge',
  email: 'pudge@gmail.com',
  password: 'password'
)
User.create!(
  username: 'axe',
  email: 'axe@gmail.com',
  password: 'password'
)
User.create!(
  username: 'kunkka',
  email: 'kunkka@gmail.com',
  password: 'password'
)
User.create!(
  username: 'tidehunter',
  email: 'tidehunter@gmail.com',
  password: 'password'
)

users = User.all
user_ids = []
users.each do |user|
  user_ids << user.id
end

timings = ["Starting", "Early", "Mid", "Late"]

response = HTTP.get("https://api.steampowered.com/IEconDOTA2_570/GetHeroes/v0001/?key=#{Rails.application.credentials.api_key}").parse(:json)["result"]["heroes"]

heroes = []
response.each do |hero|
  heroes << hero
end

heroes.each do |hero|
  hero["name"] = hero["name"].sub('npc_dota_hero_', '')
  hero["url"] = "http://cdn.dota2.com/apps/dota2/images/heroes/#{hero['name']}_sb.png"
end

5.times do
  hero = heroes.sample
  Build.create!(
    user_id: user_ids.sample,
    timing: timings.sample,
    hero_name: hero["name"],
    hero_url: hero["url"]
  )
end

builds = Build.all

# response2 = HTTP.get("https://api.steampowered.com/IEconDOTA2_570/GetGameItems/V001/?key=#{Rails.application.credentials.api_key}&language=LANGCODE").parse(:json)["result"]["items"]
response2 = {
  "items": [
    {
      "id": 1,
      "name": "blink"
    },
    {
      "id": 2,
      "name": "blades_of_attack"
    },
    {
      "id": 3,
      "name": "broadsword"
    },
    {
      "id": 4,
      "name": "chainmail"
    },
    {
      "id": 5,
      "name": "claymore"
    },
    {
      "id": 6,
      "name": "helm_of_iron_will"
    },
    {
      "id": 7,
      "name": "javelin"
    },
    {
      "id": 8,
      "name": "mithril_hammer"
    },
    {
      "id": 9,
      "name": "platemail"
    },
    {
      "id": 10,
      "name": "quarterstaff"
    },
    {
      "id": 11,
      "name": "quelling_blade"
    },
    {
      "id": 12,
      "name": "ring_of_protection"
    },
    {
      "id": 182,
      "name": "stout_shield"
    },
    {
      "id": 13,
      "name": "gauntlets"
    },
    {
      "id": 14,
      "name": "slippers"
    },
    {
      "id": 15,
      "name": "mantle"
    },
    {
      "id": 16,
      "name": "branches"
    },
    {
      "id": 17,
      "name": "belt_of_strength"
    },
    {
      "id": 18,
      "name": "boots_of_elves"
    },
    {
      "id": 19,
      "name": "robe"
    },
    {
      "id": 20,
      "name": "circlet"
    },
    {
      "id": 21,
      "name": "ogre_axe"
    },
    {
      "id": 22,
      "name": "blade_of_alacrity"
    },
    {
      "id": 23,
      "name": "staff_of_wizardry"
    },
    {
      "id": 24,
      "name": "ultimate_orb"
    },
    {
      "id": 25,
      "name": "gloves"
    },
    {
      "id": 26,
      "name": "lifesteal"
    },
    {
      "id": 27,
      "name": "ring_of_regen"
    },
    {
      "id": 28,
      "name": "sobi_mask"
    },
    {
      "id": 29,
      "name": "boots"
    },
    {
      "id": 30,
      "name": "gem"
    },
    {
      "id": 31,
      "name": "cloak"
    },
    {
      "id": 32,
      "name": "talisman_of_evasion"
    },
    {
      "id": 33,
      "name": "cheese"
    },
    {
      "id": 34,
      "name": "magic_stick"
    },
    {
      "id": 36,
      "name": "magic_wand"
    },
    {
      "id": 37,
      "name": "ghost"
    },
    {
      "id": 38,
      "name": "clarity"
    },
    {
      "id": 39,
      "name": "flask"
    },
    {
      "id": 40,
      "name": "dust"
    },
    {
      "id": 41,
      "name": "bottle"
    },
    {
      "id": 42,
      "name": "ward_observer"
    },
    {
      "id": 43,
      "name": "ward_sentry"
    },
    {
      "id": 44,
      "name": "tango"
    },
    {
      "id": 45,
      "name": "courier"
    },
    {
      "id": 46,
      "name": "tpscroll"
    },
    {
      "id": 48,
      "name": "travel_boots"
    },
    {
      "id": 50,
      "name": "phase_boots"
    },
    {
      "id": 51,
      "name": "demon_edge"
    },
    {
      "id": 52,
      "name": "eagle"
    },
    {
      "id": 53,
      "name": "reaver"
    },
    {
      "id": 54,
      "name": "relic"
    },
    {
      "id": 55,
      "name": "hyperstone"
    },
    {
      "id": 56,
      "name": "ring_of_health"
    },
    {
      "id": 57,
      "name": "void_stone"
    },
    {
      "id": 58,
      "name": "mystic_staff"
    },
    {
      "id": 59,
      "name": "energy_booster"
    },
    {
      "id": 60,
      "name": "point_booster"
    },
    {
      "id": 61,
      "name": "vitality_booster"
    },
    {
      "id": 63,
      "name": "power_treads"
    },
    {
      "id": 65,
      "name": "hand_of_midas"
    },
    {
      "id": 67,
      "name": "oblivion_staff"
    },
    {
      "id": 69,
      "name": "pers"
    },
    {
      "id": 71,
      "name": "poor_mans_shield"
    },
    {
      "id": 73,
      "name": "bracer"
    },
    {
      "id": 75,
      "name": "wraith_band"
    },
    {
      "id": 77,
      "name": "null_talisman"
    },
    {
      "id": 79,
      "name": "mekansm"
    },
    {
      "id": 81,
      "name": "vladmir"
    },
    {
      "id": 84,
      "name": "flying_courier"
    },
    {
      "id": 86,
      "name": "buckler"
    },
    {
      "id": 88,
      "name": "ring_of_basilius"
    },
    {
      "id": 90,
      "name": "pipe"
    },
    {
      "id": 92,
      "name": "urn_of_shadows"
    },
    {
      "id": 94,
      "name": "headdress"
    },
    {
      "id": 96,
      "name": "sheepstick"
    },
    {
      "id": 98,
      "name": "orchid"
    },
    {
      "id": 100,
      "name": "cyclone"
      },
    {
      "id": 102,
      "name": "force_staff"
              },
    {
      "id": 104,
      "name": "dagon"
    },
    {
      "id": 201,
      "name": "dagon_2"
    },
    {
      "id": 202,
      "name": "dagon_3"
    },
    {
      "id": 203,
      "name": "dagon_4"
    },
    {
      "id": 204,
      "name": "dagon_5"
          },
    {
      "id": 106,
      "name": "necronomicon"
    },
    {
      "id": 193,
      "name": "necronomicon_2"
    },
    {
      "id": 194,
      "name": "necronomicon_3"
      },
    {
      "id": 108,
      "name": "ultimate_scepter"
      },
    {
      "id": 110,
      "name": "refresher"
      },
    {
      "id": 112,
      "name": "assault"
      },
    {
      "id": 114,
      "name": "heart"
      },
    {
      "id": 116,
      "name": "black_king_bar"
    },
    {
      "id": 117,
      "name": "aegis"
      },
    {
      "id": 119,
      "name": "shivas_guard"
      },
    {
      "id": 121,
      "name": "bloodstone"
      },
    {
      "id": 123,
      "name": "sphere"
      },
    {
      "id": 125,
      "name": "vanguard"
      },
    {
      "id": 127,
      "name": "blade_mail"
      },
    {
      "id": 129,
      "name": "soul_booster"
      },
    {
      "id": 131,
      "name": "hood_of_defiance"
      },
    {
      "id": 133,
      "name": "rapier"
      },
    {
      "id": 135,
      "name": "monkey_king_bar"
      },
    {
      "id": 137,
      "name": "radiance"
      },
    {
      "id": 139,
      "name": "butterfly"
      },
    {
      "id": 141,
      "name": "greater_crit"
      },
    {
      "id": 143,
      "name": "basher"
      },
    {
      "id": 145,
      "name": "bfury"
      },
    {
      "id": 147,
      "name": "manta"
      },
    {
      "id": 149,
      "name": "lesser_crit"
      },
    {
      "id": 151,
      "name": "armlet"
      },
    {
      "id": 152,
      "name": "invis_sword"
      },
    {
      "id": 154,
      "name": "sange_and_yasha"
      },
    {
      "id": 156,
      "name": "satanic"
      },
    {
      "id": 158,
      "name": "mjollnir"
      },
    {
      "id": 160,
      "name": "skadi"
      },
    {
      "id": 162,
      "name": "sange"
      },
    {
      "id": 164,
      "name": "helm_of_the_dominator"
      },
    {
      "id": 166,
      "name": "maelstrom"
      },
    {
      "id": 168,
      "name": "desolator"
      },
    {
      "id": 170,
      "name": "yasha"
      },
    {
      "id": 172,
      "name": "mask_of_madness"
        },
    {
      "id": 174,
      "name": "diffusal_blade"
    },
    {
      "id": 196,
      "name": "diffusal_blade_2"
      },
    {
      "id": 176,
      "name": "ethereal_blade"
      },
    {
      "id": 178,
      "name": "soul_ring"
      },
    {
      "id": 180,
      "name": "arcane_boots"
    },
    {
      "id": 181,
      "name": "orb_of_venom"
      },
    {
      "id": 185,
      "name": "ancient_janggo"
      },
    {
      "id": 187,
      "name": "medallion_of_courage"
    },
    {
      "id": 188,
      "name": "smoke_of_deceit"
      },
    {
      "id": 190,
      "name": "veil_of_discord"
      },
    {
      "id": 206,
      "name": "rod_of_atos"
      },
    {
      "id": 208,
      "name": "abyssal_blade"
      },
    {
      "id": 210,
      "name": "heavens_halberd"
      },
    {
      "id": 212,
      "name": "ring_of_aquila"
      },
    {
      "id": 214,
      "name": "tranquil_boots"
    },
    {
      "id": 215,
      "name": "shadow_amulet"
    },
    {
      "id": 216,
      "name": "enchanted_mango"
    },
    {
      "id": 218,
      "name": "ward_dispenser"
    },
    {
      "id": 220,
      "name": "travel_boots_2"
    },
    {
      "id": 226,
      "name": "lotus_orb"
    },
    {
      "id": 229,
      "name": "solar_crest"
    },
    {
      "id": 231,
      "name": "guardian_greaves"
    },
    {
      "id": 235,
      "name": "octarine_core"
    },
    {
      "id": 247,
      "name": "moon_shard"
    },
    {
      "id": 249,
      "name": "silver_edge"
    },
    {
      "id": 254,
      "name": "glimmer_cape"
    },
    {
      "id": 242,
      "name": "crimson_guard"
      },
    {
      "id": 239,
      "name": "iron_talon"
      },
    {
      "id": 232,
      "name": "aether_lens"
      },
    {
      "id": 236,
      "name": "dragon_lance"
    },
    {
      "id": 237,
      "name": "faerie_fire"
    },
    {
      "id": 244,
      "name": "wind_lace"
      },
    {
      "id": 250,
      "name": "bloodthorn"
      },
    {
      "id": 252,
      "name": "echo_sabre"
    },
    {
      "id": 257,
      "name": "tome_of_knowledge"
      },
    {
      "id": 263,
      "name": "hurricane_pike"
    },
    {
      "id": 240,
      "name": "blight_stone"
    },
    {
      "id": 265,
      "name": "infused_raindrop"
    }
  ]
}

response_items = []
# response2.each do |item|
#   if item["recipe"] == 0
#     response_items << item
#   end
# end
response2[:items].each do |item|
  response_items << { "name" => item[:name] }
end

response_items.each do |item|
  item["name"] = item["name"].sub('item_', '')
  item["url"] = "http://cdn.dota2.com/apps/dota2/images/items/#{item['name']}_lg.png"
end

builds.each do |build|
  4.times do
    item = response_items.sample
    Item.create!(
      item_name: item["name"],
      build_id: build.id,
      url: item["url"]
    )
  end
end

builds = Build.all
build_ids = []
builds.each do |build|
  build_ids << build.id
end

5.times do
  Post.create!(
  user_id: user_ids.sample,
  title: Faker::Lorem.sentence(word_count: 3, supplemental: true),
  body: Faker::Lorem.paragraph(sentence_count: 5, supplemental: true),
  build_id: build_ids.sample
  )
end

posts = Post.all
post_ids = []
posts.each do |post|
  post_ids << post.id
end

8.times do
  user = users.sample
  Comment.create!(
    user_id: user.id,
    post_id: post_ids.sample,
    body: Faker::Games::Dota.quote(hero: "#{user.username}")
  )
end