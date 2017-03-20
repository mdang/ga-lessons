function Car(make, model, year, color, seats, passengers) {
  this.make = make;
  this.model = model;
  this.year = year;
  this.color = color;
  this.seats = seats;
  this.passengers = passengers || [];

  this.running = false;
  this.owner = 'manufacturer';
  this.previousOwners = [];
}

Car.prototype.sell = function(newOwner) {
  this.previousOwners.push(this.owner);
  this.owner = newOwner;
};

Car.prototype.paint = function(newColor) {
  this.color = newColor;
};

// Phase 2

Car.prototype.start = function() {
  this.running = true;
};

Car.prototype.off = function() {
  this.running = false;
};

Car.prototype.driveTo = function(destination) {
  if (this.running) {
    console.log('driving to ' + destination);
    return true;
  }
  return false;
};

Car.prototype.park = function() {
  if (!this.running) {
    console.log('Parked!');
    return true;
  }
  return false;
};

// phase 3

Car.prototype.pickUp = function(name) {
  if (this.running && this.passengers.length + 1 < this.seats) {
    this.passengers.push(name);
    console.log('driving to pick up ' + name);
    return true;
  }
  return false;
};

Car.prototype.dropOff = function(name) {
  var passenger = this.passengers.indexOf(name);
  if (passenger > -1 && this.running) {
    this.passengers.splice(passenger, 1);
    return true;
  }
  return false;
};

Car.prototype.passengerCount = function() {
  return this.passengers.length;
};

// export the Car function for use in other files
module.exports = Car;
