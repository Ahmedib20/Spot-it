import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/model/hotels.dart';
import 'package:spot_it/model/landmarks.dart';
import 'package:spot_it/model/place.dart';
import 'package:spot_it/model/resturaunt.dart';

Map<String, List<Map<String, dynamic>>> dummyList = {
  "Landmarks": [
    {
      "placeName": "Eiffel Tower",
      "description": "Iconic wrought-iron lattice tower",
      "address": "Champ de Mars, 5th arr., 75007 Paris, France",
      "latitude": 48.8584,
      "longitude": 2.2945,
      "imageUrl": kplace1,
      "ratings": 4.8
    },
    {
      "placeName": "Colosseum",
      "description": "Flavian Amphitheatre in Rome, Italy.",
      "address": "Via del Colosseo, 1, 00184 Roma RM, Italy",
      "latitude": 41.8902,
      "longitude": 12.5083,
      "imageUrl": kplace2,
      "ratings": 4.7
    },
    {
      "placeName": "Taj Mahal",
      "description": "White marble mausoleum in Agra, India.",
      "address": "Agra, Uttar Pradesh, India",
      "latitude": 27.1732,
      "longitude": 77.5966,
      "imageUrl": kplace1,
      "ratings": 4.9
    },
    {
      "placeName": "Great Wall of China",
      "description":
          "Series of fortifications built along ancient Chinese borders.",
      "address": "Various locations along the Chinese border",
      "latitude": 40.1194,
      "longitude": 116.2299,
      "imageUrl": kplace2,
      "ratings": 4.6
    },
    {
      "placeName": "Chichen Itza",
      "description": "Maya archaeological site in Yucatán, Mexico.",
      "address": "Chichen Itza, Yucatán, Mexico",
      "latitude": 20.6828,
      "longitude": -88.5688,
      "imageUrl": kplace1,
      "ratings": 4.8
    },
    {
      "placeName": "Machu Picchu",
      "description": "Inca citadel in Peru.",
      "address": "Machu Picchu District, Peru",
      "latitude": -13.1633,
      "longitude": -71.9720,
      "imageUrl": kplace2,
      "ratings": 4.9
    },
    {
      "placeName": "Angkor Wat",
      "description": "Temple complex in Cambodia.",
      "address": "Krong Siem Reap, Cambodia",
      "latitude": 13.4125,
      "longitude": 103.8667,
      "imageUrl": kplace1,
      "ratings": 4.7
    },
    {
      "placeName": "Petra",
      "description": "Ancient city in Jordan.",
      "address": "Petra, Jordan",
      "latitude": 30.3283,
      "longitude": 35.4435,
      "imageUrl": kplace2,
      "ratings": 4.8
    },
    {
      "placeName": "Great Pyramid of Giza",
      "description": "Largest ancient monument in the world.",
      "address": "Giza Plateau, Egypt",
      "latitude": 29.9792,
      "longitude": 31.1357,
      "imageUrl": kplace1,
      "ratings": 4.9
    },
    {
      "placeName": "Statue of Liberty",
      "description": "Copper statue on Liberty Island in New York Harbor.",
      "address": "Liberty Island, New York, NY, USA",
      "latitude": 40.6892,
      "longitude": -74.0445,
      "imageUrl": kplace2,
      "ratings": 4.8
    },
    {
      "placeName": "Eiffel Tower",
      "description": "Iconic wrought-iron lattice tower",
      "address": "Champ de Mars, 5th arr., 75007 Paris, France",
      "latitude": 48.8584,
      "longitude": 2.2945,
      "imageUrl": kplace1,
      "ratings": 4.8
    },
    {
      "placeName": "Colosseum",
      "description": "Flavian Amphitheatre in Rome, Italy.",
      "address": "Via del Colosseo, 1, 00184 Roma RM, Italy",
      "latitude": 41.8902,
      "longitude": 12.5083,
      "imageUrl": kplace2,
      "ratings": 4.7
    },
    {
      "placeName": "Taj Mahal",
      "description": "White marble mausoleum in Agra, India.",
      "address": "Agra, Uttar Pradesh, India",
      "latitude": 27.1732,
      "longitude": 77.5966,
      "imageUrl": kplace1,
      "ratings": 4.9
    },
    {
      "placeName": "Great Wall of China",
      "description":
          "Series of fortifications built along ancient Chinese borders.",
      "address": "Various locations along the Chinese border",
      "latitude": 40.1194,
      "longitude": 116.2299,
      "imageUrl": kplace2,
      "ratings": 4.6
    },
    {
      "placeName": "Chichen Itza",
      "description": "Maya archaeological site in Yucatán, Mexico.",
      "address": "Chichen Itza, Yucatán, Mexico",
      "latitude": 20.6828,
      "longitude": -88.5688,
      "imageUrl": kplace1,
      "ratings": 4.8
    },
    {
      "placeName": "Machu Picchu",
      "description": "Inca citadel in Peru.",
      "address": "Machu Picchu District, Peru",
      "latitude": -13.1633,
      "longitude": -71.9720,
      "imageUrl": kplace2,
      "ratings": 4.9
    },
    {
      "placeName": "Angkor Wat",
      "description": "Temple complex in Cambodia.",
      "address": "Krong Siem Reap, Cambodia",
      "latitude": 13.4125,
      "longitude": 103.8667,
      "imageUrl": kplace1,
      "ratings": 4.7
    },
    {
      "placeName": "Petra",
      "description": "Ancient city in Jordan.",
      "address": "Petra, Jordan",
      "latitude": 30.3283,
      "longitude": 35.4435,
      "imageUrl": kplace2,
      "ratings": 4.8
    },
    {
      "placeName": "Great Pyramid of Giza",
      "description": "Largest ancient monument in the world.",
      "address": "Giza Plateau, Egypt",
      "latitude": 29.9792,
      "longitude": 31.1357,
      "imageUrl": kplace1,
      "ratings": 4.9
    },
    {
      "placeName": "Statue of Liberty",
      "description": "Copper statue on Liberty Island in New York Harbor.",
      "address": "Liberty Island, New York, NY, USA",
      "latitude": 40.6892,
      "longitude": -74.0445,
      "imageUrl": kplace2,
      "ratings": 4.8
    }
  ],

  // Restaurants ==========
  "Restaurants": [
    {
      "placeName": "Nobu",
      "description": "Japanese-Peruvian fusion restaurant chain.",
      "address": "Multiple locations worldwide",
      "latitude": 34.0417,
      "longitude": -118.2437,
      "imageUrl": kres1,
      "ratings": 4.6
    },
    {
      "placeName": "Per Se",
      "description":
          "Michelin-starred modern American restaurant in New York City.",
      "address": "10 Columbus Circle, New York, NY 10019, USA",
      "latitude": 40.7667,
      "longitude": -73.9833,
      "imageUrl": kres1,
      "ratings": 4.9
    },
    {
      "placeName": "Eleven Madison Park",
      "description":
          "Michelin-starred modern American restaurant in New York City.",
      "address": "11 Madison Ave, New York, NY 10010, USA",
      "latitude": 40.7582,
      "longitude": -73.9857,
      "imageUrl": kres2,
      "ratings": 4.8
    },
    {
      "placeName": "Central Restaurant",
      "description": "Famous restaurant in Havana, Cuba.",
      "address": "Calle 23 e/ G y H, Vedado, La Habana, Cuba",
      "latitude": 23.1327,
      "longitude": -82.3821,
      "imageUrl": kres1,
      "ratings": 4.7
    },
    {
      "placeName": "Le Bernardin",
      "description":
          "Michelin-starred French seafood restaurant in New York City.",
      "address": "155 W 51st St, New York, NY 10019, USA",
      "latitude": 40.7637,
      "longitude": -73.9817,
      "imageUrl": kres2,
      "ratings": 4.9
    },
    {
      "placeName": "Dishoom",
      "description":
          "Indian restaurant chain with locations in London and Edinburgh.",
      "address": "Multiple locations in London and Edinburgh",
      "latitude": 51.5154,
      "longitude": -0.1410,
      "imageUrl": kres1,
      "ratings": 4.5
    },
    {
      "placeName": "NOMA",
      "description":
          "Michelin-starred Nordic restaurant in Copenhagen, Denmark.",
      "address": "Strandgade 90, 1401 København K, Denmark",
      "latitude": 55.6841,
      "longitude": 12.5945,
      "imageUrl": kres2,
      "ratings": 4.9
    },
    {
      "placeName": "Asador Etxebarri",
      "description": "Michelin-starred Basque grill restaurant in Spain.",
      "address": "Atxondo, Spain",
      "latitude": 43.2028,
      "longitude": -2.4786,
      "imageUrl": kres1,
      "ratings": 4.7
    },
    {
      "placeName": "Gaggan",
      "description":
          "Michelin-starred modern Indian restaurant in Bangkok, Thailand.",
      "address":
          "69/1 Soi Thonglor 17, Khwaeng Bang Kapi, Khet Bang Kapi, Krung Thep Maha Nakhon 10310, Thailand",
      "latitude": 13.7561,
      "longitude": 100.5592,
      "imageUrl": kres2,
      "ratings": 4.8
    },
    {
      "placeName": "Alinea",
      "description":
          "Michelin-starred modern American restaurant in Chicago, USA.",
      "address": "1723 N Halsted St, Chicago, IL 60614, USA",
      "latitude": 41.9041,
      "longitude": -87.6314,
      "imageUrl": kres1,
      "ratings": 4.9
    },
    {
      "placeName": "Nobu",
      "description": "Japanese-Peruvian fusion restaurant chain.",
      "address": "Multiple locations worldwide",
      "latitude": 34.0417,
      "longitude": -118.2437,
      "imageUrl": kres1,
      "ratings": 4.6
    },
    {
      "placeName": "Per Se",
      "description":
          "Michelin-starred modern American restaurant in New York City.",
      "address": "10 Columbus Circle, New York, NY 10019, USA",
      "latitude": 40.7667,
      "longitude": -73.9833,
      "imageUrl": kres1,
      "ratings": 4.9
    },
    {
      "placeName": "Eleven Madison Park",
      "description":
          "Michelin-starred modern American restaurant in New York City.",
      "address": "11 Madison Ave, New York, NY 10010, USA",
      "latitude": 40.7582,
      "longitude": -73.9857,
      "imageUrl": kres2,
      "ratings": 4.8
    },
    {
      "placeName": "Central Restaurant",
      "description": "Famous restaurant in Havana, Cuba.",
      "address": "Calle 23 e/ G y H, Vedado, La Habana, Cuba",
      "latitude": 23.1327,
      "longitude": -82.3821,
      "imageUrl": kres1,
      "ratings": 4.7
    },
    {
      "placeName": "Le Bernardin",
      "description":
          "Michelin-starred French seafood restaurant in New York City.",
      "address": "155 W 51st St, New York, NY 10019, USA",
      "latitude": 40.7637,
      "longitude": -73.9817,
      "imageUrl": kres2,
      "ratings": 4.9
    },
    {
      "placeName": "Dishoom",
      "description":
          "Indian restaurant chain with locations in London and Edinburgh.",
      "address": "Multiple locations in London and Edinburgh",
      "latitude": 51.5154,
      "longitude": -0.1410,
      "imageUrl": kres1,
      "ratings": 4.5
    },
    {
      "placeName": "NOMA",
      "description":
          "Michelin-starred Nordic restaurant in Copenhagen, Denmark.",
      "address": "Strandgade 90, 1401 København K, Denmark",
      "latitude": 55.6841,
      "longitude": 12.5945,
      "imageUrl": kres2,
      "ratings": 4.9
    },
    {
      "placeName": "Asador Etxebarri",
      "description": "Michelin-starred Basque grill restaurant in Spain.",
      "address": "Atxondo, Spain",
      "latitude": 43.2028,
      "longitude": -2.4786,
      "imageUrl": kres1,
      "ratings": 4.7
    },
    {
      "placeName": "Gaggan",
      "description":
          "Michelin-starred modern Indian restaurant in Bangkok, Thailand.",
      "address":
          "69/1 Soi Thonglor 17, Khwaeng Bang Kapi, Khet Bang Kapi, Krung Thep Maha Nakhon 10310, Thailand",
      "latitude": 13.7561,
      "longitude": 100.5592,
      "imageUrl": kres2,
      "ratings": 4.8
    },
    {
      "placeName": "Alinea",
      "description":
          "Michelin-starred modern American restaurant in Chicago, USA.",
      "address": "1723 N Halsted St, Chicago, IL 60614, USA",
      "latitude": 41.9041,
      "longitude": -87.6314,
      "imageUrl": kres1,
      "ratings": 4.9
    }
  ],

  // Hotels  ======

  "Hotels": [
    {
      "placeName": "The Ritz-Carlton",
      "description": "Luxury hotel in various locations.",
      "address": "Paris, France",
      "latitude": 48.864716,
      "longitude": 2.349014,
      "imageUrl": kHotel1,
      "ratings": 4.9
    },
    {
      "placeName": "Burj Al Arab",
      "description": "Iconic luxury hotel in Dubai.",
      "address": "Dubai, UAE",
      "latitude": 25.1412,
      "longitude": 55.1853,
      "imageUrl": kHotel2,
      "ratings": 4.8
    },
    {
      "placeName": "Waldorf Astoria",
      "description": "Famous luxury hotel in New York City.",
      "address": "301 Park Ave, New York, NY 10022, USA",
      "latitude": 40.7567,
      "longitude": -73.9746,
      "imageUrl": kHotel1,
      "ratings": 4.7
    },
    {
      "placeName": "Marina Bay Sands",
      "description": "Luxury hotel with a rooftop infinity pool in Singapore.",
      "address": "10 Bayfront Ave, Singapore 018956",
      "latitude": 1.2834,
      "longitude": 103.8607,
      "imageUrl": kHotel2,
      "ratings": 4.8
    },
    {
      "placeName": "Four Seasons",
      "description": "Luxury hotel in various locations worldwide.",
      "address": "Various locations worldwide",
      "latitude": 40.7128,
      "longitude": -74.0060,
      "imageUrl": kHotel1,
      "ratings": 4.9
    },
    {
      "placeName": "The Plaza",
      "description": "Historic luxury hotel in New York City.",
      "address": "768 5th Ave, New York, NY 10019, USA",
      "latitude": 40.7645,
      "longitude": -73.9740,
      "imageUrl": kHotel2,
      "ratings": 4.7
    },
    {
      "placeName": "The Peninsula",
      "description": "Luxury hotel in Hong Kong.",
      "address": "Salisbury Road, Hong Kong",
      "latitude": 22.2969,
      "longitude": 114.1722,
      "imageUrl": kHotel1,
      "ratings": 4.8
    },
    {
      "placeName": "The Savoy",
      "description": "Luxury hotel in London, England.",
      "address": "The Strand, London, England",
      "latitude": 51.5101,
      "longitude": -0.1209,
      "imageUrl": kHotel2,
      "ratings": 4.9
    },
    {
      "placeName": "Mandarin Oriental",
      "description": "Luxury hotel in Bangkok, Thailand.",
      "address": "48 Oriental Ave, Bangkok 10500, Thailand",
      "latitude": 13.7234,
      "longitude": 100.5144,
      "imageUrl": kHotel1,
      "ratings": 4.8
    },
    {
      "placeName": "Taj Lake Palace",
      "description": "Heritage hotel in Udaipur, India.",
      "address": "Pichola, Udaipur, Rajasthan 313001, India",
      "latitude": 24.5787,
      "longitude": 73.6806,
      "imageUrl": kHotel2,
      "ratings": 4.9
    },
    {
      "placeName": "The Ritz-Carlton",
      "description": "Luxury hotel in various locations.",
      "address": "Paris, France",
      "latitude": 48.864716,
      "longitude": 2.349014,
      "imageUrl": kHotel1,
      "ratings": 4.9
    },
    {
      "placeName": "Burj Al Arab",
      "description": "Iconic luxury hotel in Dubai.",
      "address": "Dubai, UAE",
      "latitude": 25.1412,
      "longitude": 55.1853,
      "imageUrl": kHotel2,
      "ratings": 4.8
    },
    {
      "placeName": "Waldorf Astoria",
      "description": "Famous luxury hotel in New York City.",
      "address": "301 Park Ave, New York, NY 10022, USA",
      "latitude": 40.7567,
      "longitude": -73.9746,
      "imageUrl": kHotel1,
      "ratings": 4.7
    },
    {
      "placeName": "Marina Bay Sands",
      "description": "Luxury hotel with a rooftop infinity pool in Singapore.",
      "address": "10 Bayfront Ave, Singapore 018956",
      "latitude": 1.2834,
      "longitude": 103.8607,
      "imageUrl": kHotel2,
      "ratings": 4.8
    },
    {
      "placeName": "Four Seasons",
      "description": "Luxury hotel in various locations worldwide.",
      "address": "Various locations worldwide",
      "latitude": 40.7128,
      "longitude": -74.0060,
      "imageUrl": kHotel1,
      "ratings": 4.9
    },
    {
      "placeName": "The Plaza",
      "description": "Historic luxury hotel in New York City.",
      "address": "768 5th Ave, New York, NY 10019, USA",
      "latitude": 40.7645,
      "longitude": -73.9740,
      "imageUrl": kHotel2,
      "ratings": 4.7
    },
    {
      "placeName": "The Peninsula",
      "description": "Luxury hotel in Hong Kong.",
      "address": "Salisbury Road, Hong Kong",
      "latitude": 22.2969,
      "longitude": 114.1722,
      "imageUrl": kHotel1,
      "ratings": 4.8
    },
    {
      "placeName": "The Savoy",
      "description": "Luxury hotel in London, England.",
      "address": "The Strand, London, England",
      "latitude": 51.5101,
      "longitude": -0.1209,
      "imageUrl": kHotel2,
      "ratings": 4.9
    },
    {
      "placeName": "Mandarin Oriental",
      "description": "Luxury hotel in Bangkok, Thailand.",
      "address": "48 Oriental Ave, Bangkok 10500, Thailand",
      "latitude": 13.7234,
      "longitude": 100.5144,
      "imageUrl": kHotel1,
      "ratings": 4.8
    },
    {
      "placeName": "Taj Lake Palace",
      "description": "Heritage hotel in Udaipur, India.",
      "address": "Pichola, Udaipur, Rajasthan 313001, India",
      "latitude": 24.5787,
      "longitude": 73.6806,
      "imageUrl": kHotel2,
      "ratings": 4.9
    }
  ],
};

List<Place> selectedCategoryDummyList = <Place>[
  Resturaunt(
    placeName: 'placeName',
    address: 'address',
    description: 'description',
    imageUrl: kres2,
    latitude: 1111.1111,
    longitude: 1111.111,
    rating: 111.111,
  ),
  LandMarks(
    placeName: 'placeName',
    address: 'address',
    description: 'description',
    imageUrl: kres1,
    latitude: 1111.1111,
    longitude: 1111.111,
    rating: 111.111,
  ),
  Hotels(
    placeName: 'placeName',
    address: 'address',
    description: 'description',
    imageUrl: kres1,
    latitude: 1111.1111,
    longitude: 1111.111,
    rating: 111.111,
  )
];

List<Place> highRatesDummyList = [
  LandMarks(
    placeName: 'placeName',
    address: 'address',
    description: 'description',
    imageUrl: kres2,
    latitude: 1111.1111,
    longitude: 1111.111,
    rating: 111.111,
  ),
  Hotels(
    placeName: 'placeName',
    address: 'address',
    description: 'description',
    imageUrl: kres2,
    latitude: 1111.1111,
    longitude: 1111.111,
    rating: 111.111,
  ),
  Resturaunt(
    placeName: 'placeName',
    address: 'address',
    description: 'description',
    imageUrl: kres1,
    latitude: 1111.1111,
    longitude: 1111.111,
    rating: 111.111,
  ),
  Resturaunt(
    placeName: 'placeName',
    address: 'address',
    description: 'description',
    imageUrl: kres1,
    latitude: 1111.1111,
    longitude: 1111.111,
    rating: 111.111,
  ),
  LandMarks(
    placeName: 'placeName',
    address: 'address',
    description: 'description',
    imageUrl: kres2,
    latitude: 1111.1111,
    longitude: 1111.111,
    rating: 111.111,
  ),
  LandMarks(
    placeName: 'placeName',
    address: 'address',
    description: 'description',
    imageUrl: kres2,
    latitude: 1111.1111,
    longitude: 1111.111,
    rating: 111.111,
  ),
];
