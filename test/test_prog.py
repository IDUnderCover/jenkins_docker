#!/usr/bin/env python
# coding=utf-8

import unittest

class TestHelloMethod(unittest.TestCase):
    def setUp(self):
        pass

    def tearDown(self):
        pass

    def test_hello(self):
        self.assertEqual('hello'.upper(), 'HELLO')

    def test_split(self):
        s = 'hello world'
        self.assertEqual(s.split(), ['hello', 'world'])

def test_suite():
    tests = ['test_hello', 'test_split']
    return unittest.TestSuite(map(TestHelloMethod, tests))

def test_suite_2():
    suite = unittest.TestSuite()
    suite.addTest(TestHelloMethod('test_hello'))
    suite.addTest(TestHelloMethod('test_split'))
    return suite


if __name__ == '__main__':
    td = unittest.TestLoader().loadTestsFromTestCase(TestHelloMethod)

    ttr = unittest.TextTestRunner(verbosity=2)
    ttr.run(test_suite())
    ttr.run(td)
