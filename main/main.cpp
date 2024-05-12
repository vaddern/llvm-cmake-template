#include "a.h"
#include <iostream>

int main() {
  std::cout << "APP: Hello World! " << "Return from lib a: 0x" << std::hex
            << getA() << std::endl;
  return 0;
}
