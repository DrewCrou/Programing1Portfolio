import java.util.Scanner;

class Main {
  public static void main(String[] args) {
    Scanner scan = new Scanner(System.in);
    System.out.println("Please enter a word to convert to pig latin: ");
    String word = scan.nextLine();
    String Str = new String(word);
    System.out.println(Str.toLowerCase());
    char firstLetter = word.charAt(0);
    String restOfWord = word.substring(1);
    char ch = firstLetter;
    System.out.println(restOfWord.toLowerCase() + Character.toLowerCase(ch) + "ay");
        ch = firstLetter;
  }
}