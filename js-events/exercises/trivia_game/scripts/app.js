window.onload = function() {
  console.log('Loaded, bro');
  var startButton = document.getElementById('start');
  var resetButton = document.getElementById('reset');

  // sets an event listener that listens for the uses click
  // once the button is clicked it triggers an anonymous function
  // that calls triviaGame.start()
  startButton.addEventListener('click', function() {
    triviaGame.start()
  })
  
  // startButton.addEventListener('click', triviaGame.start)
}


var triviaGame = {
    triviaQuestions: {
      1: {
          question: "What color is the sky?",
          answers: {
            a1: {text: "blue", key: true},
            a2: {text: "red", key: false},
            a3: {text: "green", key: false},
            a4: {text: "black", key: false}
          }
        },
      2: {
        question: "What color is the dirt?",
        answers: {
          a1: {text: "brown", key: true},
          a2: {text: "red", key: false},
          a3: {text: "green", key: false},
          a4: {text: "pink", key: false}
        }
      }
    },

  score: 0,
  progress: 0,

  start: function() {
    this.loadQuestion('1');
  },

  loadQuestion: function(questionKey) {
    // set our variables
    var self = this
    var questionContainer = document.querySelector('.question-container');
    var questionDisplay = document.querySelector('.question');
    var answerDisplay = document.querySelector('.answers-container');

    // selects a node from the DOM whose class is .score
    // var scoreDisplay = document.querySelector('.score');
    // sets the inner text of the scoreDisplay node to "Score 0"
    // scoreDisplay.innerHTML = `Score: ${this.score}`;
    
    // abstracted the above code into a function called add score
    this.addScore()
    
    // reset question and answers
    questionDisplay.innerText = ""
    answerDisplay.innerHTML = ""

    // set question
    questionDisplay.innerText = this.triviaQuestions[questionKey].question
    questionContainer.setAttribute("data-answer", questionKey)
    
    // loop to build our answer
     for (answer in this.triviaQuestions[questionKey].answers) {
       var answerContainer = document.createElement('div')
       var data = this.triviaQuestions[questionKey].answers[answer]
       console.log(data)
       
       answerContainer.setAttribute('class', answer)
       answerContainer.setAttribute('class', "answer")
       answerContainer.setAttribute('data-answer', data.key)
       answerContainer.innerText = data.text
     
       // self refers to this `this` 
       answerContainer.onclick = function() {
        // triviaGame.checkAnswer(this)
         self.checkAnswer(this) // `this` is the node that was clicked
       }
      
        answerDisplay.appendChild(answerContainer)
      }
      // add an event listener to check if the answer is right

  },
  addScore: function() {
    // selects a node from the DOM whose class is .score
    var scoreDisplay = document.querySelector('.score');
    // sets the inner text of the scoreDisplay node to "Score 0"
    scoreDisplay.innerHTML = `Score: ${this.score}`;
  },

  checkAnswer: function(answerNode) {
    this.progress += 1
    
    if (answerNode.getAttribute('data-answer') === 'true') {
      this.score += 1
      answerNode.style.backgroundColor = "green"
      this.nextQuestion(answerNode)
    } else {
      answerNode.style.backgroundColor = "red"
      this.nextQuestion(answerNode)
    }
    // node.getAttribute('data-answer')
    // answerNode contains the node/html element that was clicked in loadQuestion
  },

  nextQuestion: function(answer) {
    var self = this;
    
    setTimeout(function() { 
      if (!triviaGame.checkGameEnd()) {
        triviaGame.loadQuestion((self.progress + 1).toString())
      } else {
        triviaGame.triggerWinState()
      }
    }, 500)
    // need to use setTimeout to move to the next question
  },


  checkGameEnd: function() {
    // check to see whether the users progress is equal to the number of questions in the game
    return this.progress === Object.keys(this.triviaQuestions).length
  },

  reset: function() {
    var questionDisplay = document.querySelector('.question');
    var answerDisplay = document.querySelector('.answers-container');
    var scoreDisplay = document.querySelector('.score');

    this.progress = 0
    this.score = 0

    questionDisplay.innerText = ""
    answerDisplay.innerHTML = ""
    scoreDisplay.innerText = `Score: ${this.score}`;
  },

  triggerWinState: function() {
    var self = this;
    var scoreDisplay = document.querySelector('.score');
    scoreDisplay.innerText = `Score: ${this.score}`;

    setTimeout(function() {
      alert(`Game over! Your score is ${self.score} out of ${Object.keys(self.triviaQuestions).length}`)
      triviaGame.reset()
    }, 400)
  }
} // end of game object
