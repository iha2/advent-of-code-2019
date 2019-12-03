import readline from "readline";
import { createReadStream } from "fs";

const readInterface = readline.createInterface({
  input: createReadStream("inputs/input-1-2019.txt"),
});

// Part 1

const createFuel = value => (Math.floor(value / 3) - 2);
let totalFuel = 0;

readInterface.on("line", line => {
  const fuel = createFuel(Number(line));
  totalFuel = totalFuel + fuel;
});

readInterface.on("close", () => console.log("total fuel", totalFuel));

// Part 2

const maxiumFuelRequirement = value => {
  let currentFuel = createFuel(value);
  let fuelChange = currentFuel;  
  while(true) {
    fuelChange = createFuel(fuelChange);
    console.log(fuelChange);
    if (fuelChange < 0) break;
    currentFuel += fuelChange;    
  }

  return currentFuel;
}

let maximumTotalFuel = 0;

readInterface.on("line", line => {
  const fuel = maxiumFuelRequirement(Number(line));
  maximumTotalFuel = maximumTotalFuel + fuel;
});

readInterface.on("close", () => console.log("total fuel", maximumTotalFuel));


