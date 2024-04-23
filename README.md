# StringCalculator

StringCalculator is a Ruby class which expects a string of comma separated numbers and returns sum of those numbers

## Installation

Clone the repository first.

```bash
git clone https://github.com/RorDevAlt/string-calculator.git
```
Then install required ruby version and Gemfile using bundle

```bash
rvm install ruby-3.3.0
bundle install
```

## Usage

```ruby
StringCalculator.add('1,2,3')
# returns 6

StringCalculator.add("1\n2,3")
# returns 6

StringCalculator.add("//;\n1;2")
# returns 3
```

## Running test cases

Run below command to run Rspecs.
```bash
rspec
```