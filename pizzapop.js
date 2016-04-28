count = {};
function countPopularity(json) {
  for(i = 0; i < json.length; i++) {
    for(j = 0; j < json[i]["toppings"].length; j++) {

    var topping = json[i]["toppings"][j]
    if (count[topping] !== undefined){
      count[topping] += 1;
    } else {
      count[topping] = 1;
    }
    }
  }
}

var sortable = [];
function sortByPopularity(count) {
  for (var topping in count) {
    sortable.push([topping, count[topping]]);
  }
  sortable.sort(function(a, b) {return b[1] - a[1]});
}

function favoriteToppings(num, sortable) {
  return sortable.slice(0,num)
}

//here's some stuff to test it

//here's a small sample in the same format as the JSON object
countPopularity([{"toppings": ["pepperoni", "sausage"]}, {"toppings": ["pepperoni"]}, {"toppings": ["sausage"]}, {"toppings": ["sausage"]}, {"toppings": ["sausage"]}, {"toppings": ["anchovies"]}]);

//this checks to see if the count object is iterating properly
console.log(count);

//this should move the toppings into a 2d array to make it easier to sort
sortByPopularity(count);
console.log(sortable);

//this should print the most popular X toppings
console.log(favoriteToppings(2, sortable))
