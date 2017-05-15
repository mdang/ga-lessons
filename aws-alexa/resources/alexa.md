# Alexa

### Prerequisites

- [AWS Account](https://aws.amazon.com/)
- [Create a Developer Portal Account](https://developer.amazon.com/edw/home.html)
- Alexa-enabled device for testing (Optional)
  * Companion App - http://alexa.amazon.com/

## Why Develop for Alexa?

- Millions of devices sold to date (Estimated 11 million)
- Top sellers on Amazon during Christmas 2016
- Companies need developers to build out skills (e.g. Starbucks)

## How Alexa Works

When a user speaks to an Alexa-enabled device, the speech is streamed to the Alexa service in the cloud. Alexa recognizes the speech, determines what the user wants, and then sends a structured request to the particular skill that can fulfill the user’s request. All speech recognition and conversion is handled by Alexa in the cloud.
Every Alexa skill has an interaction model defining the words and phrases users can say to make the skill do what they want. The type of skill you build dictates the interaction model that Alexa uses to communicate with your users.

## Alexa Skills

- [Alexa Skills Kit](https://developer.amazon.com/alexa-skills-kit)

### Skill Types 

- [Custom Skills](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/overviews/understanding-custom-skills)
- [Smart Home Skill API](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/overviews/understanding-the-smart-home-skill-api) - The Smart Home Skill API enables you to create skills to control cloud-connected devices
- [Flash Briefing Skill API](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/understanding-the-flash-briefing-skill-api) - A Flash Briefing Skill provides content for a customer’s Flash Briefing, and so when you create a Flash Briefing skill, you have a chance for your original content to reach customers on a daily basis.

[Understanding the Different Types of Skills](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/understanding-the-different-types-of-skills)

## Custom Skills

1. Define `intents` (Requests the skills can handle)
  - **Look up tide information**
  - **Order a pizza**
  - **Request a taxi**
2. The words users say to make (or invoke) those requests. This is the interaction model, and it provides the `voice user interface` by which users communicate with the skill.
  - **Get high tide for Seattle** (this phrase would be mapped to a TideRequest intent)
  - **Order a large pepperoni pizza** (this phrase would be mapped to an OrderPizza intent)
  - **Order a car** (this phrase would be mapped to an OrderCar intent)
3. The name Alexa uses to identify your skill, called the `invocation name`. Users include this when making a request. For example, the skill for looking up tides could be called “tide pooler”.

> User: get high tide for Seattle from Tide Pooler

- [Understanding Custom Skills](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/overviews/understanding-custom-skills)

### Hosting Custom Skills

* [AWS Lambda](http://aws.amazon.com/lambda/)
* [Custom Web Service](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/developing-an-alexa-skill-as-a-web-service)

## Create a Custom Skill

[Steps to Build a Custom Skill](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/overviews/steps-to-build-a-custom-skill)

### 1. Design a Voice User Interface

- [Defining the Voice User Interface](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/defining-the-voice-interface)
- [Voice Design Best Practices](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/alexa-skills-kit-voice-design-best-practices)
- [Understanding How Users Interact with Skills](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/understanding-how-users-interact-with-skills)

Create your intent schema. This is a JSON structure which declares the set of requests (“intents”) your service can accept and handle.
```js
// IntentSchema.json
{
  "intents": [
    {
      "intent": "HelloWorldIntent"
    },
    {
      "intent": "AMAZON.HelpIntent"
    }
  ]
}
```

Intents can optionally support named parameters with `slots`. Alexa will pass these values to the Lambda function when invoked.

```js
{
  "intents": [
    {
      "intent": "GetHoroscope",
      "slots": [
        {
          "name": "Sign",
          "type": "LIST_OF_SIGNS"
        },
        {
          "name": "Date",
          "type": "AMAZON.DATE"
        }
      ]
    },
    {
      "intent": "GetLuckyNumbers"
    }
  ]
}
```

You can then access `slot` variables like so within Node: 
```
intent.slots.Sign.value
```

[Slot Type Reference](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/slot-type-reference)

Create a set of sample utterances that map to your intents. These are the phrases users say when interacting with your skill.

```
HelloWorldIntent say hello
HelloWorldIntent say hello world
HelloWorldIntent hello
HelloWorldIntent say hi
HelloWorldIntent say hi world
HelloWorldIntent hi
HelloWorldIntent how are you
```

If you have slots defined, you can create a sample utterance like so:

```
GetHoroscopeIntent what will the horoscope for {Sign} be on {Date}
```

### 2. Set up the Skill

- [Registering and Managing Custom Skills in the Developer Portal](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/registering-and-managing-alexa-skills-in-the-developer-portal)
- [Choose Invocation Name](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/choosing-the-invocation-name-for-an-alexa-skill)

### 3. Write and Test the Code for Your Skill

- [Creating an AWS Lambda Function for a Custom Skill](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/developing-an-alexa-skill-as-a-lambda-function)
- [Fill in Lambda Function endpoints in the Developer Portal](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/registering-and-managing-alexa-skills-in-the-developer-portal)
- [Test your skill with the Service Simulator or an Alexa-enabled device](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/testing-an-alexa-skill)

### 4. Submit the Skill 

- [Submitting the Skill for Certification](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/publishing-an-alexa-skill)

## Code Samples

- [Alexa Skills Kit SDK for Node.js](https://github.com/alexa/alexa-skills-kit-sdk-for-nodejs)
- https://github.com/amzn/alexa-skills-kit-js/tree/master/samples/helloWorld
