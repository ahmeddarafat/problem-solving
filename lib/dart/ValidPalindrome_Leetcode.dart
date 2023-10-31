// Problem Name: Valid Palindrome
// Problem Link: https://leetcode.com/problems/valid-palindrome/

void main() {
  final s = Solution();
  print(s.isPalindrome("Amma"));
  print(s.isPalindrome("race a car"));
  print(s.isPalindrome("A man, a plan, a canal: Panama"));
}

// -----------------------------------

/// Solutions

// 1st solution (without built-in mehtods)
class Solution {
  bool isPalindrome(String s) {
    if (s.isEmpty) return true;

    // convert chars to lowercase & remove spaces and sympols
    for (int i = 0; i < s.length; i++) {
      var char = s[i].codeUnits.first;
      if (char > 64 && char < 91) {
        s = replaceChar(s, char + 32, i);

        // do nothing if lowercase or numbers
      } else if ((char > 96 && char < 123) || (char > 47 && char < 58)) {
        // do nothing...
      } else {
        s = removeChar(s, i);
        i--;
      }
    }
    print(s);
    int p1 = 0, p2 = s.length - 1;
    for (int i = 0; i < s.length / 2; i++) {
      if (s[p1] != s[p2]) return false;
      p1++;
      p2--;
      print(p1);
      print(p2);
    }
    return true;
  }

  String replaceChar(String str, int char, int position) {
    return str.substring(0, position) +
        String.fromCharCode(char) +
        str.substring(position + 1);
  }

  String removeChar(String str, int position) {
    return str.substring(0, position) + str.substring(position + 1);
  }
}

// 2st solution (with built-in mehtods)
class Solution2 {
  bool isPalindrome(String s) {
    if (s.isEmpty) return true;

    s = s.toLowerCase();

    final bag = StringBuffer();

    for (int i = 0; i < s.length; i++) {
      int char = s.codeUnitAt(i);
      if ((char > 47 && char < 58) || (char > 96 && char < 123)) {
        bag.write(s[i]);
      }
    }
    int p1 = 0, p2 = bag.length - 1;
    s = bag.toString();
    for (int i = 0; i < s.length / 2; i++) {
      if (s[p1] != s[p2]) return false;
      p1++;
      p2--;
      print(p1);
      print(p2);
    }
    return true;
  }
}

// ----------------------------------------------------

/// More Soluiton

// class Solution {
//     public boolean isPalindrome(String s) {
//         if (s.isEmpty()) {
//         	return true;
//         }
//         int start = 0;
//         int last = s.length() - 1;
//         while(start <= last) {
//         	char currFirst = s.charAt(start);
//         	char currLast = s.charAt(last);
//         	if (!Character.isLetterOrDigit(currFirst )) {
//         		start++;
//         	} else if(!Character.isLetterOrDigit(currLast)) {
//         		last--;
//         	} else {
//         		if (Character.toLowerCase(currFirst) != Character.toLowerCase(currLast)) {
//         			return false;
//         		}
//         		start++;
//         		last--;
//         	}
//         }
//         return true;
//     }
// }
