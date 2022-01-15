#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import mypackage as mp
from mypackage import mymodule as mm

def main():
    print(mp.__name__)
    mp.hello_mypackage()
    print(mm.__name__)
    mm.hello_mymodule()

if __name__ == '__main__':
    main()

