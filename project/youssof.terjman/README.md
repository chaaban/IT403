# Word Frequency Counter
This Bash script reads a text file and counts the occurrences of each word. It then displays the top N most frequently occurring words.

## Prerequisites
To run this script, you need to have Bash installed on your system.
make sure the script is executable , if its not then use this:
```
chmod +x word_frequency.sh
```

## Usage
```
$ bash word_frequency_counter.sh <file_name>
```
Replace <file_name> with the name of the text file you want to analyze.

## Functionality
1. The script checks if a file name is provided as an argument. If no file name is provided, it displays an error message and exits.
2. It checks if the file exists. If the file does not exist, it displays an error message and exits.
3. The script reads the file and removes punctuation, converts all text to lowercase, and splits each line into words.
4. It counts the occurrences of each word using an associative array.
5. The script calculates the total number of words in the file.
6. It displays the top N most frequently occurring words, along with their counts and percentages.

## Customization

you can customize the script by modifying the followinf variables:

**N**: The number of most frequently occurring words to display. By default, it is set to 10.

## Example

Let's say you have a text file named sample.txt containing the following text:

```
Hello, how are you? I hope you are doing well. How's the weather today? It's sunny outside.
```
To run the script and analyze the word frequencies in sample.txt, execute the following command:

```
$ bash word_frequency_counter.sh sample.txt
```

the output will be:
```
Top 10 most frequently occurring words in sample.txt:
how: 2 times (25.00%)
are: 2 times (25.00%)
you: 2 times (25.00%)
hello: 1 times (12.50%)
i: 1 times (12.50%)
hope: 1 times (12.50%)
doing: 1 times (12.50%)
well: 1 times (12.50%)
the: 1 times (12.50%)
weather: 1 times (12.50%)
```
