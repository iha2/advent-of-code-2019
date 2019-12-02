use std::fs;

fn calculate_fuel(mass: i32) -> f64 {
    let value:f64 = f64::from(mass) / 3.0;
    return value - 2.0;
}


fn main() {
    let file_contents = fs::read_to_string("inputs/input-1-2019.txt").expect("File import does not work");
    let lines = file_contents.split("\n").collect();
    let values = lines.map(|s| s.to_string()).remove(lines.len() - 1);
    let onlyValues = values.map(|line| line.parse::<i32>());
     

    for line in files {
        match line {
            Ok(value) => println!("{}", value),
            Err(e) => println!("{}", e),
        }
    }
}
