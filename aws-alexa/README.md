# Alexa with AWS Lambda Functions

### Prerequisites

- [AWS Account](https://aws.amazon.com/)
- [Developer Portal Account](https://developer.amazon.com/edw/home.html)
- Alexa-enabled device for testing (Optional)
  * Companion App - http://alexa.amazon.com/

## Why Develop for Alexa?

- Millions of devices sold to date (Estimated 11 million)
- Top sellers on Amazon during Christmas 2016
- Companies need developers to build out skills (e.g. Starbucks)

## How Alexa Works

When a user speaks to an Alexa-enabled device, the speech is streamed to the Alexa service in the cloud. Alexa recognizes the speech, determines what the user wants, and then sends a structured request to the particular skill that can fulfill the user’s request. All speech recognition and conversion is handled by Alexa in the cloud.

Every Alexa skill has an interaction model defining the words and phrases users can say to make the skill do what they want. The type of skill you build dictates the interaction model that Alexa uses to communicate with your users.

![Alexa Architecture](https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/dex/ask-customskills/ASKArchitecture._TTH_.png)

## Skill APIs

- [Smart Home Skill API](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/overviews/understanding-the-smart-home-skill-api) - Enables you to create skills to control cloud-connected devices
- [Flash Briefing Skill API](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/understanding-the-flash-briefing-skill-api) - Provides content for a customer's Flash Briefing, so when you create a Flash Briefing skill, you have a chance for your original content to reach customers on a daily basis.

## Custom Skills

* Define `intents`, which are the requests the skills can handle. You might want users to be able to: 
  - Look up tide information
  - Order a pizza
  - Request a taxi
* Define the actual words users can say to make (or invoke) those requests. This is the interaction model, and it provides the `voice user interface` by which users communicate with the skill.
  - **Get high tide for Seattle** (this phrase would be mapped to a TideRequest intent)
  - **Order a large pepperoni pizza** (this phrase would be mapped to an OrderPizza intent)
  - **Order a car** (this phrase would be mapped to an OrderCar intent)
* The name Alexa uses to identify your skill is called the `invocation name`. Users include this when making a request. For example, the skill for looking up tides could be called “tide pooler”.

Example requests from users: 

- Alexa, get high tide for Seattle from Tide Pooler
- Alexa, ask Recipes how do I make an omelet?
- Alexa, ask Daily Horoscopes about Taurus
- Alexa, give ten points to Stephen using Score Keeper

## WikiWiki

Let's develop our own custom skill called **WikiWiki** that will enlighten us with a random article from Wikipedia. 


## Obtaining the Data

> https://en.wikipedia.org/w/api.php?format=json&action=query&generator=random&grnnamespace=0&grnlimit=1&prop=extracts

```json
{
  "batchcomplete": "",
  "continue": {
    "grncontinue": "0.191143582002|0.191143844641|12875949|0",
    "continue": "grncontinue||"
  },
  "query": {
    "pages": {
      "47133328": {
        "pageid": 47133328,
        "ns": 0,
        "title": "Hypatima scopulosa",
        "extract": "<p><i><b>Hypatima scopulosa</b></i> is a moth in the Gelechiidae family. It was described by Meyrick in 1913. It is found in southern India.</p>\n<p>The wingspan is about 12 mm. The forewings are brown irregularly mixed with fuscous and sprinkled with whitish and with a small darker brown basal patch, and two small spots transversely placed in the disc beyond this. There is a suffused dark grey triangular blotch occupying the median third of the costa and reaching two-thirds across the wing, its apical portion with several irregular black marks. There is also a short black mark resting on the termen in the middle. The hindwings are grey, paler and thinly scaled anteriorly, darker towards the apex and termen.</p>\n<h2><span id=\"References\">References</span></h2>"
      }
    }
  }
}
```




## Resources 

- [Alexa Skills Kit SDK for Node.js](https://github.com/alexa/alexa-skills-kit-sdk-for-nodejs)
- [HelloWorld with Alexa](https://github.com/amzn/alexa-skills-kit-js/tree/master/samples/helloWorld)
- [Steps to Build a Custom Skill](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/overviews/steps-to-build-a-custom-skill)
- [Understanding the Different Types of Skills](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/understanding-the-different-types-of-skills)
- [Understanding Custom Skills](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/overviews/understanding-custom-skills)
- [Defining the Voice User Interface](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/defining-the-voice-interface)
- [Voice Design Best Practices](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/alexa-skills-kit-voice-design-best-practices)
- [Understanding How Users Interact with Skills](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/understanding-how-users-interact-with-skills)
- [Registering and Managing Custom Skills in the Developer Portal](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/registering-and-managing-alexa-skills-in-the-developer-portal)
- [Choose Invocation Name](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/choosing-the-invocation-name-for-an-alexa-skill)
- [Custom Web Service](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/developing-an-alexa-skill-as-a-web-service)
- [Creating an AWS Lambda Function for a Custom Skill](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/developing-an-alexa-skill-as-a-lambda-function)
- [Fill in Lambda Function endpoints in the Developer Portal](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/registering-and-managing-alexa-skills-in-the-developer-portal)
- [Test your skill with the Service Simulator or an Alexa-enabled device](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/testing-an-alexa-skill)
