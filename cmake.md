# CMake

## Init
```
cmake .
cmake --build .
```

## Modern CMake
- To configure: `cmake -S . -B build`
- To configure: `cmake -S . -B build -G Ninja`
- To build: `cmake --build build`
- To test: `cmake --build build --target test`
- To docs: `cmake --build build --target docs`

## #include
### < versus "
- " will check in current directory
- < will check at the beginning of include path

### cout
- `using namespace std` is not the best solution for cout
- `using std:cout` will not bring in all the symbols

## OOP
- multilevel inhertiance != multiple inheritance
- both are possible in C++


