// Quiz: For and Functions
//
// Question 3: One of the common techniques in web site
// translation is to replace each literal English string
// with a function call that takes that string as a
// parameter and returns a translated string.
//
// Assume that this code is correct.  Replace each literal
// English string with a call to the localized_text(),
// passing in the literal string as an argument.

App.User.prototype.greetingString = function() {
    var partialString = "Hello, ";
    partialString += this.firstName() + '! ';
    partialString += "We hope you enjoy using our website!"

    return partialString;
};
