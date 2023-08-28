# C++

## #define versus constant
- A constant is better because it has an address in memory.
- Back in the day in C only #define could define a constant

## When to use #define
### Cross-compilation
```cpp
#ifdef DEBUG
// some code
#endif
```

## Variables initialization
### Modern way
list initialization == uniform initialization == brace initialization

```c++
int width { 5 };
int height = { 6 };
int depth {};
```

### maybe_unused
```c++
[[maybe_unused]] int x { 5 };
```

### Suboptimal, you need to learn the whole code to understand
```c++
int main()
{
	int x{}, y{}, sum{}; // how are these used?

	std::cout << "Enter an integer: ";
	std::cin >> x;

	std::cout << "Enter another integer: ";
	std::cin >> y;

	sum = x + y;
	std::cout << "The sum is: " << sum << '\n';

	return 0;
}
```

## Namespace
### Warning


## Preprocessor
- instructions only valid for one file
- does NOT understand C++ code
- it does not understand that #define was called inside a function
- from top to bottom of file
- puts the content of another file into the current: `#include <iostream>`

### #if 0: to comment out code that has already multi-line comments
```c++
#include <iostream>

int main()
{
    std::cout << "Joe\n";

#if 0 // Don't compile anything starting here
    std::cout << "Bob\n";
    /* Some
     * multi-line
     * comment here
     */
    std::cout << "Steve\n";
#endif // until this point

    return 0;
}
```

## Header files
To maximize the chance that missing includes will be flagged by compiler, order your #includes as follows:

- The paired header file
- Other headers from your project
- 3rd party library headers
- Standard library headers

The headers for each grouping should be sorted alphabetically (unless the documentation for a 3rd party library instructs you to do otherwise).

Avoid using-directives (such as using namespace std;) at the top of your program or in header files. They violate the reason why namespaces were added in the first place.


## Numbers
- `1.2e4 = 12 x 10.power(4)`
- `double y{5.0}`   // no suffix means double by default
- `float  z{5.0f}`


## cout
- `std::setprecision(17)` // 3.33333330


## string
### std::string_view @ C++17
- Do not pass std::string by value, as making copies of std::string is expensive. Prefer std::string_view parameters.
- you need to reset the view (sv = s) if the initial s string changed
- you need to reset the view after `remove_prefix()` and `remove_suffix()`
### std::string_literals
But it is okay to use C-style string literal most of the time.
```c++
using namespace std::string_literals; // easy access to the s suffix

std::cout << "foo\n";   // no suffix is a C-style string literal
std::cout << "goo\n"s;  // s suffix is a std::string literal
```
### constexpr std::string
Very limited case. Use `std::string_view` instead.

## Operator precedence and associativity
### Compiler does not always evaluate from left to right.
#### Bad
```cpp
int getValue()
{
    std::cout << "Enter an integer: ";

    int x{};
    std::cin >> x;
    return x;
}

int main()
{
    std::cout << getValue() + (getValue() * getValue()) << '\n'; // a + (b * c)
    return 0;
}
```
#### Good
```cpp
    int a{ getValue() }; // will execute first
    int b{ getValue() }; // will execute second
    int c{ getValue() }; // will execute third

    std::cout << a + (b * c) << '\n'; // order of eval doesn't matter now
}
```

#### More bad!
```cpp
int x { 5 };
int value{ add(x, ++x) }; // undefined behavior: is this 5 + 6, or 6 + 6?
// It depends on what order your compiler evaluates the function arguments in

std::cout << value << '\n';
// value could be 11 or 12, depending on how the above line evaluates!
```

### Is odd test can't be tricky with negative numbers
Remainder will be `-1` for negative number;
#### Bad
```cpp
bool isOdd(int x) {
    return (x % 2) == 1;
}
```
#### Good
```cpp
bool isOdd(int x) {
    return (x % 2) != 0;
}
```

### Increment / decrement operator
- Strongly favor the prefix version: more performant and less strange issues
- Warnings
    - C++ does not define the order of evaluation for function arguments or the operands of operators.
    - Don’t use a variable that has a side effect applied to it more than once in a given statement. If you do, the result may be undefined.

### Ternary operator (aka conditional operator)
`larger = (x > y) ? x : y;`

#### Good
```cpp
    constexpr bool inBigClassroom { false };
    constexpr int classSize { inBigClassroom ? 30 : 20 };
    std::cout << "The class size is: " << classSize << '\n';
```

#### Bad: variable dies after if
```cpp
    constexpr bool inBigClassroom { false };

    if (inBigClassroom)
        constexpr int classSize { 30 };
    else
        constexpr int classSize { 20 };
```

#### Bad: way too long
```cpp
#include <iostream>

int getClassSize(bool inBigClassroom)
{
    if (inBigClassroom)
        return 30;

    return 20;
}

int main()
{
    const int classSize { getClassSize(false) };
    std::cout << "The class size is: " << classSize << '\n';

    return 0;
}
```


## Leet Code

### Top Interview 150
#### Valid Anagram
- Sort letters in each string then compare
- count++ from first string then count-- from second string then check of != 0

#### Contains Duplicate II
