use std::fs;

// Part 2
fn is_invalid(num_str: &str) -> bool {
    let len = num_str.len();
    
    for pattern_len in 1..len {
        if len % pattern_len == 0 {
            let pattern = &num_str[..pattern_len];
            if pattern.repeat(len / pattern_len) == num_str {
                return true;
            }
        }
    }
    false
}

fn main() {
    let file_path = "input";
    println!("In file {file_path}");

    let contents = fs::read_to_string(file_path)
        .expect("Should have been able to read the file");

    let ranges = contents.split(",");

    let mut count = 0;
    for range in ranges{
        // We split each range into its bounds and convert to integers.
        let bounds: Vec<i64> = range
            .split("-")
            .map(|s| s.trim().parse().unwrap())
            .collect();
        let start = bounds[0];
        let end = bounds[1];
        // We iterate over the range
        for i in start..=end {
            /* Part 1:
            let mid = s.len() / 2;
            let (first_half, second_half) = s.split_at(mid);
            if first_half == second_half && s.len() % 2 == 0 {
                count += i;
             */

            let s = i.to_string();
            if is_invalid(&s) {
                count += i;
            }
        }
    }
    println!("Count of numbers with repeating halves: {}", count);

}